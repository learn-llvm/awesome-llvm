#!/bin/bash

source "$(dirname $0)"/setup.rc
LLVM_GIT_REPO=git@github.com:llvm-mirror/llvm.git
CLANG_TMP_SRC=${G_LLVM_SRC}/tools/clang-${LLVM_VER}
CLANG_SRC=${G_LLVM_SRC}/tools/clang
CLANG_REPO=git@github.com:llvm-mirror/clang.git
CLANG_EXTRA_REPO=git@github.com:llvm-mirror/clang-tools-extra.git
CLANG_EXTRA_SRC=${CLANG_SRC}/tools/extra
TMP_CLANG_DIR=${BAK_DIR}/clang
TMP_EXTRA_DIR=${BAK_DIR}/clang-tools-extra

ensure_dir(){
    mkdir -p ${G_LLVM_ROOT}
    printf "git_llvm_root: ${G_LLVM_ROOT}\n"
    if [ -d $G_LLVM_OBJ ]; then
        read -p "Delete $G_LLVM_OBJ & $G_LLVM_INS? (y/N)" yn
        if [[ $yn == 'y' ]] || [[ $yn == 'Y' ]]; then
            rm -rf $G_LLVM_OBJ $G_LLVM_INS
        fi
    fi
    mkdir -p ${G_LLVM_OBJ} ${G_LLVM_INS}
}

dl_llvm(){
    # 1. clang extras
    if ! [ -d ${CLANG_EXTRA_SRC} ]; then
        git clone --depth 1 ${CLANG_EXTRA_REPO} ${TMP_EXTRA_DIR}
    else
        cd ${CLANG_EXTRA_SRC}
        git up
        cd ${BAK_DIR}
        # move to /tmp
        mv ${CLANG_EXTRA_SRC} ${TMP_EXTRA_DIR}
    fi
    # 2. clang
    if ! [ -d ${CLANG_SRC} ]; then
        git clone --depth 1 ${CLANG_REPO} ${TMP_CLANG_DIR}
    else
        cd ${CLANG_SRC}
        git up
        cd ${BAK_DIR}
        # move to tmp
        mv ${CLANG_SRC} ${TMP_CLANG_DIR}
    fi
    # 3. llvm
    if ! [ -d ${G_LLVM_SRC} ]; then
        git clone --depth 1 ${LLVM_GIT_REPO} ${G_LLVM_SRC}
    else
        cd ${G_LLVM_SRC}
        git up
    fi
    check_dir ${G_LLVM_SRC}
    # move back
    mv ${TMP_CLANG_DIR} ${CLANG_SRC}
    mv ${TMP_EXTRA_DIR} ${CLANG_EXTRA_SRC}
    check_dir ${CLANG_SRC}
}

build_llvm(){
    set -ex
    # ensure_gcc_ver
    ensure_dir
    dl_llvm
    cd ${G_LLVM_OBJ}
    export CC=gcc
    export CXX=g++
    export C_INCLUDE_PATH=/usr/include/c++/${GCC_VER}/x86_64-linux-gnu:/usr/include/x86_64-linux-gnu:${G_LLVM_SRC}/include
    export CPLUS_INCLUDE_PATH=/usr/include/c++/${GCC_VER}/x86_64-linux-gnu:/usr/include/x86_64-linux-gnu:${G_LLVM_SRC}/include

    # build with cmake+ninja/make
    cmake -GNinja ${G_LLVM_SRC} -DLLVM_PREFIX=${G_LLVM_INS} -DCLANG_ENABLE_STATIC_ANALYZER=1 -DLLVM_ENABLE_ASSERTIONS=1 -DCMAKE_BUILD_TYPE=release -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DLLVM_ENABLE_CXX1Y=1 -DCMAKE_INSTALL_PREFIX=${G_LLVM_INS} -DLLVM_BUILD_DOCS=0 -DLLVM_ENABLE_SPHINX=1 -DLLVM_INCLUDE_EXAMPLES=1 -DLLVM_TARGETS_TO_BUILD="X86"
    ninja rebuild_cache
    ninja
    # # ninja install
    # cmake ${G_LLVM_SRC} -DCLANG_ENABLE_STATIC_ANALYZER=1 -DLLVM_ENABLE_ASSERTIONS=1 -DCMAKE_BUILD_TYPE=release -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DLLVM_ENABLE_CXX1Y=1 -DCMAKE_INSTALL_PREFIX=${G_LLVM_INS} -DLLVM_BUILD_DOCS=0 -DLLVM_ENABLE_SPHINX=1 -DLLVM_INCLUDE_EXAMPLES=1 -DLLVM_TARGETS_TO_BUILD="X86"
    # make rebuild_cache
    # make

    # build with autotools
    # ${G_LLVM_SRC}/configure --enable-optimized --enable-assertions --prefix=${G_LLVM_INS} --disable-bootstrap --enable-languages=c,c++ --with-built-clang
    #--enable-profiling --enable-expensive-checks
    # bear -- make -j #$(nproc)
    # make install

    cd ${MAIN_DIR}
    set +ex
}

build_llvm 2>&1 | tee ${BAK_DIR}/log-1-llvm
