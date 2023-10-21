require('neodev').setup()
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
require("mason").setup({});
local masonLsp = require 'mason-lspconfig'
servers = require("lsp.add-lang").servers;
masonLsp.setup({
    ensure_installed = {
        "lua_ls",
        "clangd",
        "tsserver",
        "bashls",
    }
})
masonLsp.setup_handlers {
    function(server_name)
        require('lspconfig')[server_name].setup {
            capabilities = capabilities,
            on_attach = require("lsp.on_attach"),
            settings = servers[server_name],
        }
    end,
}

--- idk a little bit uggly guess i dont know how to do better for now
require("lspconfig").clangd.setup {
    capabilities = capabilities,
    on_attach = require("lsp.on_attach"),
    cmd = {
        "clangd",
        "--fallback-style=webkit"
    }
}
---
require("lsp.lsp-format");
