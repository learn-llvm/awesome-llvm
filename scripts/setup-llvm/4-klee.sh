#!/bin/bash

# apt-get install libcap-dev

# G is from git, M is from mirror
KLEE_LLVM_SRC=${M_LLVM_SRC}
KLEE_LLVM_OBJ=${M_LLVM_OBJ}
# KLEE_REPO=git@github.com:klee/klee.git
KLEE_REPO=git@github.com:klee/klee.git

ensure_klee_dir(){
    rm -rf ${KLEE_OBJ} ${KLEE_INSTALL}
    mkdir -p ${KLEE_OBJ} ${KLEE_INSTALL}
}

build_klee(){
    set -ex
    ensure_klee_dir
    git_clone_or_update ${KLEE_REPO} ${KLEE_SRC}
    cd ${KLEE_OBJ}
    CXXFLAGS="-D_GLIBCXX_USE_CXX11_ABI=0" ${KLEE_SRC}/configure --with-llvmsrc=${M_LLVM_SRC} --with-llvmobj=${M_LLVM_OBJ} --prefix=${KLEE_INSTALL} --with-uclibc=${UCLIBC_SRC} --with-z3=/usr/local/ --enable-posix-runtime --enable-optimized --enable-cxx11 
    bear make ENABLE_OPTIMIZED=1 -j$(nproc --ignore=8) CC=clang CXX=clang++ 
    # ENABLE_OPTIMIZED=1
    make install
    set +ex
}

# rm -f ${KLEE_SRC}/include/klee/Config/config.h
source "$(dirname $0)"/setup.rc
build_klee 2>&1 | tee ${BAK_DIR}/log-4-klee

# if ! [ -e ${KLEE_INSTALL}/lib/libkleeRuntimePOSIX.bca ]; then
#     printf "bca file not installed\n"
#     exit 1
# else
#     printf "bitcode library installed\n"
# fi

# strip --strip-debug `which klee`

# # cd ${KLEE_OBJ}
# # make test
# # make doxygen

# cd ${KLEE_SRC}/include/klee/Config/
# ln -sf ../../../../klee-obj/include/klee/Config/config.h .
