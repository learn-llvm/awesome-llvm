#!/usr/bin/env python3

import subprocess
import tempfile
import sys
import os
import json
import shlex
from io import BytesIO

c_compiler = "clang"
cpp_compiler = "clang++"
cdb_fname = "cc.json"


def get_ccjson() -> str:
    tf = tempfile.NamedTemporaryFile(suffix=".json", delete=False)
    return tf.name

def wrapped_cmd(cli_list: list[str]) -> str:
    ccjson = ""
    found = False
    for opt in cli_list:
        if opt == "-MJ":
            found = True
        elif found:
            ccjson = opt
            break
    if found:
        if ccjson == "":
            raise RuntimeError("cdb file unspecified, cmd may be wrong; CMD: {}".format(" ".join(cli_list)))
        else:
            print("-MJ already specified, NO-OP")
            return  ccjson
    ccjson = get_ccjson()
    cmd_str = cli_list[0]
    cc = os.path.split(cmd_str)[-1]
    if cc in ["clang", "gcc", "cc"]:
        cli_list[0] = "{} -MJ {}".format(c_compiler, ccjson)
        return ccjson
    elif cc in ["clang++", "g++", "c++"]:
        cli_list[0] = "{} -MJ {}".format(cpp_compiler, ccjson)
        return ccjson
    else:
        raise RuntimeError("{} not a compiler command".format(cmd_str))


def gen_cc(cli_list: list[str]) -> str:
    ccjson = wrapped_cmd(cli_list)
    cli_str = " ".join(cli_list)
    print("CMD: " + cli_str)
    subprocess.call(shlex.split(cli_str))
    return ccjson


def update_cdb_file(ccjson: str):
    """
    add starting "[\n";
    last 2 bytes are ",\n", we would like to change to "\n]"
    """
    bio = BytesIO()
    bio.write(b"[\n")
    with open(ccjson, "rb+") as cdbf:
        for line in cdbf.readlines():
            bio.write(line)
    bio.seek(-2, 2)
    bio.write(b"\n]")
    bytes = bio.getbuffer().tobytes()
    data = bytes.decode("utf-8")
    jobject = json.loads(data)
    with open(cdb_fname, 'w') as outf:
        json.dump(jobject, outf, sort_keys=True, indent=2, ensure_ascii=False)
        print("CDB {} created!".format(cdb_fname))


if __name__ == "__main__":
    args = sys.argv[1:]
    ccjson = gen_cc(args)
    if not os.path.isfile(ccjson):
        raise RuntimeError("{} not generated".format(ccjson))
    update_cdb_file(ccjson)
