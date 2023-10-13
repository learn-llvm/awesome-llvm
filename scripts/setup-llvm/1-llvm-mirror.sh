#!/usr/bin/env bash

source $(dirname $0)/setup.rc

if [ ${LLVM_VER} == '3.3' ]; then
  ## for 3.3
  M_LLVM_URL=http://llvm.org/releases/3.3/llvm-3.3.src.tar.gz
  M_CLANG_URL=http://llvm.org/releases/3.3/cfe-3.3.src.tar.gz
  M_CLANG_EXTRA_URL=http://llvm.org/releases/3.3/clang-tools-extra-3.3.src.tar.gz

elif [ ${LLVM_VER} == '3.4' ]; then
  ## for 3.4.2
  M_LLVM_URL=http://llvm.org/releases/3.4.2/llvm-3.4.2.src.tar.gz
  M_CLANG_URL=http://llvm.org/releases/3.4.2/cfe-3.4.2.src.tar.gz
  M_CLANG_EXTRA_URL=http://llvm.org/releases/3.4/clang-tools-extra-3.4.src.tar.gz
elif [ ${LLVM_VER} == '3.5' ];then
  ## for 3.5
  M_LLVM_URL=http://llvm.org/releases/3.5.0/llvm-3.5.0.src.tar.xz
  M_CLANG_URL=http://llvm.org/releases/3.5.0/cfe-3.5.0.src.tar.xz
  M_CLANG_EXTRA_URL=http://llvm.org/releases/3.5.0/clang-tools-extra-3.5.0.src.tar.xz
elif [ ${LLVM_VER} == '3.6' ];then
  ## for 3.6
  M_LLVM_URL=http://llvm.org/releases/3.6.2/llvm-3.6.2.src.tar.xz
  M_CLANG_URL=http://llvm.org/releases/3.6.2/cfe-3.6.2.src.tar.xz
  M_CLANG_EXTRA_URL=http://llvm.org/releases/3.6.2/clang-tools-extra-3.6.2.src.tar.xz
elif [ ${LLVM_VER} == '3.7' ];then
  ## for 3.7
  M_LLVM_URL=http://llvm.org/releases/3.7.1/llvm-3.7.1.src.tar.xz
  M_CLANG_URL=http://llvm.org/releases/3.7.1/cfe-3.7.1.src.tar.xz
  M_CLANG_EXTRA_URL=http://llvm.org/releases/3.7.1/clang-tools-extra-3.7.1.src.tar.xz
else
  printf "Illegal LLVM_VER value ${LLVM_VER}"
  exit
fi

M_LLVM_TAR="${M_LLVM_URL##*/}"
M_CLANG_TAR="${M_CLANG_URL##*/}"
M_CLANG_EXTRA_TAR="${M_CLANG_EXTRA_URL##*/}"

M_CLANG_ROOT=${M_LLVM_SRC}/tools/clang
M_CLANG_EXTRA_ROOT=${M_CLANG_ROOT}/tools/extra

ensure_dir(){
  mkdir -p ${M_LLVM_ROOT}
  printf "mirror_llvm_root: ${M_LLVM_ROOT}\n"
  if [ -d ${M_LLVM_OBJ} ]; then
    read -p "Delete $M_LLVM_OBJ & $M_LLVM_INS? (y/N)" yn
    if [[ $yn == 'y' ]] || [[ $yn == 'Y' ]]; then
      rm -rf $M_LLVM_OBJ $M_LLVM_INS
    fi
  fi
  mkdir -p ${M_LLVM_OBJ} ${M_LLVM_INS}
}

dl_impl(){
  set -ex
  tar=$1
  url=$2
  root=$3
  tar_file=${BAK_DIR}/${tar}
  if ! [ -f ${tar_file} ];then
    axel -a -n 8 ${url} -o ${tar_file}
  fi
  if ! [ -d ${root} ];then
    mkdir ${root}
    printf "tar ${tar_file} into ${root}\n"
    tar -x -f ${tar_file} --strip-components=1 -C ${root}
  fi
  set +ex
}

dl_llvm(){
  dl_impl ${M_LLVM_TAR} ${M_LLVM_URL} ${M_LLVM_SRC}
  dl_impl ${M_CLANG_TAR} ${M_CLANG_URL} ${M_CLANG_ROOT}
  dl_impl ${M_CLANG_EXTRA_TAR} ${M_CLANG_EXTRA_URL} ${M_CLANG_EXTRA_ROOT}
}


build_llvm(){
  set -e
  ensure_gcc_ver
  ensure_dir
  dl_llvm
  cd ${M_LLVM_OBJ}
  export CC=/usr/bin/gcc
  export CXX=/usr/bin/g++
  export C_INCLUDE_PATH=/usr/include/c++/${GCC_VER}/x86_64-linux-gnu:/usr/include/x86_64-linux-gnu
  export CPLUS_INCLUDE_PATH=/usr/include/c++/${GCC_VER}/x86_64-linux-gnu:/usr/include/x86_64-linux-gnu
  # cmake ${M_LLVM_SRC} -DLLVM_ENABLE_ASSERTIONS=1 -DCMAKE_BUILD_TYPE=release -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DLLVM_ENABLE_CXX1Y=1 -DCMAKE_INSTALL_PREFIX=${M_LLVM_INS}
  ${M_LLVM_SRC}/configure --enable-optimized --enable-assertions --prefix=${M_LLVM_INS} --enable-bindings=none --enable-languages=c,c++ --with-built-clang --enable-cxx1y --enable-clang-static-analyzer --enable-clang-plugin-support #--enable-targets=x86_64,x86
  bear  make -j14
  # make -j$(nproc)
  cd ${MAIN_DIR}
  set +e
}

mkdir -p ${BAK_DIR}
build_llvm 2>&1 | tee ${BAK_DIR}/log-1-llvm
