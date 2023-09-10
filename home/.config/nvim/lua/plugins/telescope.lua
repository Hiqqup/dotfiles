local obsidian = require("plugins.obsidian")
return
{
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',

        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            cond = function()
                return vim.fn.executable 'make' == 1
            end,
        },
    },
    event = "VeryLazy",
    config = function()
        require('telescope').setup()
        local builtin = require('telescope.builtin')

        vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers,
            { desc = '[ ] Find existing buffers' })
        vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags,
            { desc = '[S]earch [H]elp' })

        obsidian.setup();
    end
}
