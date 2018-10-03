#!/bin/bash

Z3_REPO=http://z3.codeplex.com/sourcecontrol/latest#README

build_z3(){
  # set -ex
  mkdir -p ${Z3_ROOT}
  if ! [ -d ${Z3_SRC} ];then
    printf "Goto ${YELLOW}${Z3_REPO}${ENDCOLOR} to Download Z3 zip and rename source root to ${YELLOW}${Z3_SRC}${ENDCOLOR}\n"
    exit
  fi
  rm -rf ${Z3_BUILD}
  cd ${Z3_SRC}
  CC=gcc CXX=g++ && python ${Z3_SCRIPT}/mk_make.py
  cd ${Z3_BUILD}
  bear make -j$(nproc)
  sudo make install
  # set +ex
}

source $(dirname $0)/setup.rc
build_z3 2>&1 | tee ${BAK_DIR}/log-2-z3
