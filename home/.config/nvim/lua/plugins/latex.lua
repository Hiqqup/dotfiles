return {
    {
        "iurimateus/luasnip-latex-snippets.nvim",
        dependencies = {
            "l3mon4d3/luasnip",
            {
                'jbyuki/nabla.nvim',
                config = function()
                    vim.keymap.set('n', '<leader>p',
                        require('nabla').popup,
                        { desc = 'nabla [p]opup' })

                    vim.keymap.set('n', '<leader>vn',
                        function()
                            if vim.g.nablavirt then
                                require "nabla".disable_virt()
                                vim.g.nablavirt = false
                            else
                                require "nabla".enable_virt()
                                vim.g.nablavirt = true
                            end
                        end,
                        { desc = '[n]abla [v]isual' })
                end,
            }
        },
        ft = { "markdown", "plaintex", },
        config = function()
            require 'luasnip-latex-snippets'.setup({ use_treesitter = true })
        end,
    },
}
