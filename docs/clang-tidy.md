
```
find -name "*.cpp" | xargs -I FILE clang-tidy -checks=modernize-use-* -fix FILE -p build/compile_commands.json
```
Note that `-p compile_commands.json` deals with the compilation flags; but the database typically only contains c/cpp files.
For list of available clang-tidy checks, run
```bash
clang-tidy --list-checks -checks='*'
```
