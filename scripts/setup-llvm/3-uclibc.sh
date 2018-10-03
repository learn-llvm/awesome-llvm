#!/bin/bash

UCLIBC_REPO=git@github.com:klee/klee-uclibc.git

check_headers(){
    # locate $1;
    # printf "${YELLOW}Cannot find ${RED}$1${YELLOW}, results of ${RED}apt-file${ENDCOLOR}\n"
    # apt-file search $1
    # printf "${YELLOW}Choose one deb to install${ENDCOLOR}\n"
    sudo aptitude install libncurses5-dev -y
}

build_uclibc(){
    set -e
    # export CFLAGS=-std=c99
    # export CXXFLAGS=-std=c++11
    git_clone_or_update ${UCLIBC_REPO} ${UCLIBC_SRC}
    export C_INCLUDE_PATH=/usr/include/c++/${GCC_VER}/x86_64-linux-gnu:/usr/include/x86_64-linux-gnu
    export CPLUS_INCLUDE_PATH=/usr/include/c++/${GCC_VER}/x86_64-linux-gnu:/usr/include/x86_64-linux-gnu
    check_headers ncurses.h
    cd ${UCLIBC_SRC}
    ./configure --make-llvm-lib --with-llvm-config=${M_LLVM_OBJ}/Release+Asserts/bin/llvm-config --with-cc=${M_LLVM_OBJ}/Release+Asserts/bin/clang
    # cp ${UCLIBC_LLVM} .
    make clean
    make -j$(nproc --ignore=8) #--debug=b 
    cd ${MAIN_DIR}
    set +e
}

source $(dirname $0)/setup.rc
build_uclibc 2>&1 | tee ${BAK_DIR}/log-3-uclibc
