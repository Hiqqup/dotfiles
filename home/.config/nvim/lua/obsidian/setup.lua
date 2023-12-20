return function()
    vim.keymap.set('n', '<leader>on', function()
        require("obsidian.telescope-create-picker")();
    end, { desc = "search or create [o]bsidian [n]ote" })

    vim.keymap.set('n', '<leader>og', function()
        require('telescope.builtin').live_grep({
            prompt_title = 'grep you notes',
            cwd = vim.g.vaultdir,
        })
    end, { desc = "[o]bsidian [g]rep" })
end
