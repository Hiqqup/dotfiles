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
        local dracula_colors = require("dracula").colors();
        vim.api.nvim_set_hl(0, 'TabLine', {
            bg = dracula_colors.selection,
            fg = dracula_colors.white,  
        })

        vim.api.nvim_set_hl(0, 'TabLineSel', {
            bg = dracula_colors.purple,
            fg = dracula_colors.bg,  
            bold = true,                         
        })
        vim.api.nvim_set_hl(0, "NormalNC", { bg = dracula_colors.black })
        vim.api.nvim_set_hl(0, "SignColumnNC", { bg = dracula_colors.bg})

    end
}
