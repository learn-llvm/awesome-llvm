#!/bin/bash
LLVM_MONOREPO="git@github.com:llvm/llvm-project.git"

set -ex

DEPTH_OPTS="--depth 1"
WORKDIR=$(realpath "${PWD}")
ROOT_DIR=${WORKDIR}/git
INSTALL_PREFIX="/usr/local"

export CC=clang
export CXX=clang++

dl_llvm() {
    DIR="$1"
    if [[ -d "${DIR}/.git" ]]; then
        cd "${DIR}"
        git pull
    else
        git clone "${DEPTH_OPTS}" "${LLVM_MONOREPO}" "${DIR}"
    fi
}

# https://llvm.org/docs/GettingStarted.html
build() {
    dl_llvm "${ROOT_DIR}"
    cd "${ROOT_DIR}" || exit
    cmake -B build -S llvm \
      -DCMAKE_INSTALL_PREFIX=${INSTALL_PREFIX} \
      -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
      -DCMAKE_BUILD_TYPE=Release \
      -DBUILD_SHARED_LIBS=ON \
      -DLLVM_ENABLE_PROJECTS="clang;clang-tools-extra;lld;lldb" \
      -DLLVM_ENABLE_RUNTIMES="compiler-rt" \
      -DLLVM_USE_LINKER=gold \
      -DLLVM_PARALLEL_LINK_JOBS=4 \
      -DLLVM_USE_SPLIT_DWARF=ON \
      -DLLVM_OPTIMIZED_TABLEGEN=ON \
      -DLLVM_ENABLE_ASSERTIONS=1 \
      -DLLVM_TARGETS_TO_BUILD="AArch64;X86;RISCV" \
      -G Ninja 
      # -DLLVM_USE_NEWPM=ON \ # this option is REMOVED
    time cmake --build build
    sudo cmake --build build --target install
}

build

set +ex
