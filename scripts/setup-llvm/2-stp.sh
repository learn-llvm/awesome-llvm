#!/bin/bash

# sudo apt-get install -y bison flex libboost-all-dev

STP_REPO=git@github.com:stp/stp.git

ensure_stp_dir(){
    if [ -d ${STP_INSTALL} ]; then
        read -p "Delete ${STP_INSTALL}? (y/N)" yn
        if [[ $yn == 'y' ]] || [[ $yn == 'Y' ]]; then
            sudo rm -rf ${STP_INSTALL}
        fi
    fi
    mkdir -p ${STP_OBJ} ${STP_INSTALL}
}

build_stp() {
    CXX=/usr/bin/g++
    CC=/usr/bin/gcc
    set -ex
    ulimit -s unlimited
    mkdir -p ${STP_ROOT}
    printf "stp_root: ${STP_ROOT}\n"
    git_clone_or_update ${STP_REPO} ${STP_SRC} && check_dir ${STP_SRC}
    ensure_stp_dir
    cd ${STP_OBJ}
    rm -rf ${STP_OBJ}/*
    cmake -DCMAKE_INSTALL_PREFIX=${STP_INSTALL} ${STP_SRC} #-DBOOST_INCLUDE_DIR=${HOME}/.linuxbrew/include
    # ./scripts/configure --with-prefix=${STP_INSTALL} --with-cryptominisat2
    #CFLAGS_M32= prevents -m32 option
    bear -- make CFLAGS_M32= -j$(nproc --ignore=8) #OPTIMIZE=-O0
    sudo make install
    cd ${MAIN_DIR}
    set +ex
}

source $(dirname $0)/setup.rc
touch ${BAK_DIR}/log-2-stp
build_stp 2>&1 | tee ${BAK_DIR}/log-2-stp
