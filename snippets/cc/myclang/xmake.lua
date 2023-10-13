add_requires("apt::libclang-16-dev", { alias = "libclang", configs = { shared = true } })
add_includedirs("/usr/lib/llvm-16/include")

target("hw-clang")
set_kind("binary")
add_files("*.cc")

add_packages("libclang")
