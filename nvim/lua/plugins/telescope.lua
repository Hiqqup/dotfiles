return
{
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    event = "VeryLazy",
    config = function()
        require('telescope').setup()
        --local builtin = require('telescope.builtin')

        vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers,
            { desc = '[ ] Find existing buffers' })
        vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags,
            { desc = '[S]earch [H]elp' })
        vim.keymap.set('n', '<leader>/', function()
            require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                winblend = 10,
                previewer = false,
            })
        end, { desc = '[/] Fuzzily search in current buffer' })
        vim.keymap.set('n', '<leader>ff',
            require('telescope.builtin').find_files,
            { desc = '[f]ind [f]iles' })
        vim.keymap.set('n', '<leader>lg',
            require('telescope.builtin').live_grep,
            { desc = '[l]ive [g]rep' })
    end


}
