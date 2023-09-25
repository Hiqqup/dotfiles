return function()
    vim.keymap.set('n', '<leader>on', function()
        require("obsidian.telescope-create-picker")();
    end, { desc = "search or create [o]bsidian [n]ote" })

    vim.keymap.set('n', '<leader>ou', function()
        vim.cmd("ObsidianNew unnamed/")
    end, { desc = "[o]bsidian [u]nnamed note" })
end
