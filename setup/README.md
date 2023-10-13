Setup scripts for llvm related projects.

It is suggested to put this inside `ROOT_DIRECTORY` inside the home directory, e.g., `$HOME/llvm`.
The directory structure would be like

> tree ${ROOT_DIRECTORY} -L 1

``` bash
├$HOOME/llvm
├── ...
├── klee
├── ...
├── git
├── ...
├── setup-llvm
├── ...
├── ...
└── Z3
```

# Recommends

- [bear](https://github.com/rizsotto/Bear) generate additional compile_commands.json file
- `git` and [git-up](https://github.com/aanand/git-up) (or [python fork](https://github.com/msiemens/PyGitUp))
