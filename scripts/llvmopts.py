#!/usr/bin/env python3

from __future__ import print_function
import os
import sys
import subprocess

# default_flags = "-std-link-opts"
passed_arg_prefix = "Pass Arguments:"
unknown_option_pattern = "Unknown command line argument"

opt_flags = sys.argv[1:]

opt_args = ["opt"] + opt_flags + ["-disable-output", "-debug-pass=Arguments"]

p = subprocess.Popen(opt_args, stdin=open(os.devnull, 'r'), stdout=subprocess.PIPE, stderr=subprocess.PIPE)
arg_bytes = p.communicate()[1].rstrip()
arg_str = arg_bytes.decode("utf-8")
if unknown_option_pattern in arg_str:
    print(arg_str, file=sys.stderr)
    sys.exit(1)

output_list = arg_str.split('\n')
print("passed flags: " + " ".join(opt_flags))
for output in output_list:
    if output.startswith(passed_arg_prefix):
        print("=" * 20)
        naked_args = output[len(passed_arg_prefix):].strip()
        print(naked_args.replace(" ", "\n"))
