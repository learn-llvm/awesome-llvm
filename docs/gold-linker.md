By default, Linux distributions use `ld.bfd` as the linker.

```
$ realpath `which ld`
/usr/bin/x86_64-linux-gnu-ld.bfd
$ gcc -print-prog-name=ld dummy.c
ld
$ gcc -fuse-ld=gold -print-prog-name=ld dummy.c
ld.gold
gcc -fuse-ld=bfd -print-prog-name=ld dummy.c
ld.gold
# as of clang-6.0, the report is always the result of `which ld`
```

When installing the Ubuntu deb Clang-6.0 package, to use gold linker, it's necessary to:
```
sudo mkdir -p /usr/lib/bfd-plugins
sudo ln -sf /usr/lib/llvm-6.0/lib/LLVMgold.so /usr/lib/bfd-plugins/LLVMgold.so
```

When building Clang manually, to use gold linker, it's necessary to 1) build binutils with gold linker enabled 2) build clang by specifying the `-DLLVM_BINUTILS_INCDIR=/path/to/binutils/include`.
```
git clone --depth 1 git://sourceware.org/git/binutils-gdb.git binutils
mkdir binutils-build
../binutils/configure --enable-gold --enable-plugins --disable-werror --prefix=$PWD/install
make all-gold
export MY_BINUTILS_INCLUDE_DIR=$PWD/install/include
make install
```
and build LLVM with:
```
mkdir llvm-build && cd llvm-build
cmake ../llvm -DCMAKE_BUILD_TYPE=RelWithDebInfo -DLLVM_BUILD_TESTS=OFF -DLLVM_INCLUDE_TESTS=OFF -DLLVM_BUILD_EXAMPLES=OFF -DLLVM_INCLUDE_EXAMPLES=OFF -DLLVM_ENABLE_ASSERTIONS=ON -DLLVM_BINUTILS_INCDIR=$MY_BINUTILS_INCLUDE_DIR -GNinja && ninja
```

Reference page: https://llvm.org/docs/GoldPlugin.html
