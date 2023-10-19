vim.api.nvim_create_user_command("BunTsconfig", function()
    vim.cmd("!bun add -d bun-types && cp ~/.config/tsconfig/bun.json %:p:h/tsconfig.json")
end, {})

