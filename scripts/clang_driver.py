#!/usr/bin/env python3

import os
import sys
import subprocess


def normalize(p):
    p = p.strip()
    if p.startswith('-L'):
        p = p[2:]
        assert(os.path.exists(p))
        return '-L' + os.path.normpath(p)
    if os.path.exists(p):
        return os.path.normpath(p)
    return p


options = sys.argv[1:]
cmd = 'clang -### {}'.format(' '.join(options))
proc = subprocess.Popen(
    cmd.split(),
    stdout=subprocess.PIPE,
    stderr=subprocess.PIPE)
proc.wait()
err = proc.communicate()[1].decode('utf-8')

for line in err.splitlines():
    if '"' not in line:
        continue
    line = line.replace('"', '')
    l_list = [normalize(p) for p in line.split()]
    for l in l_list:
        if l.startswith('-'):
            print('\n' + l, end='')
        else:
            print(' ' + l, end='')
    print('\n')
