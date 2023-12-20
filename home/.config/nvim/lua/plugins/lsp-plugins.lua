return {
    {
        'neovim/nvim-lspconfig',
        cmd = { "AddLSP", "AddFT" },
        ft = require("lsp.add-lang").filetypes,
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            --'nvim-tree/nvim-web-devicons',
            --snippets
        },
        config = function()
            require("lsp.add-lang").setup();
            require("lsp.lsp");
        end
    },
    {
        'folke/neodev.nvim',
        ft = "lua",
        config = function ()
            require('neodev').setup()
        end
    },

}
