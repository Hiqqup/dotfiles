local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
require("mason").setup({});
local masonLsp = require 'mason-lspconfig'
masonLsp.setup({
    automatic_enable= true,
    ensure_installed = GLOBAL_ensure_installed
})
vim.lsp.enable('gdscript')

--- diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>se', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
-- if you want autofromat on save copy from kickstart
vim.keymap.set("n", "<leader>lf", function() vim.lsp.buf.format { async = false, } end)
