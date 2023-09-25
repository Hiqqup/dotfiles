return function()
    vim.keymap.set('n', '<leader>on', function()
        require("obsidian.telescope-create-picker")();
    end, { desc = "search or create [o]bsidian [n]ote" })

    vim.keymap.set('v', '<leader>of', function()
        require("obsidian.open-files")();
    end, { desc = "[o]bsidian [f]ile" })
end
