set_project("clang-snippets")
set_xmakever("2.2.5")
set_languages("c99", "c++17")

add_rules("plugin.compile_commands.autoupdate")

includes("myclang")
