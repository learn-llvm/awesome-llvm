#!/bin/bash
# shellcheck disable=SC2086
LLVM_MONOREPO="git@github.com:llvm/llvm-project.git"

set -e

source "$(dirname $0)"/setup.rc

export CC=clang CXX=clang++

# https://llvm.org/docs/GettingStarted.html
build() {
    git_clone_or_update "${GIT_OPTS}" "${LLVM_MONOREPO}" "${LLVM_SRC_DIR}"
    cd "${ROOT_DIR}" || exit
    cmake -B build -S llvm \
      -DCMAKE_INSTALL_PREFIX=${LLVM_INS_DIR} \
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

set +e
