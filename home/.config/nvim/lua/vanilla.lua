--all the options without pluginse-
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.netrw_hide = 1
vim.g.netrw_list_hide = [[\(^\|\s\s\)\zs\.\S\+]] --"\(^\|\s\s\)\zs\.\S\+"
vim.g.netrw_bufsettings = "noma nomod renu nobl nowrap ro nornu"
vim.keymap.set('n', '<leader>e', "<cmd>Ex<CR>")

vim.keymap.set("n", "<leader>rmc", "<cmd>call delete(expand('%'))<CR>")

vim.cmd[[
set foldmethod=syntax
set foldmethod=manual
]]

-- tmux
vim.keymap.set("n", "<leader>tnw", "<cmd>silent! !tmux new-window -c %:p:h<CR>")
vim.keymap.set("n", "<leader>tsh", "<cmd>silent! !tmux split-window -h -c %:p:h<CR>")
vim.keymap.set("n", "<leader>tss", "<cmd>silent! !tmux split-window -h -p 25 -c %:p:h<CR>")
vim.keymap.set("n", "<C-l>", "<cmd>silent! !tmux select-pane -R<CR>")
vim.keymap.set("n", "<C-h>", "<cmd>silent! !tmux select-pane -L<CR>")
vim.keymap.set("n", "<C-j>", "<cmd>silent! !tmux select-pane -D<CR>")
vim.keymap.set("n", "<C-k>", "<cmd>silent! !tmux select-pane -U<CR>")
-- tmux end

--this keeps the lsp from overwriting treesitter
--vim.highlight.priorities.semantic_tokens = 99

vim.o.autochdir = true
vim.g.tex_flavor = 'latex'

vim.o.tabstop = 4;
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.shiftwidth = 4;
-- Make line numbers default
vim.wo.number = true
vim.o.relativenumber = true

vim.o.hlsearch = false

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 1000

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})
