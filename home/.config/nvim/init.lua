vim.g.vaultdir = vim.fn.expand "~" .. "/5head";
require("vanilla");
require("scripts");
require("lazy-setup");
require("tmux");

vim.keymap.set('n', '<leader>oc', function()
    require("obsidian.paste-image");
end, { desc = "search or create [o]bsidian paste image from clipboard" })
