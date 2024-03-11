Awesome LLVM [![Awesome](https://cdn.rawgit.com/sindresorhus/awesome/d7305f38d29fed78fa85652e3a63e154dd8e8829/media/badge.svg)](https://github.com/sindresorhus/awesome)
------

This repo includes LLVM-related projects, websites, docs, and other resources. Only well-maintained resources are included; PRs are welcome.
This README.md itself mostly records **LLVM backend** (as well as mixed) resources; for **Clang**-specific ones, please check **[Clang.md](./Clang.md)** in this repo.

## Starchart

![Star History Chart](https://api.star-history.com/svg?repos=learn-llvm/awesome-llvm&type=Date)

# Websites([references](https://llvm.org/docs/GettingInvolved.html))
- 🐉 http://llvm.org/, and [its doxygen docs](https://llvm.org/doxygen/index.html)
- 🐉 https://llvm.org/devmtg/ - LLVM Developers' Meeting and other events
  - 📹 [2023](https://www.youtube.com/playlist?list=PL_R5A0lGi1AD9nPVlv7mG8_2mMSiL_0Ik)
- 🐉 http://blog.llvm.org/ - official blog
- 🐉 [discourse forum](https://discourse.llvm.org/)
- 🐉 [llvm-commits archives](https://lists.llvm.org/pipermail/llvm-commits/)
- 🐉 [llvm-bugs archives](https://lists.llvm.org/pipermail/llvm-bugs/)
- 🐉 [LLVMProj @ YouTube](https://www.youtube.com/@LLVMPROJ/videos?view=0&sort=dd&shelf_id=0) - official account, including [LLVM devmeeting](http://llvm.org/devmtg/), EuroLLVM, etc
- 🐉 [Open Projects](https://llvm.org/OpenProjects.html)
- 🐉 [LLVM Community events calendar](https://calendar.google.com/calendar/u/0/embed?src=calendar@llvm.org)
- [llvm-weekly](http://llvmweekly.org/) and its [Mastodon page](https://fosstodon.org/@llvmweekly) by [Alex Bradbury](https://fosstodon.org/@asb)
- [The Architecture of Open Source Applications - LLVM](http://www.aosabook.org/en/llvm.html)
- [Eli Bendersky's website](http://eli.thegreenplace.net/)
- [ChenWj's LLVM Wiki](http://people.cs.nctu.edu.tw/~chenwj/dokuwiki/doku.php?id=llvm)(Traditional Chinese)
- [An Unofficial LLVM Website](http://llvm.lyngvig.org/Articles/)
- [LLVM @ StackOverflow](http://stackoverflow.com/questions/tagged/llvm)
- [LLVM @ reddit](https://www.reddit.com/r/LLVM/)
- [GitHub LLVM topic](https://github.com/topics/llvm)
- [LLVM documentation in hdoc](https://docs.hdoc.io/hdoc/llvm-project/functions.html)
- ~~[ELLCC](http://ellcc.org/demo/index.cgi) - Online LLVM Demo Page~~

# Tutorials/Documentation ([reference](http://llvm.org/docs/index.html))
- 🐉 [LLVM Tutorials](http://llvm.org/docs/tutorial/index.html) - a list of tutorials
  - :octocat: [Python Version of the LLVM Tutorial](https://github.com/eliben/pykaleidoscope)
- 🐉 [LLVM Language Reference Manual](http://llvm.org/docs/LangRef.html) - detailed docs for LLVM IR/Bitcode
  - 🐉 [LLVM Bitcode File Format](http://llvm.org/docs/BitCodeFormat.html)
  - 🐉 [The Often Misunderstood GEP Instruction](http://llvm.org/docs/GetElementPtr.html)
  - :octocat: [](https://github.com/sunxfancy/vscode-llvm) - VSCode LLVM Compiler Explorer
- 🐉 [LLVM Programmer’s Manual](http://llvm.org/docs/ProgrammersManual.html) - how to develop using LLVM infrastructure
  - 🐉 [LLVM Coding Standards](http://llvm.org/docs/CodingStandards.html)
  - 🐉 [LLVM Developer Policy](http://llvm.org/docs/DeveloperPolicy.html)
  - 🐉 [LLVM Style RTTI](http://llvm.org/docs/HowToSetUpLLVMStyleRTTI.html)
  - 🐉 [Source Level Debugging](http://llvm.org/docs/SourceLevelDebugging.html)
  - 🐉 [Create A Project](http://llvm.org/docs/Projects.html)
  - 🐉 [Exception Handling in LLVM](http://llvm.org/docs/ExceptionHandling.html)
  - 📹 [A Tour of ADT - the LLVM Developer's Toolbox](https://www.youtube.com/watch?v=owQlnNYek2o&list=PL_R5A0lGi1AD9nPVlv7mG8_2mMSiL_0Ik&index=26)
- 🐉 [CommandLine 2.0 Library Manual](http://llvm.org/docs/CommandLine.html) - LLVM's CLI option parser library, used by all LLVM CLI tools etc
- 🐉 [Getting Started with the LLVM System](http://llvm.org/docs/GettingStarted.html) - LLVM project's build, configurations, directory layouts etc
- 🐉 [LLVM’s Analysis and Transform Passes](http://llvm.org/docs/Passes.html)
  - 🐉 [Using the New Pass Manager](https://llvm.org/docs/NewPassManager.html) - LLVM's new pass manager for optimization (both CLI and API changed)
  - 🐉 [Writing an LLVM Pass](http://llvm.org/docs/WritingAnLLVMPass.html)
  - 🐉 [LLVM Alias Analysis Infrastructure](http://llvm.org/docs/AliasAnalysis.html)
  - [Tracing Memory Access With an LLVM Pass](https://www.bitsand.cloud/posts/llvm-pass/) - a blog post details how to implement an LLVM Pass that allows for tracing memory access
- 🐉 [LLVM Testing Infrastructure Guide](http://llvm.org/docs/TestingGuide.html)
- 🐉 [Writing an LLVM Backend](http://llvm.org/docs/WritingAnLLVMBackend.html)
- 🐉 [LLVM Remarks](https://llvm.org/docs/Remarks.html) - emit diagnostics describing whether an optimization is performed/missed
- 🐉 [LLVM FAQ](http://llvm.org/docs/FAQ.html) - Frequently Asked Questions
- :octocat: [Sanitizers](docs/sanitizers) - AddressSanitizer, MemorySanitizer, ThreadSanitizer, UndefinedBehaviorSanitizer, LeakSanitizer, etc
- :octocat: [Tutorial: Creating an LLVM Backend for the Cpu0 Architecture](http://jonathan2251.github.io/lbd/index.html)
- :octocat: [LLVM-Tutor](https://github.com/banach-space/llvm-tutor) - A collection of out-of-tree LLVM passes for teaching and learning
- :octocat: [learning-llvm](https://github.com/danbev/learning-llvm) - a project for learning about llvm
- :octocat: [LLVM-Pass-Analysis-Collection](https://github.com/JohannesLiu/LLVM-Pass-Analysis-Collection) - A Collection of LLVM Pass for Program Analysis
- :octocat: [srg-llvm-pass-tutorial](https://github.com/delcypher/srg-llvm-pass-tutorial) - A tutorial about llvm passes from [Software reliability group](http://srg.doc.ic.ac.uk/)
- 📃 [Get Started with the LLVM C API](https://pauladamsmith.com/blog/2015/01/how-to-get-started-with-llvm-c-api.html)
- :octocat: [lahiri-phdworks/LLVM-Examples](https://github.com/lahiri-phdworks/LLVM-Examples) - LLVM Repository and Code samples. LLVM Passes and quick bytes.
- :octocat: [wuzhanglin/llvm-IR-examples](https://github.com/wuzhanglin/llvm-IR-examples) - Some examples for using LLVM to generate IR
- :octocat: [llvm-ir-tutorial](https://github.com/Evian-Zhang/llvm-ir-tutorial) (in Chinese)
- 📹 [LLVM Tutorial Walkthrough](https://www.youtube.com/watch?v=09EAVa7BAp4&list=PLSq9OFrD2Q3ChEc_ejnBcO5u9JeT0ufkg) -- Toby Ho's tutorial
- 📹 [Introduction to the Low-Level Virtual Machine (LLVM)](https://www.youtube.com/playlist?list=PLDSTpI7ZVmVnvqtebWnnI8YeB8bJoGOyv) - UFMG's Compilers Lab's tutorial
- 📹 [Understanding Compiler Optimization](https://www.youtube.com/watch?v=FnGCDLhaxKU&t=59s) - Chandler Carruth's Opening Keynote Meeting C++ 2015
- 🐉 [Tools for Learning LLVM TableGen](https://blog.llvm.org/posts/2023-12-07-tools-for-learning-llvm-tablegen/) - tutorial by David Spickett about LLVM's [TableGen](https://github.com/llvm/llvm-project/tree/main/llvm/utils/TableGen)

# Publications
- http://llvm.org/pubs/
- [LLVM @ Google Scholar](https://scholar.google.com/scholar?hl=en&q=llvm)
- [LLVM @ ACM-DL](https://dl.acm.org/action/doSearch?fillQuickSearch=false&target=advanced&expand=dl&field1=AllField&text1=llvm)
- [LLVM @ IEEEXplore](http://ieeexplore.ieee.org/search/searchresult.jsp?newsearch=true&queryText=llvm)
- [LLVM @ DBLP](http://dblp.org/search/#query=llvm)
- 📖 [Learn LLVM 12](https://www.amazon.com/Learn-LLVM-12-beginners-libraries/dp/1839213507/ref=sr_1_1) - good to start with
- 📖 [Learn LLVM 17](https://www.packtpub.com/product/learn-llvm-17-second-edition/9781837631346) Second Edition
- 📖 [Getting Started with LLVM Core Libraries](https://www.amazon.com/Getting-Started-LLVM-Core-Libraries/dp/1782166920), also available on [ACM library](https://dl.acm.org/citation.cfm?id=2692607)
- 📖 [LLVM Cookbook](https://www.amazon.com/LLVM-Cookbook-Mayur-Pandey/dp/178528598X)
- 📖 [LLVM Essentials](https://www.amazon.com/LLVM-Essentials-Suyog-Sarda/dp/1785280805/)
- 📖 [LLVM Techniques, Tips, and Best Practices Clang and Middle-End Libraries](https://www.amazon.com/Techniques-Practices-Clang-Middle-End-Libraries/dp/1838824952)
- 📖 [Engineering LLVM Backend](https://www.amazon.com/Engineering-LLVM-Backend-next-generation-accelerator-ebook/dp/B0BBRF69XL/ref=sr_1_15)

# Official Tools/Libraries ([reference](http://llvm.org/docs/CommandGuide/index.html))
- Core Utilities
  - [opt](http://llvm.org/docs/CommandGuide/opt.html) - LLVM optimizer, for LLVM analysis and transformation passes, works on `.ll` or `.bc` files
    - 📹 [Core C++ 2021 :: opt-viewer: Inspecting compiler optimizations in high-level code](https://www.youtube.com/watch?v=BJ_yxTmZQbc)
    - 📹 [LLVM Optimization Remarks - Ofek Shilon - CppCon 2022](https://www.youtube.com/watch?v=qmEsx4MbKoc)
  - [lli](https://llvm.org/docs/CommandGuide/lli.html) - Directly execute/intepreter programs from LLVM bitcode, running on `.ll` or `.bc` files
  - [llvm-dis](http://llvm.org/docs/CommandGuide/llvm-dis.html) - LLVM disassembler, from `.bc` to `.ll`
  - [llvm-as](http://llvm.org/docs/CommandGuide/llvm-as.html) - LLVM assembler, from `.ll` to `.bc`
  - [llvm-link](http://llvm.org/docs/CommandGuide/llvm-link.html) - LLVM bitcode linker, merge multiple `.bc`s/`.ll`s into one
  - [llvm-dwarfdump](http://llvm.org/docs/CommandGuide/llvm-dwarfdump.html) - Print contents of DWARF sections, `llvm-dwarfdump -a main.o`
  - [llvm-config](http://llvm.org/docs/CommandGuide/llvm-config.html) - Print LLVM compilation options, e.g., `llvm-config --includedir`
  - [llvm-extract](http://llvm.org/docs/CommandGuide/llvm-extract.html) - Extract functions from an LLVM module
  - [llvm-bcanalyzer](http://llvm.org/docs/CommandGuide/llvm-bcanalyzer.html) - LLVM bitcode analyzer, `llvm-bcanalyzer main.bc`
  - [llvm-objdump](http://llvm.org/docs/CommandGuide/llvm-objdump.html) - LLVM's [objdump](https://en.wikipedia.org/wiki/Objdump), `llvm-objdump -a main.o`
  - [llvm-nm](http://llvm.org/docs/CommandGuide/llvm-nm.html) - LLVM's nm
  - [llvm-readelf](https://llvm.org/docs/CommandGuide/llvm-readelf.html) - LLVM's [readelf](https://en.wikipedia.org/wiki/Readelf), `llvm-readelf -a main.o`
  - [llvm-readobj](http://llvm.org/docs/CommandGuide/llvm-readobj.html) - LLVM object reader, `llvm-readobj --all main.o`
  - [llvm-diff](http://llvm.org/docs/CommandGuide/llvm-diff.html) - LLVM structural "diff"
  - [llc](http://llvm.org/docs/CommandGuide/llc.html) -  LLVM static compiler, compile LLVM IR to native assembly,  `llc main.ll -o main.s`
  - [llvm-ar](http://llvm.org/docs/CommandGuide/llvm-ar.html)(llvm-ranlib) - LLVM archiver
  - [llvm-mca](https://llvm.org/docs/CommandGuide/llvm-mca.html) - LLVM Machine Code Analyzer
  - [lit](http://llvm.org/docs/CommandGuide/lit.html) - LLVM Integrated Tester, for testing purpose during development
- [libc++](https://libcxx.llvm.org/) - LLVM's implementation of C++ standard library
- [libc++abi](https://libcxxabi.llvm.org/) - LLVM's C++ ABI library that provides an implementation of the library portion of the Itanium C++ ABI
- [Compiler-RT](https://compiler-rt.llvm.org/) - runtime libraries, including sanitizers, profiling utilities, etc
- [MLIR](https://mlir.llvm.org/) - Multi-Level Intermediate Representation
  - 🐉 [MLIR News](https://discourse.llvm.org/c/mlir/mlir-news-mlir-newsletter/) - MLIR News issue on discourse
  - :octocat: [llvm/Torch-LLVM](https://github.com/llvm/torch-mlir) - first class support from the PyTorch ecosystem to the MLIR ecosystem
  - :octocat: [llvm/Polygeist](https://github.com/llvm/Polygeist) - C/C++ frontend for MLIR
  - :octocat: [j2kun/mlir-tutorial](https://github.com/j2kun/mlir-tutorial) - a series of articles on the MLIR framework for building compilers
  - :octocat: [Lewuathe/mlir-hello](https://github.com/Lewuathe/mlir-hello) - minimal Hello-World example of MLIR
  - :octocat: [melior](https://github.com/edg-l/melior) - The rustic MLIR bindings in Rust; see also [introduction blog post](https://edgarluque.com/blog/mlir-with-rust/)
  - :octocat: [Sparsifier](https://developers.google.com/mlir-sparsifier) - Google MLIR sparsifier
  - :octocat: [intel/mlir-extensions](https://github.com/intel/mlir-extensions/tree/main) - Intel® Extension for MLIR
  - 📹 [MLIR Is Not an ML Compiler, and Other Common Misconceptions](https://www.youtube.com/watch?v=lXAp6ZAWyBY&list=PL_R5A0lGi1AD9nPVlv7mG8_2mMSiL_0Ik&index=25)
- [libfuzzer](https://llvm.org/docs/LibFuzzer.html) - a library for coverage-guided fuzz testing
- [LLD](https://lld.llvm.org/) - LLVM's integrated linker, similar to [GNU ld](https://linux.die.net/man/1/ld) and [gold linker](https://en.wikipedia.org/wiki/Gold_(linker))
  - relevant: [LLVM Gold Linker plugin](https://llvm.org/docs/GoldPlugin.html)
- [LLDB](http://lldb.llvm.org/) - LLVM's LLDB Debugger
  - 🐉 [GDB to LLDB command map](https://lldb.llvm.org/use/map.html)
- [LLVM's libunwind](https://bcain-llvm.readthedocs.io/projects/libunwind/en/latest/) - an implementation of the interface defined by the HP libunwind project
- [Polly](http://polly.llvm.org/) - LLVM Framework for High-Level Loop and Data-Locality Optimizations
- [OpenMP in LLVM](https://openmp.llvm.org/)
  - 🐉 [LLVM OpenMP @ discourse](https://discourse.llvm.org/c/runtimes/openmp/35)
- [OpenCL C in LLVM](https://libclc.llvm.org/) - open source, BSD/MIT dual licensed implementation of the library requirements of the OpenCL C programming language
- [BOLT](https://github.com/llvm/llvm-project/blob/main/bolt/README.md) - a post-link optimizer developed to speed up large applications

# Unofficial Tools/Libraries ([reference](http://llvm.org/ProjectsWithLLVM/))
- [SVF-tools](https://github.com/SVF-tools/SVF) - Pointer Analysis and Program Dependence Analysis for C and C++ Programs
- [smack](https://github.com/smackers/smack) - SMACK Software Verifier and Verification Toolchain
- [Phasar](https://github.com/secure-software-engineering/phasar) - A LLVM-based static analysis framework
- [Infer](https://github.com/facebook/infer) - Facebook's static analysis framework; C/C++/objc is based on LLVM/Clang
- [mstorsjo/llvm-mingw](https://github.com/mstorsjo/llvm-mingw) - An LLVM/Clang/LLD based mingw-w64 toolchain
- [microsoft/llvm-mctoll](https://github.com/microsoft/llvm-mctoll) - statically (AOT) translates (or raises) binaries to LLVM IR
- [mcsema](https://github.com/trailofbits/mcsema) - An x86 to LLVM IR decompiler
- [whole-program-llvm](https://github.com/travitch/whole-program-llvm) - A wrapper script to build whole-program LLVM bitcode files; its go port [gllvm](https://github.com/SRI-CSL/gllvm)
- [ollvm](https://github.com/obfuscator-llvm/obfuscator/wiki) - code obfuscation based on LLVM4.0
- [S2E](https://github.com/s2e) - Selective Symbolic Execution (use KLEE as symbolic executor)
- [RetDec](https://github.com/avast/retdec) - a retargetable machine-code decompiler based on LLVM
- [capstone](http://www.capstone-engine.org/beyond_llvm.html) - Disassembler based on the MC component of the LLVM compiler infrastructure
- [DWGrep](http://pmachata.github.io/dwgrep/) - A tool for querying Dwarf (debuginfo) graphs
- [Emscripten](https://github.com/kripken/emscripten) - An LLVM-to-JavaScript Compiler
- [cling](https://github.com/root-project/cling) - The cling C++ interpreter ([1.0](https://github.com/vgvassilev/cling/releases/tag/v1.0) has been released)
- [remill](https://github.com/lifting-bits/remill) - Library for lifting machine code to LLVM bitcode
- [llvm2cpg](https://github.com/ShiftLeftSecurity/llvm2cpg) - LLVM meets Code Property Graphs
- [QBDI](https://github.com/QBDI/QBDI) - A Dynamic Binary Instrumentation framework based on LLVM
- [circt](https://github.com/llvm/circt) - Circuit IR Compilers and Tools
- [American fuzzy lop (AFL)](http://lcamtuf.coredump.cx/afl/) - LLVM mode for instrumentation
- [klee](https://github.com/klee/klee) - Symbolic Virtual Machine
- [IKOS](https://github.com/nasa-sw-vnv/ikos) - Static analyzer for C/C++ based on the theory of Abstract Interpretation.
- [diffkemp](https://github.com/viktormalik/diffkemp) - Static analysis of semantic differences in kernel versionsa
- [GaloisInc/yapall](https://github.com/GaloisInc/yapall) - A precise and scalable pointer analysis for LLVM, written in Ascent
- [llvm2c](https://github.com/staticafi/llvm2c) - Decompiler of LLVM bitcode to C
- [dr checker](https://github.com/ucsb-seclab/dr_checker) - A Soundy Vulnerability Detection Tool for Linux Kernel Drivers
- [DG](https://github.com/mchalupa/dg) -  Various program analyses, construction of dependence graphs and program slicing of LLVM bitcode
  - dg can integrate SVF, see [here](https://github.com/mchalupa/dg/blob/master/doc/SVF.md) for details
- [llvm-crash-analyzer](https://github.com/cisco-open/llvm-crash-analyzer) -- crash analysis against coredump files based on LLVM Machine-IR, together with LLDB
- [seahorn/clam](https://github.com/seahorn/clam) - a static analyzer (CLI) based on [seahorn/crab](https://github.com/seahorn/crab), the latter of which is abstract Interpretation-based library

# Bindings
- [llvmlite](https://github.com/numba/llvmlite) - A lightweight LLVM **python** binding for writing JIT compilers
- [LLVM Rust crates](https://crates.io/search?q=llvm) - **Rust** bindings
- [go-llvm](https://github.com/tinygo-org/go-llvm) - **Go** binding

# LLVM-backed Languages
- C/C++/ObjC/ObjC++
- [Swift](https://developer.apple.com/swift/)
- [GHC Haskell](https://www.haskell.org/ghc/)
- [Rust](https://www.rust-lang.org)
- [Julia](https://julialang.org/)
- [scala-native](https://github.com/scala-native/scala-native)
- [ldc](https://github.com/ldc-developers/ldc)
- [Crystal](https://crystal-lang.org/)
- [codon](https://github.com/exaloop/codon)
- [numba](https://github.com/numba/numba)
- [mojo](https://docs.modular.com/)
- [solang](https://github.com/hyperledger/solang)
- [Ola](https://github.com/mateeeeeee/Ola) - a toy language, for learning LLVM-backend codegen
- ~~[go-llvm](https://github.com/go-llvm/llgo)~~

# Setup
- ⚙️ [LLVM Debian/Ubuntu nightly packages](http://apt.llvm.org/) - Debian APT sources
- ⚙️ [Mac OS Homebrew Formula]([https://github.com/Homebrew/homebrew-core/blob/master/Formula/llvm.rb](https://github.com/Homebrew/homebrew-core/blob/master/Formula/l/llvm.rb)) - HomeBrew's LLVM formula

# Other relevant resources:
* :octocat: [awesome-llvm-security](https://github.com/gmh5225/awesome-llvm-security) - awesome llvm security projects
* :octocat: [static-analysis](https://github.com/analysis-tools-dev/static-analysis) - A curated list of static analysis tools and linters for all programming languages, config files, build tools, and more
* :octocat: [dynamic-analysis](https://github.com/analysis-tools-dev/dynamic-analysis) - A curated list of dynamic analysis tools and linters for all programming languages, binaries, and more
* :octocat: [LLVM-Guide](https://github.com/mikeroyal/LLVM-Guide)
* :octocat: [program analysis topics on GitHub](https://github.com/topics/program-analysis)
* :octocat: other [awesome lists on GitHub](https://github.com/topics/awesome)
* [List of tools for static code analysis (on Wikipedia)](https://en.wikipedia.org/wiki/List_of_tools_for_static_code_analysis)
