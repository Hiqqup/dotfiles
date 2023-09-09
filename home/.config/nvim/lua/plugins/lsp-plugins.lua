return {
    {
        'neovim/nvim-lspconfig',
        cmd = "AddLSP",
        ft = require("lsp.add-lang").filetypes,
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            --autocomplete
            --highlighting
            'folke/neodev.nvim',

            --icons
            'nvim-tree/nvim-web-devicons'
        },
        config = function()
            require("lsp.lsp");
            require("lsp.add-lang").setup();
        end
    },
    {
        --format
        'mhartington/formatter.nvim',
        dependencies = {
            --linting
            --'mfussenegger/nvim-lint',
        },
        event = "BufWrite",
        config = function()
            require("lsp.formatter");
        end,
    },
    {
        'hrsh7th/nvim-cmp',
        event = "InsertEnter",
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            --guess i gotta learn LuaSnip at some point
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
        },
        config = function()
            require("lsp.snip");
        end
    },
    {
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        cmd = {
            "MasonToolsInstall",
            "MasonToolsUpdate",
        },
        config = function()
            require("lspconfig");
            require('mason-tool-installer').setup {
                ensure_installed = {
                    "prettierd",
                }
            }
        end,
    },

}
