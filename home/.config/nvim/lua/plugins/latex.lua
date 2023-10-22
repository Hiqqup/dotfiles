local function nablaToggle()
    if vim.g.nablavirt then
        require "nabla".disable_virt()
        vim.g.nablavirt = false
    else
        require "nabla".enable_virt()
        vim.g.nablavirt = true
    end
end

return {
    {
        'jbyuki/nabla.nvim',
        dependencies = {
            "l3mon4d3/luasnip",
            "iurimateus/luasnip-latex-snippets.nvim",
        },
        ft = { "markdown", "plaintex", },
        config = function()
            require 'luasnip-latex-snippets'.setup({ use_treesitter = true })
            --nabla keymaps
            vim.keymap.set('n', '<leader>p',
                require('nabla').popup,
                { desc = 'nabla [p]opup' })

            vim.keymap.set('n', '<leader>vn',
                function()
                    nablaToggle()
                end,
                { desc = '[n]abla [v]isual' })
        end,
    },
}
