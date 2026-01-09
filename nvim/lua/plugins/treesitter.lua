return {
    "nvim-treesitter/nvim-treesitter",
    ft = GLOBAL_filetypes,
    commit = "42fc28ba918343ebfd5565147a42a26580579482",
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
