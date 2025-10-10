import json
import os
import re
import subprocess
from typing import Optional


class CompilerVerInfo:
    """
    A custom data structure to store parsed compiler version information.
    Attribute names are designed to be concise.
    """

    def __init__(self, command: str):
        # The original command used to query the compiler.
        self.cmd: str = command
        # Compiler family, e.g., "GCC", "Clang".
        self.family: Optional[str] = None
        # Main version string.
        self.version: Optional[str] = None
        # Language, e.g., "C", "C++".
        self.lang: Optional[str] = None
        # Target architecture.
        self.target: Optional[str] = None
        # Thread model, e.g., "posix".
        self.thread_model: Optional[str] = None
        # Installation directory.
        self.inst_dir: Optional[str] = None
        # Distribution name or info, e.g., "Ubuntu", "BiSheng Enterprise 3.2.0.B008".
        self.dist: Optional[str] = None
        # Distribution-specific version, e.g., "9ubuntu1".
        self.dist_ver: Optional[str] = None
        # Git commit hash.
        self.commit: Optional[str] = None
        # Git repository description.
        self.git_desc: Optional[str] = None
        # Build configuration info.
        self.build_cfg: Optional[str] = None
        # Copyright string.
        self.copyright: Optional[str] = None
        # Raw output from the --version command.
        self.raw: Optional[str] = None
        # Error message if parsing fails.
        self.error: Optional[str] = None

    def to_dict(self) -> dict:
        """
        Converts the instance to a dictionary for purposes like JSON serialization.
        Includes only non-None values.
        """
        return {k: v for k, v in self.__dict__.items() if v is not None}

    def __repr__(self) -> str:
        """
        Provides a clear, formatted string representation of the object.
        """
        return f"CompilerVerInfo({json.dumps(self.to_dict(), indent=2, ensure_ascii=False)})"


def _parse_gcc_output(output: str, compiler_name: str, info: CompilerVerInfo):
    """
    Helper function to parse GCC/G++ version output and populate a CompilerVerInfo object.

    Args:
        output: The output string from compiler's --version.
        compiler_name: The name of the compiler (e.g., 'gcc', 'g++-13').
        info: The CompilerVerInfo instance to populate.
    """
    info.family = "GCC"
    lines = output.splitlines()

    if not lines:
        info.error = "Empty output from compiler."
        return

    first_line = lines[0]

    match = re.search(r"\s([\d\.]+)$", first_line)
    if match:
        info.version = match.group(1).strip()

    match_dist = re.search(r"\((.*?)\)", first_line)
    if match_dist:
        info.dist = match_dist.group(1).strip()

    for line in lines:
        if "Copyright (C)" in line:
            info.copyright = line.strip()
            break

    if "++" in compiler_name or "g++" in compiler_name:
        info.lang = "C++"
    else:
        info.lang = "C"


def _parse_clang_output(output: str, compiler_name: str, info: CompilerVerInfo):
    """
    Helper function to parse Clang/Clang++ version output and populate a CompilerVerInfo object.

    Args:
        output: The output string from compiler's --version.
        compiler_name: The name of the compiler (e.g., 'clang', 'clang++-17').
        info: The CompilerVerInfo instance to populate.
    """
    info.family = "Clang"
    lines = output.splitlines()

    if not lines:
        info.error = "Empty output from compiler."
        return

    first_line = lines[0]

    version_match = re.search(r"version\s+([^\s(]+)", first_line)
    if version_match:
        info.version = version_match.group(1)

    dist_match = re.search(r"^(.*?)clang version", first_line, re.IGNORECASE)
    if dist_match and dist_match.group(1).strip():
        info.dist = dist_match.group(1).strip()

    extra_info_match = re.search(r"\((.*?)\)", first_line)
    if extra_info_match:
        extra_info = extra_info_match.group(1).strip()
        hash_match = re.search(r"\b([a-f0-9]{8,40})\b", extra_info)
        if hash_match:
            info.commit = hash_match.group(1)
            git_desc = extra_info.replace(hash_match.group(1), "").strip()
            if git_desc:
                info.git_desc = git_desc
        else:
            info.dist_ver = extra_info

    key_map = {
        "target": "target",
        "thread_model": "thread_model",
        "installeddir": "inst_dir",
        "build_config": "build_cfg",
    }
    for line in lines[1:]:
        if ":" in line:
            key, value = line.split(":", 1)
            # Normalize key: "InstalledDir" -> "installeddir"
            normalized_key = key.strip().replace(" ", "_").lower()
            if normalized_key in key_map:
                setattr(info, key_map[normalized_key], value.strip())

    if "++" in compiler_name or "clang++" in compiler_name:
        info.lang = "C++"
    else:
        info.lang = "C"


