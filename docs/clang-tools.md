## clang-format
Inside the project root directory, run

```bash
find . -type f \( -name "*.cpp" -o -name "*.cc" -o -name "*.h" -o -name "*.hh" -o -name "*.hpp"\) | xargs clang-format -i
```

### clang-tidy

```
find -name "*.cpp" | xargs -I FILE clang-tidy -checks=modernize-use-* -fix FILE -p build/compile_commands.json
```
Note that `-p compile_commands.json` deals with the compilation flags; but the database typically only contains c/cpp files.
For list of available clang-tidy checks, run
```bash
clang-tidy --list-checks -checks='*'
```
