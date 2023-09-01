local js = { 'prettier', 'eslint' };
vim.g.ale_fixers =
{
  javascript = js,
  javascriptreact = js,
  typescript = js,
  typescriptreact = js,
  css = { 'prettier' },
}

vim.g.ale_fix_on_save = 1
