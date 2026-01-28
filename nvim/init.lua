vim.cmd([[set shada+=!]])-- restore marks after closing

vim.opt.signcolumn="yes" -- warning col for sanity


--- keybindings --------------------------------------------
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("n", "<leader>ic", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references)
vim.keymap.set("n", "<leader>d", vim.lsp.buf.definition)
vim.keymap.set("n", "<leader>D", vim.lsp.buf.declaration)


--- C / C++ lsp --------------------------------------------
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

--- gdscript lsp --------------------------------------------
vim.api.nvim_create_autocmd("FileType", {
  pattern = {"gdscript"},
  callback = function()
    vim.lsp.start({
      name = "godot",
      cmd = vim.lsp.rpc.connect("127.0.0.1", 6005),
      root_dir = vim.fs.root(0, { "project.godot" }),	
    })
  end,
})

--- set omnifunc to be lsp completion ------------------------
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    vim.bo[args.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
  end,
})

