return {
    {
        'neovim/nvim-lspconfig',
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
    {
        'folke/neodev.nvim',
        ft = "lua",
        config = function ()
            require('neodev').setup()
        end
    },

}
