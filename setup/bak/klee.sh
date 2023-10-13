#!/bin/bash
# shellcheck disable=SC2046,SC2091,SC2034,SC2086,SC2164

sudo apt install build-essential cmake curl file g++-multilib gcc-multilib git libcap-dev libgoogle-perftools-dev libncurses5-dev libsqlite3-dev libtcmalloc-minimal4 python3-pip unzip graphviz doxygen

source "$(dirname $0)"/setup.rc
KLEE_LLVM_SRC="${G_LLVM_SRC}"
KLEE_LLVM_OBJ="${G_LLVM_OBJ}"
# KLEE_REPO=git@github.com:klee/klee.git
KLEE_REPO=git@github.com:klee/klee.git

ensure_klee_dir(){
    rm -rf "${KLEE_OBJ}" "${KLEE_INSTALL}"
    mkdir -p "${KLEE_OBJ}" "${KLEE_INSTALL}"
}

build_klee(){
    set -e
    ensure_klee_dir
    git_clone_or_update "${KLEE_REPO}" "${KLEE_SRC}"
    cd "${KLEE_OBJ}"
    CXXFLAGS="-D_GLIBCXX_USE_CXX11_ABI=0" "${KLEE_SRC}"/configure --with-llvmsrc="${M_LLVM_SRC}" --with-llvmobj="${M_LLVM_OBJ}" --prefix="${KLEE_INSTALL}" --with-uclibc="${UCLIBC_SRC}" --with-z3=/usr/local/ --enable-posix-runtime --enable-optimized --enable-cxx11 
    bear make ENABLE_OPTIMIZED=1 -j$(nproc --ignore=8) CC=clang CXX=clang++ 
    # ENABLE_OPTIMIZED=1
    make install
    set +e
}

build_klee 2>&1 | tee ${BAK_DIR}/log-4-klee
