#!/bin/bash

WLLVM_REPO=git@github.com:travitch/whole-program-llvm.git

source $(dirname $0)/setup.rc
set -ex
git_clone_or_update ${WLLVM_REPO} ${WLLVM_ROOT}
set +ex
