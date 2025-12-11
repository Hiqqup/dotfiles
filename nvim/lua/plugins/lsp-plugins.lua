return {
    {
        'neovim/nvim-lspconfig',
        ft= GLOBAL_filetypes,
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            --'nvim-tree/nvim-web-devicons',
            --snippets
        },
        config = function()
            require("lsp.lsp");
        end
    },
    { -- handy stuff for writing nvim config
        'folke/neodev.nvim',
        ft = "lua",
        config = function ()
            require('neodev').setup()
        end
    },

}