def get_compiler_ver(compiler_cmd: str) -> CompilerVerInfo:
    """
    Executes the compiler command and parses the output of its --version flag.

    Args:
        compiler_cmd: The compiler command or path (e.g., "gcc", "clang++-17", "~/bin/clang").

    Returns:
        A CompilerVerInfo instance containing the parsed compiler details.
    """
    info = CompilerVerInfo(command=compiler_cmd)
    try:
        expanded_cmd = os.path.expanduser(compiler_cmd)

        proc = subprocess.run(
            [expanded_cmd, "--version"],
            capture_output=True,
            text=True,
            check=True,
            encoding="utf-8",
        )

        output = (proc.stdout + proc.stderr).strip()
        info.raw = output

        compiler_name = os.path.basename(expanded_cmd)

        if "clang" in compiler_name:
            _parse_clang_output(output, compiler_name, info)
        elif "gcc" in compiler_name or "g++" in compiler_name:
            _parse_gcc_output(output, compiler_name, info)
        else:
            if "clang" in output.lower():
                _parse_clang_output(output, compiler_name, info)
            elif (
                "gcc" in output.lower() or "free software foundation" in output.lower()
            ):
                _parse_gcc_output(output, compiler_name, info)
            else:
                info.error = "Unknown compiler type."

    except FileNotFoundError:
        info.error = f"Command '{compiler_cmd}' not found. Please ensure it is in your system's PATH."
    except subprocess.CalledProcessError as e:
        info.error = f"Command '{compiler_cmd}' returned a non-zero exit status."
        info.raw = (e.stdout + e.stderr).strip()
    except Exception as e:
        info.error = f"An unexpected error occurred: {str(e)}"

    return info


if __name__ == "__main__":
    # --- Demo 1: Attempt to parse compilers installed on your system ---
    # Note: The success of this part depends on whether these compilers are installed on your system.
    print("--- Attempting to parse installed compilers on your system ---")
    compilers_to_test = ["gcc", "clang", "g++", "clang++"]
    for compiler in compilers_to_test:
        print(f"\n>>> Parsing: {compiler}")
        version_info = get_compiler_ver(compiler)
        # Use the to_dict() method to convert the result to a dictionary for JSON serialization.
        print(json.dumps(version_info.to_dict(), indent=2, ensure_ascii=False))

    # --- Demo 2: Parse using the provided text examples ---
    # This part does not depend on external commands and directly demonstrates the parsing logic.
    print("\n\n--- Parsing using the provided text examples ---")
    example_outputs = {
        "clang_vanilla": {
            "command": "clang",
            "name": "clang",
            "output": """clang version 20.0.0git (/media/data/llvm/git/clang 30abf3588402e6bf6d3d21668c7506c87090c908)
Target: x86_64-unknown-linux-gnu
Thread model: posix
InstalledDir: /media/data/llvm/git/build/bin
Build config: +assertions""",
        },
        "clang_bisheng": {
            "command": "~/OSS/BiSheng/BiShengCompiler-3.2.0-x86-linux/bin/clang",
            "name": "clang",
            "output": """BiSheng Enterprise 3.2.0.B008 clang version 15.0.4 (1e11b36754d8)
Target: x86_64-unknown-linux-gnu
Thread model: posix
InstalledDir: /root/OSS/BiSheng/BiShengCompiler-3.2.0-x86-linux/bin""",
        },
        "gcc_ubuntu": {
            "command": "gcc",
            "name": "gcc",
            "output": """gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
Copyright (C) 2023 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.""",
        },
        "clangpp_ubuntu": {
            "command": "clang++-17",
            "name": "clang++-17",
            "output": """Ubuntu clang version 17.0.6 (9ubuntu1)
Target: x86_64-pc-linux-gnu
Thread model: posix
InstalledDir: /usr/bin""",
        },
        "gcc_versioned": {
            "command": "gcc-13",
            "name": "gcc-13",
            "output": """gcc-13 (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
Copyright (C) 2023 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.""",
        },
    }

    for key, data in example_outputs.items():
        print(f"\n>>> Simulating parse for: {data['command']}")
        # 1. Create a CompilerVerInfo instance
        info_obj = CompilerVerInfo(command=data["command"])
        info_obj.raw = data["output"]

        # 2. Call the corresponding parsing function to populate the object
        if "clang" in data["name"]:
            _parse_clang_output(data["output"], data["name"], info_obj)
        else:
            _parse_gcc_output(data["output"], data["name"], info_obj)

        # 3. Print the result
        print(json.dumps(info_obj.to_dict(), indent=2, ensure_ascii=False))
