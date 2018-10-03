#!/bin/bash

ensure_lav_dir(){
    rm -rf ${LAV_OBJ} ${LAV_INSTALL}
    mkdir -p ${LAV_OBJ} ${LAV_INSTALL}
}

build_lav() {
    set -e
    ensure_lav_dir
    cd ${LAV_SRC}
    ${LAV_SRC}/configure --with-llvmsrc=${LLVM_SRC} --with-llvmobj=${LLVM_OBJ} --prefix=${LAV_INSTALL} --enable-z3 
    make clean
    make -j${nproc}
    make install
    set +e
}


source "$(dirname $0)"/setup.rc
build_lav 2>&1 |tee ${WORK_DIR}/log-5-lav
