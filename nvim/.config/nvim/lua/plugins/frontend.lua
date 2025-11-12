local codebook = require("plugins.codebook")
return {
  {
    "mattn/emmet-vim",
    ft = { "html", "css", "javascriptreact", "typescriptreact" },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = function()
      require("nvim-treesitter.install").update({ with_sync = true })()
    end,
  },
  {
    "windwp/nvim-autopairs",
    opts = { check_ts = true },
    config = function(_, opts)
      require("nvim-autopairs").setup(opts)
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- Adicione ou sobrescreva servidores
      opts.servers = vim.tbl_deep_extend("force", opts.servers or {}, {
        tsserver = {},
        tailwindcss = {},
        eslint = { enabled = false },
        emmet_language_server = {},
        codebook = false,
      })
      opts.servers.gopls = {
        settings = {
          gopls = {
            analyses = {
              unusedparams = true,
            },
            staticcheck = true,
            usePlaceholders = true,
            completeUnimported = true, -- This enables auto-import
            gofumpt = true,
          },
        },
      }

      -- Exemplo: sobrescrever on_attach global
      -- seu código aqui

      return opts
    end,
  },
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "typescript-language-server",
      },
    },
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      size = 20,
      open_maping = [[<leader>t]],
      direction = "horizontal",
    },
  },
}
