vim.cmd([[set shada+=!]])-- restore marks after closing

vim.opt.signcolumn="yes" -- warning col for sanity

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp", "objc", "objcpp" },
  callback = function()
    vim.lsp.start({
      name = "clangd",
      cmd = { "clangd" },
      root_dir = vim.fs.root(0, {
        "compile_commands.json",
        "compile_flags.txt",
        ".git",
      }),
    })
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    vim.bo[args.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
  end,
})
