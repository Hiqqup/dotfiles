local vaultdir = vim.g.vaultdir;
return {
    plugin = {
        "epwalsh/obsidian.nvim",
        lazy = true,
        cmd = {
            "ObsidianNew",
            "ObsidianSearch",

        },
        event = {
            "BufReadPre " .. vaultdir .. "/**.md",
            "BufNewFile " .. vaultdir .. "/**.md",
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("obsidian").setup({
                dir = vaultdir,
                notes_subdir = "notes",
                daily_notes = {
                    folder = "dailies",
                },
                completion = {
                    nvim_cmp = true,
                    min_chars = 2,
                    new_notes_location = "notes",
                },
                mappings = {
                    ["gf"] = require("obsidian.mapping").gf_passthrough(),
                },

                templates = {
                    subdir = "templates",
                }
            });
        end,
    },

    setup = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>on',
            function()
                builtin.find_files({
                    cdw = vim.g.vaultdir,
                })
            end,
            { desc = "search or create [o]bsidian [n]ote" })
    end,
    create = function()
        print("hello form obsidian");
    end
}
