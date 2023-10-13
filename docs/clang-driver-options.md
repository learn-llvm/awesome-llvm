## Check defined macros during compilation
```
# clang
$ clang -E -x c  /dev/null -dM
# clang++
$ clang++ -E -x c++  /dev/null -dM
# gcc is similar
$ gcc -E -x c /dev/null -dM
# g++
$ clang++ -E -x c++  /dev/null -dM
# also accept additional options
$ clang++ -E -x c++ -std=c++11 -DNDEBUG -fsanitize=address /dev/null -dM
```

## check clang driven LLVM options
```
echo 'int main(){}' >> /tmp/test.c && clang -mllvm -help -c /tmp/test.c
# or including hidden ones
echo 'int main(){}' >> /tmp/test.c && clang -mllvm -help-hidden -c /tmp/test.c
```

## print all LLVM options
```
clang -xc /dev/null -c -mllvm -print-all-options | less
```

## clang static checker options
```
clang -cc1 -analyzer-checker-help |less
```

## full cc1 commands
```
clang /dev/null -xc -O0 - -o /dev/null -\#\#\# 2>&1 | tr " " "\n"
# or others like
clang /dev/null -xc -Ofast - -o /dev/null -\#\#\# 2>&1 | tr " " "\n"
```
