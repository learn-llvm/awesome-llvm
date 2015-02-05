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
- [LLVM’s Analysis and Transform Passes](http://llvm.org/docs/Passes.html)
- [FAQ](http://llvm.org/docs/FAQ.html)
- [LLVM Testing Infrastructure Guide](http://llvm.org/docs/TestingGuide.html)
- [The Often Misunderstood GEP Instruction](http://llvm.org/docs/GetElementPtr.html)
- [Exception Handling in LLVM](http://llvm.org/docs/ExceptionHandling.html)
- [LLVM Bitcode File Format](http://llvm.org/docs/BitCodeFormat.html)
- [Writing an LLVM Backend](http://llvm.org/docs/WritingAnLLVMBackend.html)
- [Get Started with the LLVM C API](https://pauladamsmith.com/blog/2015/01/how-to-get-started-with-llvm-c-api.html)


# Official Pages
- http://llvm.org/
- http://clang.llvm.org/
- http://blog.llvm.org/
- http://llvm.org/devmtg/
- Mailing List
  - [llvm-dev](http://lists.cs.uiuc.edu/mailman/listinfo/llvmdev)([nabble forum page](http://llvm.1065342.n5.nabble.com/LLVM-Dev-f3.html)), [llvm-weekly](http://llvmweekly.org/)
  - [cfe-dev](http://lists.cs.uiuc.edu/mailman/listinfo/cfe-dev)
  
# Other Pages
- [ELLCC](http://ellcc.org/demo/index.cgi) - Online LLVM Demo Page
- [Eli Bendersky's website](http://eli.thegreenplace.net/)
- [ChenWj's LLVM Wiki](http://people.cs.nctu.edu.tw/~chenwj/dokuwiki/doku.php?id=llvm)(Traditional Chinese)
- [An Unofficial LLVM Website](http://llvm.lyngvig.org/Articles/)
- [LLVM @ StackOverflow](http://stackoverflow.com/questions/tagged/llvm)
- [Clang @ StackOverflow](http://stackoverflow.com/questions/tagged/clang)
- Papers
  - http://llvm.org/pubs/
  - [LLVM @ Google Scholar](https://scholar.google.com.sg/scholar?hl=en&q=llvm&btnG=&as_sdt=1%2C5&as_sdtp=)
  - [LLVM @ Microsoft Academic Search](http://academic.research.microsoft.com/Search?query=llvm)
  - [LLVM @ ACM-DL](http://dl.acm.org/results.cfm?h=1&cfid=474738638&cftoken=86744949)
  - [LLVM @ IEEEXplore](http://ieeexplore.ieee.org/search/searchresult.jsp?newsearch=true&queryText=llvm)
  - [LLVM @ DBLP](http://dblp.org/search/#query=llvm&qp=H1.37:W1.3:F1.4:F2.4:F3.4:F4.3)

# Tools [(R1)](http://llvm.org/docs/CommandGuide/index.html, [R2](http://llvm.org/ProjectsWithLLVM/))
- [opt](http://llvm.org/docs/CommandGuide/opt.html) - LLVM optimizer
- [lit](http://llvm.org/docs/CommandGuide/lit.html) - LLVM Integrated Tester
- [lli](directly execute programs from LLVM bitcode) - Directly execute programs from LLVM bitcode
- [llvm-dis](http://llvm.org/docs/CommandGuide/llvm-dis.html) - LLVM disassembler
- [llvm-as](http://llvm.org/docs/CommandGuide/llvm-as.html) - LLVM assembler
- [llvm-link](http://llvm.org/docs/CommandGuide/llvm-link.html) - LLVM bitcode linker
- [llvm-ld](http://llvm.org/releases/2.9/docs/CommandGuide/html/llvm-ld.html)(<=2.9) - LLVM linker
- [llvm-dwarfdump](http://llvm.org/docs/CommandGuide/llvm-dwarfdump.html) - Print contents of DWARF sections
- [llvm-config](http://llvm.org/docs/CommandGuide/llvm-config.html) - Print LLVM compilation options
- [llvm-extract](http://llvm.org/docs/CommandGuide/llvm-extract.html) - Extract functions from an LLVM module
- [llvm-bcanalyzer](http://llvm.org/docs/CommandGuide/llvm-bcanalyzer.html) - LLVM bitcode analyzer
- llvm-objdump - LLVM objdump
- [llvm-nm](http://llvm.org/docs/CommandGuide/llvm-nm.html) - LLVM nm
- [llvm-readobj](http://llvm.org/docs/CommandGuide/llvm-readobj.html) - LLVM object reader
- [llvm-diff](http://llvm.org/docs/CommandGuide/llvm-diff.html) - LLVM structural "diff"
- [llc](http://llvm.org/docs/CommandGuide/llc.html) -  LLVM static compiler
- [llvm-ar](http://llvm.org/docs/CommandGuide/llvm-ar.html)(llvm-ranlib) - LLVM archiver
- [clang](http://clang.llvm.org/) - Official C/C++/Objective C/Objective C++ front-end
- [clang-format](http://clang.llvm.org/docs/ClangFormat.html) - Format C/C++/Obj-C code with different styles
- [clang-check](http://clang.llvm.org/docs/ClangCheck.html) - Error checking and AST dumping based on [LibTooling](http://clang.llvm.org/docs/LibTooling.html)
- [scan-build](http://clang-analyzer.llvm.org/) - Clang Static Analyzer
- [scan-view](http://clang-analyzer.llvm.org/) - Clang Static Analysis Viewer
- [clang-modernize](http://clang.llvm.org/extra/clang-modernize.html) - Modernize C++ code
- [clang-tidy](http://clang.llvm.org/extra/clang-tidy.html) - [Lint-like checks and beyondslides](http://llvm.org/devmtg/2014-04/PDFs/Talks/clang-tidy%20LLVM%20Euro%202014.pdf)
- [DragonEgg](http://dragonegg.llvm.org/) - Using LLVM as a GCC backend
- [Polly](http://polly.llvm.org/) - LLVM Framework for High-Level Loop and Data-Locality Optimizations
- [LLDB](http://lldb.llvm.org/) - The LLDB Debugger
- [klee](https://github.com/klee/klee) - Symbolic Virtual Machine
- [S2E](https://github.com/dslab-epfl/s2e) - Selective Symbolic Execution (use KLEE as symbolic executor)
- [rtags](https://github.com/Andersbakken/rtags) - A c/c++ client/server indexer for c/c++/objc[++]
- [llvmlite](https://github.com/numba/llvmlite) - A lightweight LLVM python binding for writing JIT compilers
- [slicer](https://github.com/wujingyue/slicer) - Schedule Specialization Framework
- [rcs](https://github.com/wujingyue/rcs)
- [NeonGoby](https://github.com/wujingyue/neongoby) - Alias Analysis Checker
- [LLBMC](http://llbmc.org/) - The Low-Level Bounded Model Checker
- [Bear](https://github.com/rizsotto/Bear) - A tool that generates a compilation database for clang tooling
- [whole-program-llvm](https://github.com/travitch/whole-program-llvm) - A wrapper script to build whole-program LLVM bitcode files
- [DWGrep](http://pmachata.github.io/dwgrep/) - A tool for querying Dwarf (debuginfo) graphs
- [Emscripten](https://github.com/kripken/emscripten) - An LLVM-to-JavaScript Compiler
- [mcsema](https://github.com/trailofbits/mcsema) - A  x86 to LLVM IR decompiler
- [stack](git@github.com:xiw/stack.git) - A static checker for identifying unstable code

# Scripts
See [Scripts](Scripts).

# Tutorials
- [llvm-clang-samples](https://github.com/eliben/llvm-clang-samples) - Examples of LLVM and Clang written by Dr. [Eli Bendersky](http://eli.thegreenplace.net/)
- [srg-llvm-pass-tutorial](https://github.com/delcypher/srg-llvm-pass-tutorial) - A tutorial about llvm passes from [Software reliability group](http://srg.doc.ic.ac.uk/)
