local vaultdir = vim.g.vaultdir;
return {
    plugin = {
        "epwalsh/obsidian.nvim",
        lazy = true,
        cmd = {
            "ObsidianNew",
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
        vim.keymap.set('n', '<leader>on', function()
            require("obsidian.telescope-create-picker")();
        end, { desc = "search or create [o]bsidian [n]ote" })
    end,
}
