# Motivation

When applying analysis, we usually need to work on a `linked` LLVM bitcode file, rather than multiple bitcode files.

# using `llvm-link`
This requires each step of compilation to generate `bc` files and then apply `llvm-link` against all `bc` files.

# using `lld linker`
Adding flags `-flto -fuse-ld=lld -Wl,-save-temps` to generate the temporal bc files.

# using `gold linker`
`export LDFLAGS="-flto -fuse-ld=gold -Wl,-plugin-opt=emit-llvm"`
http://gbalats.github.io/2015/12/10/compiling-autotooled-projects-to-LLVM-bitcode.html

# using `wllvm` or `gllvm`
[wllvm](https://github.com/travitch/whole-program-llvm) and [gllvm](https://github.com/SRI-CSL/gllvm) are solutions to generating linked bitcode files.
For example, when using gllvm, you should ensure the corresponding compiler is gclang and gclang++, which can be typically set by using `export CC=gclang CXX=gclang++`.
