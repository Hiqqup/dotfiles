return {
    {
        'neovim/nvim-lspconfig',
        cmd = { "AddLSP", "AddFT" },
        ft = require("lsp.add-lang").filetypes,
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            'folke/neodev.nvim',

            --icons
            'nvim-tree/nvim-web-devicons',
            --snippets
            {
                'hrsh7th/cmp-nvim-lsp',
                dependencies = {
                    'L3MON4D3/LuaSnip',
                    'saadparwaiz1/cmp_luasnip',
                },
            },
        },
        config = function()
            require("lsp.add-lang").setup();
            require("lsp.lsp");
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
