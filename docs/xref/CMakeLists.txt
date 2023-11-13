cmake_minimum_required(VERSION 3.6)
project(xref)

set(CMAKE_EXPORT_COMPILE_COMMANDS 1)
# set(CMAKE_EXE_LINKER_FLAGS "-flto -fuse-ld=lld -Wl,-save-temps")

add_executable(xref.out 
    main.c
    testnum.c)
