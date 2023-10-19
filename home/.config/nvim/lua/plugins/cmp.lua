return {
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            {
                'L3MON4D3/LuaSnip',
                config = function()
                    require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/snippets/" })
                end
            },
            'saadparwaiz1/cmp_luasnip',
        },
        event = "InsertEnter",
        --ft = require("lsp.add-lang").filetypes,
        config = function()
            require("lsp.snip");
        end
    },
}
