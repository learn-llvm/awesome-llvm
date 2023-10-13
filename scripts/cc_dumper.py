#!/usr/bin/env python

import argparse
import os
import sys
from enum import Enum
import json

from clang.cindex import Cursor, CursorKind, File, Index, SourceLocation


class Node(object):
    def __init__(self, node_id: int, fqn: str, location: SourceLocation) -> None:
        self.id: int = node_id
        self.fqn: str = fqn
        self.location: SourceLocation = location

    def __str__(self) -> str:
        return self.fqn

    def __repr__(self) -> str:
        return f"{self.id}: {self.fqn}, {self.location}"

class FileKind(Enum):
    CC = 1
    HH = 2
    NN = 3


hh_suffixes = {".h", ".hh", ".hpp", ".hxx"}
cc_suffixes = {".c", ".cc", ".cpp", ".cxx"}


def from_filename(fpath: str) -> FileKind:
    suffix = os.path.splitext(fpath)[-1]
    if suffix in cc_suffixes:
        return FileKind.CC
    elif suffix in hh_suffixes:
        return FileKind.HH
    return FileKind.NN


def parse_args(argv) -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="c/c++ analyzer",
        formatter_class=argparse.ArgumentDefaultsHelpFormatter,
    )
    parser.add_argument("-a", "--analyze", action="store_true" , required=False, help="analyze and print")
    parser.add_argument(
        "files", metavar="FILE", nargs="+", action="store", help="FILES to be analyzed"
    )
    return parser.parse_args(argv)


def dump_all_ast(cursor: Cursor, i: int):
    print(" " * i, cursor.kind, ":", cursor.spelling, "(", cursor.location, ")")
    for child in cursor.get_children():
        dump_all_ast(child, i + 1)


def loc_str(location) -> str:
    if isinstance(location, SourceLocation):
        sloc: SourceLocation = location
        return f"{sloc.file}:{sloc.line}:{sloc.column}"
    raise RuntimeError(f"{location}")

def print_func(cursor: Cursor):
    cursor_kind: CursorKind = cursor.kind
    if cursor_kind is CursorKind.FUNCTION_DECL:
        print(f"{cursor.spelling}: {cursor_kind}, ({loc_str(cursor.location)})")
    if cursor_kind is CursorKind.VAR_DECL:
        print(f"{cursor.spelling}: {cursor_kind}, ({loc_str(cursor.location)})")
    for child in cursor.get_children():
        print_func(child)


def analyze_tu(fpath: str):
    fileKind = from_filename(fpath)
    if fileKind == FileKind.NN:
        return
    tu = Index.create().parse(fpath)
    print(f"=== {fpath} ===")
    # dump_all_ast(tu.cursor, 0)
    print_func(tu.cursor)


def analyze_dir(fpath: str):
    for subf in os.listdir(fpath):
        fullpath = os.path.join(fpath, subf)
        if os.path.isdir(fullpath):
            analyze_dir(fullpath)
        elif os.path.isfile(fullpath):
            analyze_tu(fullpath)
        else:
            print(f"{fpath} not a file/dir", file=sys.stderr)


if __name__ == "__main__":
    parser = parse_args(sys.argv[1:])
    for file in parser.files:
        file = os.path.realpath(file)
        if os.path.isdir(file):
            analyze_dir(file)
        elif os.path.isfile(file):
            analyze_tu(file)
