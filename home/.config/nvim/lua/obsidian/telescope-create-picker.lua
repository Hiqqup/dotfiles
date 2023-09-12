local pickers = require("telescope.pickers");
local finders = require("telescope.finders");
local conf = require("telescope.config").values;
local actions = require("telescope.actions")
local actions_state = require("telescope.actions.state")
local make_entry = require("telescope.make_entry")


local attach_mappings = function(prompt_bufnr, map)
    actions.select_tab:replace(function()
        actions.close(prompt_bufnr)
        local selection = actions_state.get_current_line()
        --if selection ~= nil and selection ~= "" then
        vim.cmd("ObsidianNew " .. selection .. ".md");
        --end
    end)
    return true
end
local entry_maker = function(entry)
    return {
        value = entry,
        --display = entry[1]:match(".+/([^/]+)$"),
        display = "foo",
        ordinal = entry[1],
    }
end

local picker = function(opts)
    opts = opts or {}
    opts.entry_maker = make_entry.gen_from_file({ cwd = vim.g.vaultdir .. "/notes/" });
    pickers.new(opts, {
        attach_mappings = attach_mappings,
        prompt_title = "Find or Create Note",
        finder = finders.new_oneshot_job({ "rg", "--files", vim.g.vaultdir .. "/notes/" }, opts),
        previewer = conf.file_previewer(opts),
        sorter = conf.file_sorter(opts),
    }):find()
end

return picker
