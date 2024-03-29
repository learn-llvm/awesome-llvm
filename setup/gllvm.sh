#!/bin/bash
# shellcheck disable=SC2046,SC2091,SC2034,SC2086,SC2164

set -e
go get github.com/SRI-CSL/gllvm/cmd/...
which gclang
which gclang++
which gflang
which get-bc
which gsanity-check
set +e
