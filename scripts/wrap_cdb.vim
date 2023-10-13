" this script is used to generate clang-based tools recognizable compilation
" database file (`cc.json`) from `clang -MJ` options
" to use it, simply run
" vim --headless -u NONE -i NONE -es < gen_cdb.vim /path/to/cc.json
:normal! gg
:normal! O[
:normal! G$x
:normal! o]
:set ft=json
:normal! gg=G
:x
