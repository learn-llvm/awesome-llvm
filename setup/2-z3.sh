#!/bin/bash

Z3_REPO=http://z3.codeplex.com/sourcecontrol/latest#README
z3="git@github.com:Z3Prover/z3.git"

build_z3(){
  # set -ex
  mkdir -p ${Z3_ROOT}
  git_clone_or_update ${Z3_REPO} ${Z3_ROOT}
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
