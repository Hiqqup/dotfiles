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
    if selection ~= nil and selection ~= "" then
      vim.cmd(":e" .. vim.g.vaultdir .. "/notes/" .. selection .. ".md");
    end
  end)
  actions.preview_scrolling_down:replace(function()
    actions.close(prompt_bufnr)
    local selection = actions_state.get_selected_entry()
    --match file name and remove md if present
    selection = selection[1]:match("[^/]*$")
    selection = selection:gsub("%.md$", "")
    vim.api.nvim_put({ "[[" .. selection .. "]]" }, "", false, true)
  end)
  return true
end

local picker = function(opts)
  opts = opts or {}
  opts.entry_maker = make_entry.gen_from_file({ cwd = vim.g.vaultdir });
  pickers.new(opts, {
    attach_mappings = attach_mappings,
    prompt_title = "Find or Create Note",
    finder = finders.new_oneshot_job({ "rg", "--files", vim.g.vaultdir }, opts),
    previewer = conf.file_previewer(opts),
    sorter = conf.file_sorter(opts),
  }):find()
end

return picker
