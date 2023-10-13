#!/bin/bash

MY_REPO=git@bitbucket.org:HongxuChen/seraph.git

build_marple(){
    set -ex
    CC=clang
    CXX=clang++
    git_clone_or_update ${MY_REPO} ${MARPLE_ROOT} && check_dir ${MARPLE_ROOT}
    rm -rf ${MARPLE_BUILD}
    mkdir ${MARPLE_BUILD} && cd ${MARPLE_BUILD}
    cmake -GNinja ${MARPLE_ROOT}
    ninja
    set +ex
}

source ${HOME}/.zshrc
source $(dirname $0)/setup.rc
echo "$(whoami)"
build_marple 2>&1 | tee ${BAK_DIR}/log-3-marple
