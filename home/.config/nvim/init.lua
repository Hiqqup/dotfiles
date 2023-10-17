vim.g.vaultdir = vim.fn.expand "~" .. "/notes";
require("vanilla");
require("lazy-setup");
require("tmux");
require("obsidian.setup")();
