Inside the project root directory, run

```bash
find . -type f \( -name "*.cpp" -o -name "*.cc" -o -name "*.h" -o -name "*.hh" -o -name "*.hpp"\) | xargs clang-format -i
```
