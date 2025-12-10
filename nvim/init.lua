
require("vanilla");
---------------zoomer lsp_shit-------------------------------------------------------------
---
GLOBAL_ensure_installed= { 
    "lua_ls",
    "tsserver",
    "bashls",
    "html",
    "clangd",
    --"gopls",
    "texlab",
    "rust_analyzer",
}
GLOBAL_filetypes = {
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
    "rust"
}
require("lazy-setup");
