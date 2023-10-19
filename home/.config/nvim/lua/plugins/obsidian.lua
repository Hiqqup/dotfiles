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
            require("obsidian.markdown-preview")
        },
        config = function()
            require("obsidian").setup({
                dir = vaultdir,
                notes_subdir = "unnamed",
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
                },
                disable_frontmatter = true,
                note_id_func = function(title)
                    title = title or ""
                    local dateTable = os.date("*t")
                    local formattedDate = string.format("%02d-%02d-%04d-%02d:%02d:%02d%s",
                        dateTable.day, dateTable.month, dateTable.year,
                        dateTable.hour, dateTable.min, dateTable.sec, title)

                    return formattedDate
                end
            });
            vim.keymap.set('n', '<leader>oc', function()
                require("obsidian.image").paste();
            end, { desc = "[o]bsidian paste image from [c]lipboard" })

            vim.keymap.set('n', '<leader>od', function()
                require("obsidian.image").draw();
            end, { desc = "[o]bsidian [d]raw" })
        end,
    },
    setup = function()
        vim.keymap.set('n', '<leader>on', function()
            require("obsidian.telescope-create-picker")();
        end, { desc = "search or create [o]bsidian [n]ote" })

        vim.keymap.set('n', '<leader>ou', function()
            vim.cmd("ObsidianNew")
        end, { desc = "[o]bsidian [u]nnamed note" })
    end,
}
