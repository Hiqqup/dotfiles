vim.g.vaultdir = vim.fn.expand "~" .. "/5head";
require("vanilla");
require("lazy-setup");
require("tmux");
require("obsidian.setup")();
