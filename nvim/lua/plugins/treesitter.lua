return {
    "nvim-treesitter/nvim-treesitter",
    ft = GLOBAL_filetypes,
    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = {
                "markdown",
                "markdown_inline",
            },
            auto_install = true,
            sync_install = false,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = { "markdown" },
            },
            indent = { enable = true },
        })
    end
}
