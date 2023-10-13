#!/usr/bin/env python

import os
import shutil
import subprocess
import sys

import yaml
import graphviz

from typing import Dict, List

# https://clang.llvm.org/extra/pp-trace.html

ignore_angled = True

def gen_data(fpath: str, options: List[str]) -> List[Dict[str, str]]:
    cmd_list = [pptrace, '-callbacks=InclusionDirective,moduleImport', fpath]
    if len(options) != 0:
        cmd_list.append('--')
        cmd_list.extend(options)
    p = subprocess.run(cmd_list, capture_output=True, text=True, shell=False)
    if p.returncode != 0:
        print(f"Error when running: {' '.join(cmd_list)}", file=sys.stderr)
        sys.exit(1)
    return yaml.load(p.stdout, Loader=yaml.Loader)


def gen_dot(data: List[Dict[str, str]], fpath: str) -> None:
    if data is None:
        print("No header inclusion found")
        sys.exit(1)
    basename = os.path.basename(fpath)
    dot = graphviz.Digraph(basename, node_attr={'shape': 'rectangle'}, engine='dot')
    dot.node(os.path.abspath(fpath), shape='circle')
    for entry in data:
        is_angled = entry['IsAngled']
        if ignore_angled and is_angled:
            continue
        cb = entry['Callback']
        cur_floc = entry['HashLoc']
        cur_fpath = cur_floc.split(':')[0]
        inc_fpath = entry['File']
        if cb == 'InclusionDirective':
            dot.edge(cur_fpath, inc_fpath, arrowhead='vee')
        elif cb == 'moduleImport':
            dot.edge(cur_fpath, inc_fpath)
        else:
            print(f'cb={cb}, cur_floc={cur_floc}')
    dot.unflatten(stagger=3)
    saved_fpath = dot.render(directory='out')
    print(saved_fpath)

PP_TRACE = 'pp-trace'

pptrace = shutil.which(PP_TRACE)
if pptrace is None:
    print(f'{PP_TRACE} not found', file=sys.stderr)
    sys.exit(1)

if len(sys.argv) < 2:
    print(f'usage: {sys.argv[0]} $FILE <options>', file=sys.stderr)
    sys.exit(1)

fpath = sys.argv[1]
options = sys.argv[2:]

data = gen_data(fpath, options)
gen_dot(data, fpath)
