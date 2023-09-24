local prettier = {
  --"javascript",
  --"typescript",
  "html",
  "json",
  "css",
  "yaml",
}
local formatter_filetypes = {}
for _, ft in ipairs(prettier) do
  formatter_filetypes[ft] = function()
    return {
      exe = "prettierd",
      args = { vim.api.nvim_buf_get_name(0) },
      stdin = true
    }
  end
end
require("formatter").setup {
  filetype = formatter_filetypes,
}
vim.api.nvim_exec([[
  augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost * FormatWrite
  augroup END
]], false)
