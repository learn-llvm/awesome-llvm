#!/bin/bash

source $(dirname $0)/setup.rc
LLVM_SRC=${M_LLVM_SRC}
LLVM_OBJ=${M_LLVM_OBJ}

handle_llvm_includes(){
    ###
    CLANG_INC_DIR=${LLVM_SRC}/tools/clang/include/clang
    CLANG_OBJ_INC_DIR=${LLVM_OBJ}/tools/clang/include/clang
    LLVM_INC_DIR=${LLVM_SRC}/include
    inc_files=$(find ${CLANG_OBJ_INC_DIR} -name "*.inc")
    for src_file in ${inc_files}; do
        dest_file=$(echo ${src_file} | sed -e 's/\/obj\//\/src\//g')
        printf "src_file: ${src_file}\ndest_file: ${dest_file}\n"
        ln -sf ${src_file} ${dest_file}
    done
    printf "${CLANG_INC_DIR} --> ${LLVM_INC_DIR}/clang\n"
    ln -sfT ${CLANG_INC_DIR} ${LLVM_INC_DIR}/clang
    ###
    CLANG_C_INC_DIR=${LLVM_SRC}/tools/clang/include/clang-c
    printf "${CLANG_C_INC_DIR} --> ${LLVM_INC_DIR}/clang-c\n"
    ln -sfT ${CLANG_C_INC_DIR} ${LLVM_INC_DIR}/clang-c
    ###
    LLVM_INC_DIR=${LLVM_SRC}/include/llvm
    LLVM_OBJ_INC_DIR=${LLVM_OBJ}/include/llvm
    llvm_inc_files=$(find ${LLVM_OBJ_INC_DIR} -name "*.h")
    for inc in ${llvm_inc_files}; do
        dest_file=$(echo ${inc} | sed -e 's/\/obj\//\/src\//g')
        printf "src_file: ${src_file}\ndest_file: ${dest_file}\n"
        ln -sf ${inc} ${dest_file}
    done
}

handle_llvm_includes
