#!/bin/bash
# shellcheck disable=SC2046,SC2091,SC2034,SC2086,SC2164

Z3_REPO=http://z3.codeplex.com/sourcecontrol/latest#README
# z3="git@github.com:Z3Prover/z3.git"

set -e
build_z3() {
	mkdir -p "${Z3_ROOT}"
	git_clone_or_update "${Z3_REPO}" "${Z3_ROOT}"
	rm -rf "${Z3_BUILD}"
	cd "${Z3_SRC}"
	export CC=gcc CXX=g++ && python "${Z3_SCRIPT}"/mk_make.py
	cd "${Z3_BUILD}"
	bear make -j$(nproc)
	sudo make install
}

source $(dirname $0)/setup.rc
build_z3 2>&1 | tee "${BAK_DIR}"/log-2-z3
set +e
