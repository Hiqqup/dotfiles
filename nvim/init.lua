
require("vanilla");
---------------zoomer lsp_shit-------------------------------------------------------------
GLOBAL_ensure_installed= { 
    "lua_ls",
    "ts_ls",
    "bashls",
    "html",
    "clangd",
    --"gopls",
    "texlab",
    "rust_analyzer",
    "java_language_server",
    "neocmake",
}
GLOBAL_filetypes = {
    "java",
    "lua",
    "javascript",
    "sh",
    "typescript",
    "html",
    "c",
    "go",
    "tex",
    "cpp",
    "asm",
    "make",
    "rust",
    "gdscript",
    "gdshader",
    "gdresource",
    "cmake"
}
require("lazy-setup");
