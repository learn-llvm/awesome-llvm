#!/usr/bin/env python3

from __future__ import print_function
import os
import sys
import subprocess
import shutil
import tempfile
import platform

if len(sys.argv) < 2:
    print("usage: {} llvm.ll".format(sys.argv[1]))
    sys.exit(1)

ir_file = os.path.abspath(sys.argv[1])
ir_name = os.path.basename(ir_file)

temp_dir = tempfile.gettempdir()

os.chdir(temp_dir)

if len(sys.argv) == 3:
    more_args = sys.argv[2]
else:
    more_args = ""

temp_file = os.path.join(temp_dir, ir_name)
shutil.copy2(ir_file, temp_file)

opt_plugin_args = ""

opt_str = "opt {} {} -dot-callgraph {} -disable-output".format(
    opt_plugin_args, more_args, temp_file
)
print(opt_str)
p1 = subprocess.call(opt_str.split())

dot_fname = "callgraph.dot"
out_pdf = os.path.splitext(temp_file)[0] + ".pdf"
dot_str = "dot -Tpdf {} -o {}".format(dot_fname, out_pdf)
print(dot_str)
subprocess.call(dot_str.split())

open_cmd = "open" if platform.system() == "Darwin" else "xdg-open"
os.system("{} {} &".format(open_cmd, out_pdf))
