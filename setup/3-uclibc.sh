#!/bin/bash
# shellcheck disable=SC2046,SC2091,SC2034,SC2086,SC2164

UCLIBC_REPO=git@github.com:klee/klee-uclibc.git

check_headers(){
    sudo aptitude install libncurses5-dev -y
}

build_uclibc(){
    set -e
    echo "TODO"
    set +e
}

source $(dirname $0)/setup.rc
build_uclibc 2>&1 | tee "${BAK_DIR}"/log-3-uclibc
