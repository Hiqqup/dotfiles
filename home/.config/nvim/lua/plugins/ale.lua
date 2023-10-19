local js = { 'prettier',
  'eslint'
};
local pr = { 'prettier' };
vim.g.ale_fixers =
{
  javascript = js,
  javascriptreact = js,
  typescript = js,
  typescriptreact = js,
  css = pr,
  json = pr,
}

vim.g.ale_fix_on_save = 1
