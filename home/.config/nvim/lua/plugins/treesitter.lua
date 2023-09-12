local originalFiletypes = require("lsp.add-lang").filetypes
-- cloning sad life clowning
local newFiletypes = {}
table.insert(newFiletypes, "markdown")
for _, ft in ipairs(originalFiletypes) do
    table.insert(newFiletypes, ft)
end
return {
    "nvim-treesitter/nvim-treesitter",
    ft = newFiletypes,
    cmd = "AddLSP",
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
