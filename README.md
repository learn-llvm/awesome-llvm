# Awesome LLVM [![Awesome](https://cdn.rawgit.com/sindresorhus/awesome/d7305f38d29fed78fa85652e3a63e154dd8e8829/media/badge.svg)](https://github.com/sindresorhus/awesome)

> Useful resources and samples for using [LLVM](http://llvm.org/)-specific techniques and tools; for Clang-specific resources, please see [clang.md](./clang.md). See also [awesome-llvm-security](https://github.com/gmh5225/awesome-llvm-security), and other awesome lists [here](https://github.com/topics/awesome) on GitHub.

# Documentation ([REF](http://llvm.org/docs/index.html))
- [LLVM Language Reference Manual](http://llvm.org/docs/LangRef.html)
- [LLVM Programmer’s Manual](http://llvm.org/docs/ProgrammersManual.html)
- [LLVM Coding Standards](http://llvm.org/docs/CodingStandards.html)
- [LLVM Style RTTI](http://llvm.org/docs/HowToSetUpLLVMStyleRTTI.html)
- [Writing an LLVM Pass](http://llvm.org/docs/WritingAnLLVMPass.html)
- [LLVM Alias Analysis Infrastructure](http://llvm.org/docs/AliasAnalysis.html)
- [Source Level Debugging](http://llvm.org/docs/SourceLevelDebugging.html)
- [Create A Project](http://llvm.org/docs/Projects.html)
- [LLVM Developer Policy](http://llvm.org/docs/DeveloperPolicy.html)
- [CommandLine 2.0 Library Manual](http://llvm.org/docs/CommandLine.html)
- [Getting Started with the LLVM System](http://llvm.org/docs/GettingStarted.html)
- [LLVM Tutorials](http://llvm.org/docs/tutorial/index.html)
- [Python Version of the LLVM Tutorial](https://github.com/eliben/pykaleidoscope)
- [LLVM’s Analysis and Transform Passes](http://llvm.org/docs/Passes.html)
- [FAQ](http://llvm.org/docs/FAQ.html)
- [LLVM Testing Infrastructure Guide](http://llvm.org/docs/TestingGuide.html)
- [The Often Misunderstood GEP Instruction](http://llvm.org/docs/GetElementPtr.html)
- [Exception Handling in LLVM](http://llvm.org/docs/ExceptionHandling.html)
- [LLVM Bitcode File Format](http://llvm.org/docs/BitCodeFormat.html)
- [Writing an LLVM Backend](http://llvm.org/docs/WritingAnLLVMBackend.html)
- [Sanitizers](docs/sanitizers) - AddressSanitizer, MemorySanitizer, ThreadSanitizer, UndefinedBehaviorSanitizer, LeakSanitizer, etc


# Official Pages
- http://llvm.org/, and [its doxygen docs](https://llvm.org/doxygen/index.html)
- http://blog.llvm.org/
- http://llvm.org/devmtg/
- [discourse forum](https://discourse.llvm.org/)
- ~~[Mailing List: llvm-dev](http://lists.cs.uiuc.edu/mailman/listinfo/llvmdev)~~
- [Mailing List: llvm-weekly](http://llvmweekly.org/)

# Other Pages
- [The Architecture of Open Source Applications - LLVM](http://www.aosabook.org/en/llvm.html)
- [ELLCC](http://ellcc.org/demo/index.cgi) - Online LLVM Demo Page
- [Eli Bendersky's website](http://eli.thegreenplace.net/)
- [ChenWj's LLVM Wiki](http://people.cs.nctu.edu.tw/~chenwj/dokuwiki/doku.php?id=llvm)(Traditional Chinese)
- [An Unofficial LLVM Website](http://llvm.lyngvig.org/Articles/)
- [LLVM @ StackOverflow](http://stackoverflow.com/questions/tagged/llvm)
- [LLVM @ reddit](https://www.reddit.com/r/LLVM/)
- [GitHub LLVM topic](https://github.com/topics/llvm)
- Publications
  - http://llvm.org/pubs/
  - [LLVM @ Google Scholar](https://scholar.google.com.sg/scholar?hl=en&q=llvm&btnG=&as_sdt=1%2C5&as_sdtp=)
  - [LLVM @ Microsoft Academic Search](http://academic.research.microsoft.com/Search?query=llvm)
  - [LLVM @ ACM-DL](http://dl.acm.org/results.cfm?h=1&cfid=474738638&cftoken=86744949)
  - [LLVM @ IEEEXplore](http://ieeexplore.ieee.org/search/searchresult.jsp?newsearch=true&queryText=llvm)
  - [LLVM @ DBLP](http://dblp.org/search/#query=llvm&qp=H1.37:W1.3:F1.4:F2.4:F3.4:F4.3)

# Official Tools ([R1](http://llvm.org/docs/CommandGuide/index.html), [R2](http://llvm.org/ProjectsWithLLVM/))
- [opt](http://llvm.org/docs/CommandGuide/opt.html) - LLVM optimizer
- [lit](http://llvm.org/docs/CommandGuide/lit.html) - LLVM Integrated Tester
- [lli](https://llvm.org/docs/CommandGuide/lli.html) - Directly execute programs from LLVM bitcode
- [llvm-dis](http://llvm.org/docs/CommandGuide/llvm-dis.html) - LLVM disassembler
- [llvm-as](http://llvm.org/docs/CommandGuide/llvm-as.html) - LLVM assembler
- [llvm-link](http://llvm.org/docs/CommandGuide/llvm-link.html) - LLVM bitcode linker
- ~~[llvm-ld](http://llvm.org/releases/2.9/docs/CommandGuide/html/llvm-ld.html)(<=2.9) - LLVM linker~~
- [llvm-dwarfdump](http://llvm.org/docs/CommandGuide/llvm-dwarfdump.html) - Print contents of DWARF sections
- [llvm-config](http://llvm.org/docs/CommandGuide/llvm-config.html) - Print LLVM compilation options
- [llvm-extract](http://llvm.org/docs/CommandGuide/llvm-extract.html) - Extract functions from an LLVM module
- [llvm-bcanalyzer](http://llvm.org/docs/CommandGuide/llvm-bcanalyzer.html) - LLVM bitcode analyzer
- [llvm-objdump](http://llvm.org/docs/CommandGuide/llvm-objdump.html) - LLVM objdump
- [llvm-nm](http://llvm.org/docs/CommandGuide/llvm-nm.html) - LLVM nm
- [llvm-readobj](http://llvm.org/docs/CommandGuide/llvm-readobj.html) - LLVM object reader
- [llvm-diff](http://llvm.org/docs/CommandGuide/llvm-diff.html) - LLVM structural "diff"
- [llc](http://llvm.org/docs/CommandGuide/llc.html) -  LLVM static compiler
- [llvm-ar](http://llvm.org/docs/CommandGuide/llvm-ar.html)(llvm-ranlib) - LLVM archiver
- ~~[DragonEgg](http://dragonegg.llvm.org/) - Using LLVM as a GCC backend~~
- [Polly](http://polly.llvm.org/) - LLVM Framework for High-Level Loop and Data-Locality Optimizations
- [LLDB](http://lldb.llvm.org/) - The LLDB Debugger
- [libfuzzer](https://llvm.org/docs/LibFuzzer.html) - a library for coverage-guided fuzz testing

# Unofficial Tools/Framework
- [American fuzzy lop (AFL)](http://lcamtuf.coredump.cx/afl/) - LLVM mode for instrumentation
- [SVF-tools](https://github.com/SVF-tools/SVF) - Pointer Analysis and Program Dependence Analysis for C and C++ Programs
- [Phasar](https://github.com/secure-software-engineering/phasar) - A LLVM-based static analysis framework
- [Infer](https://github.com/facebook/infer) - Facebook's static analysis framework; C/C++/objc is based on LLVM/Clang
- [whole-program-llvm](https://github.com/travitch/whole-program-llvm) - A wrapper script to build whole-program LLVM bitcode files; its go port [gllvm](https://github.com/SRI-CSL/gllvm)
- [klee](https://github.com/klee/klee) - Symbolic Virtual Machine
- [ollvm](https://github.com/obfuscator-llvm/obfuscator/wiki) - code obfuscation based on LLVM4.0
- [S2E](https://github.com/s2e) - Selective Symbolic Execution (use KLEE as symbolic executor)
- [RetDec](https://github.com/avast-tl/retdec) - a retargetable machine-code decompiler based on LLVM
- [capstone](http://www.capstone-engine.org/beyond_llvm.html) - Disassembler based on the MC component of the LLVM compiler infrastructure
- ~~[slicer](https://github.com/wujingyue/slicer) - Schedule Specialization Framework~~
- ~~[LLBMC](http://llbmc.org/) - The Low-Level Bounded Model Checker~~
- [DWGrep](http://pmachata.github.io/dwgrep/) - A tool for querying Dwarf (debuginfo) graphs
- [Emscripten](https://github.com/kripken/emscripten) - An LLVM-to-JavaScript Compiler
- [cling](https://github.com/root-project/cling) - The cling C++ interpreter
- [mcsema](https://github.com/trailofbits/mcsema) - An x86 to LLVM IR decompiler
- [remill](https://github.com/lifting-bits/remill) - Library for lifting machine code to LLVM bitcode
- [llvm2cpg](https://github.com/ShiftLeftSecurity/llvm2cpg) - LLVM meets Code Property Graphs
- ~~[stack](https://github.com/xiw/stack) - A static checker for identifying unstable code~~
- ~~[andersen](https://github.com/grievejia/andersen) - Andersen's inclusion-based pointer analysis re-implementation in LLVM~~
- ~~[NeonGoby](https://github.com/wujingyue/neongoby) - Alias Analysis Checker~~
- [QBDI](https://github.com/QBDI/QBDI) - A Dynamic Binary Instrumentation framework based on LLVM
- [circt](https://github.com/llvm/circt) - Circuit IR Compilers and Tools

# Books
- [Learn LLVM 12](https://www.amazon.com/Learn-LLVM-12-beginners-libraries/dp/1839213507/ref=sr_1_1)
- [Getting Started with LLVM Core Libraries](https://www.amazon.com/Getting-Started-LLVM-Core-Libraries/dp/1782166920), also available on [ACM library](https://dl.acm.org/citation.cfm?id=2692607)
- [LLVM Cookbook](https://www.amazon.com/LLVM-Cookbook-Mayur-Pandey/dp/178528598X)
- [LLVM Essentials](https://www.amazon.com/LLVM-Essentials-Suyog-Sarda/dp/1785280805/)
- [LLVM Techniques, Tips, and Best Practices Clang and Middle-End Libraries](https://www.amazon.com/Techniques-Practices-Clang-Middle-End-Libraries/dp/1838824952)
- [LLVM compiler combat tutorial(Chinese Edition)](https://www.amazon.com/LLVM-compiler-combat-tutorial-Chinese/dp/7111631978/ref=sr_1_1)
- [Engineering LLVM Backend](https://www.amazon.com/Engineering-LLVM-Backend-next-generation-accelerator-ebook/dp/B0BBRF69XL/ref=sr_1_15)

# Tutorials
- [LLVM-Tutor](https://github.com/banach-space/llvm-tutor) - A collection of out-of-tree LLVM passes for teaching and learning
- [learning-llvm](https://github.com/danbev/learning-llvm) - a few project for learning about llvm
- [LLVM-Pass-Analysis-Collection](https://github.com/JohannesLiu/LLVM-Pass-Analysis-Collection) - A Collection of LLVM Pass for Program Analysis
- [Get Started with the LLVM C API](https://pauladamsmith.com/blog/2015/01/how-to-get-started-with-llvm-c-api.html)
- [llvm-ir-tutorial](https://github.com/Evian-Zhang/llvm-ir-tutorial) (in Chinese)

# Installation
- [LLVM Debian/Ubuntu nightly packages](http://apt.llvm.org/)
- [Mac OS Homebrew Formula](https://github.com/Homebrew/homebrew-core/blob/master/Formula/llvm.rb)

# LLVM backed Languages
- C/C++/ObjC/ObjC++
- [Swift](https://developer.apple.com/swift/)
- [GHC Haskell](https://www.haskell.org/ghc/)
- [Rust](https://www.rust-lang.org)
- [Julia](https://julialang.org/)
- [go-llvm](https://github.com/go-llvm/llgo)
- [scala-native](https://github.com/scala-native/scala-native)
- [ldc](https://github.com/ldc-developers/ldc)
- [Crystal](https://crystal-lang.org/)
- [codon](https://github.com/exaloop/codon)
- [numba](https://github.com/numba/numba)

# Bindings
- [llvmlite](https://github.com/numba/llvmlite) - A lightweight LLVM python binding for writing JIT compilers
- [LLVM Rust crates](https://crates.io/search?q=llvm)
