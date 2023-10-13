#!/bin/bash
# shellcheck disable=SC2046,SC2091,SC2034,SC2086,SC2164

UCLIBC_REPO=git@github.com:klee/klee-uclibc.git

source "$(dirname $0)"/setup.rc

check_headers(){
    sudo apt install libncurses5-dev -y
}

build_uclibc(){
    set -e
    ROOT_DIR="$1"
    git_clone_or_update ${UCLIBC_REPO} ${ROOT_DIR}
    cd ${ROOT_DIR}
    ./configure --make-llvm-lib
    make KLEE_CFLAGS="-DKLEE_SYM_PRINTF"
    set +e
}

build_uclibc "${UCLIBC_SRC}" 2>&1 | tee "${BAK_DIR}"/log-3-uclibc
