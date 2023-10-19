return {
  {
    'neovim/nvim-lspconfig',
    cmd = { "AddLSP", "AddFT" },
    ft = require("lsp.add-lang").filetypes,
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      'folke/neodev.nvim',

      --icons
      'nvim-tree/nvim-web-devicons',
      --snippets
    },
    config = function()
      require("lsp.add-lang").setup();
      require("lsp.lsp");
    end
  },
  {
    --format
    'mhartington/formatter.nvim',
    dependencies = {
      --linting
      --'mfussenegger/nvim-lint',
    },
    event = "BufWrite",
    config = function()
      require("lsp.formatter");
    end,
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    cmd = {
      "MasonToolsInstall",
      "MasonToolsUpdate",
    },
    config = function()
      require("lspconfig");
      require('mason-tool-installer').setup {
        ensure_installed = {
          "prettierd",
        }
      }
    end,
  },

}
