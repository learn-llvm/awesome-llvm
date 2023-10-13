#!/bin/bash
# shellcheck disable=SC2046,SC2091,SC2034,SC2086,SC2164

WLLVM_REPO=git@github.com:travitch/whole-program-llvm.git

source $(dirname $0)/setup.rc
set -ex
git_clone_or_update "${WLLVM_REPO}" "${WLLVM_ROOT}"
set +ex
