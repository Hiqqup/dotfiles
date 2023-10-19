require('live-server').setup()
vim.keymap.set('n', '<leader>lss', require('live-server').start)
vim.keymap.set('n', '<leader>ls', require('live-server').stop)
