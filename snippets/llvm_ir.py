#!/usr/bin/env python3

import sys
import subprocess
from colorama import init,Fore, Style
import argparse

init()

parser = argparse.ArgumentParser(description="compile c/c++ into llvm IR")
parser.add_argument( "file", metavar="FILE", action="store", help="FILE to be proprecessed")
parser.add_argument( "-compiler", default="clang", help="llvm compatible compiler(default: clang)")
parser.add_argument("-c", action="store_true", help="generate bitcode rather than IR")
parser.add_argument( "--nostd", action="store_true", help="if in arglist, don't add -std=c99/-std=c++11")
parser.add_argument( "-s", action="store_true", help="if in arglist, -print-stats for compilation")
parser.add_argument( "--flags", metavar='"COMPILATION_FLAGS"', help="extra compilation flags(string)")
parser.add_argument( "--of", metavar='"OPT_FLAGS"', help="extra optimization flags(string)")

if len(sys.argv) == 1:
    parser.print_help()
    sys.exit(1)

args = parser.parse_args()
if args.file is None:
    print(Fore.RED, "file not specified, exit", file=sys.stderr)
    sys.exit(1)
inputfile = args.file
src_prefix, src_suffix = tuple(inputfile.rsplit(".", 1))
compiler_flags = [args.compiler, inputfile]

compile_type: str = ""
if src_suffix in ["cc", "cpp", "cxx"]:
    compile_type = "c++"
elif src_suffix == "c":
    compile_type = "c"

if compile_type == "c":
    compiler_flags.extend(["-xc"])
    if not args.nostd:
        compiler_flags.append("-std=c99")
elif compile_type == "c++":
    compiler_flags.extend(["-xc++"])
    if not args.nostd:
        compiler_flags.append("-std=c++11")

compiler_flags.extend(["-c", "-emit-llvm"])

if args.s:
    compiler_flags.extend(["-Xclang", "-print-stats"])

if args.flags:
    compiler_flags.extend(args.flags.split())

compiler_flags.extend(["-o", "-"])

print(Style.BRIGHT, " ".join(compiler_flags), Style.NORMAL)

opt_flags = ["opt"]

if args.of is None:
    opt_flags.extend(["-mem2reg"])
else:
    opt_flags.extend(args.of.split())

if args.c:
    outfile = src_prefix + ".bc"
else:
    opt_flags.append("-S")
    outfile = src_prefix + ".ll"
opt_flags.extend(["-o", outfile])

print(Style.BRIGHT, " ".join(opt_flags), Style.NORMAL)

try:
    p1 = subprocess.Popen(compiler_flags, stdout=subprocess.PIPE)
    p2 = subprocess.Popen(opt_flags, stdin=p1.stdout, stdout=subprocess.PIPE)
except Exception as e:
    print(Fore.RED, e, file=sys.stderr)
    exit(1)
