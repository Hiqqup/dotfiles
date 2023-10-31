require('neodev').setup()
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
require("mason").setup({});
local masonLsp = require 'mason-lspconfig'
servers = require("lsp.add-lang").servers;
cmds = require("lsp.add-lang").cmds;
masonLsp.setup({
    ensure_installed = {
        "lua_ls",
        "clangd",
        "tsserver",
        "bashls",
        "texlab",
    }
})
masonLsp.setup_handlers {
    function(server_name)
        local params = {
            capabilities = capabilities,
            on_attach = require("lsp.on_attach"),
            settings = servers[server_name],
        }
        if cmds[server_name] ~= nil then
            params.cmd = cmds[server_name]
        end
        require('lspconfig')[server_name].setup(params)
    end,
}




--- diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>se', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
---
require("lsp.lsp-format");
