Since LLVM-3.9, LLVM official has [removed the c++ backend](https://reviews.llvm.org/D19942), which was used to generate C++ code to create corresponding LLVM IR.
This backend is sometimes useful for beginners to easily generate some LLVM IR programatically. For now, a project called [llvm-cxxapi](https://github.com/zhangjiantao/llvm-cxxapi)
helps deal with the issue.

NOTE:
the use of C++ backend is like:
```bash
# generate IR
clang++ -S -emit-llvm input.cpp -o input.ll

# generate c++ backend
# pre llvm-3.9, deprecated now
llc -march=cpp -o input.ll.cpp input.ll
# use llvm-cxxapi
llvm-cxxapi -o input.ll.cpp input.ll

# generate executable, run, and dump IR
# compile
clang++ `llvm-config --cxxflags` -o test.ll.o -c test.ll.cpp
# link with llvm libraries
clang++ `llvm-config --ldflags` -o testcxx test.ll.o `llvm-config --system-libs --libs core support`
# execute
./testcxx
# will output the content same as input.ll
```
