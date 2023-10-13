Setup scripts for llvm related projects.

It is suggested to put this inside ROOT_DIRECTORY inside the home directory, e.g., ~/RESEARCH,
finally the directory structure would be like

> tree ${ROOT_DIRECTORY} -L 1

``` bash
├/home/hongxu/RESEARCH
├── ...
├── klee
├── ...
├── llvm-3.3
├── llvm-3.4
├── llvm-3.5
├── llvm-git
├── ...
├── setup-llvm
├── ...
├── stp
├── ...
└── Z3
```

# Recommends/Dependencies

- `axel` for fast download
- [bear](https://github.com/rizsotto/Bear) generate additional compile_commands.json file
- `git` and [git-up](https://github.com/aanand/git-up) (or [python fork](https://github.com/msiemens/PyGitUp))

# TODO

- customize the options via command
- friendly output
