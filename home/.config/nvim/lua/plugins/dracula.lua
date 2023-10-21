return
{
    'Mofiqul/dracula.nvim',
    lazy = false,
    config = function()
        require("dracula").setup({
            colors = {
                bg = "#000000"
            }
        })
        vim.cmd.colorscheme 'dracula'
    end
}
