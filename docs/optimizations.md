If you produced the .ll file with a command line along the lines of `clang –c –O0 –emit-llvm …`,
then the IR functions will be annotated with the `optnone` attribute.
If you don't want that, a better command line would be `clang –c –O2 –Xclang –disable-llvm-passes –emit-llvm …`
