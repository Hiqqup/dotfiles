return {
    {
        "iamcco/markdown-preview.nvim",
        build = "cd app && npm install",
        ft = "markdown",
        lazy = true,
        keys = { { "gm", "<cmd>MarkdownPreviewToggle<cr>", desc = "Markdown Preview" } },
        config = function()
            vim.g.mkdp_auto_close = true
            vim.g.mkdp_open_to_the_world = false
            vim.g.mkdp_open_ip = "127.0.0.1"
            vim.g.mkdp_port = "8888"
            -- Define the Vimscript function in Lua
            vim.cmd([[
  function! OpenMarkdownPreview(url)
  let cmd = "brave --new-window --class=preview " . a:url
  silent execute "! " . cmd
  endfunction
]])
            -- Bind the function to a global variable
            vim.g.mkdp_browserfunc = "OpenMarkdownPreview"

            vim.g.mkdp_echo_preview_url = true
            vim.g.mkdp_page_title = "${name}"
        end,
    },

}
