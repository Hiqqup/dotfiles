vim.g.vaultdir = vim.fn.expand "~" .. "/notes";
require("vanilla");
require("lazy-setup");
require("obsidian.setup")();
