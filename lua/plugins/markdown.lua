return {
  --------------------------------------------------------------------------------------
  { --- Markdown syntax highlighting
    "tadmccorkle/markdown.nvim",
    ft = { "markdown", "norg", "rmd", "org" },
    opts = {
      -- configuration here or empty for defaults
    },
  },
  --------------------------------------------------------------------------------------
  { --- Markdown inline view
    "MeanderingProgrammer/render-markdown.nvim",

    opts = {
      -- render_modes = { "n", "c" },
      render_modes = true,
      code = {
        sign = true,
        width = "block",
        right_pad = 1,
      },
      heading = {
        enabled = true,
        sign = false,
        position = "overlay",
        icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
      },
    },
    ft = { "markdown", "norg", "rmd", "org" },
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter",
      },
    },
    config = function(_, opts)
      require("render-markdown").setup(opts)
    end,
  },
  --------------------------------------------------------------------------------------
  { --- Markdown preview
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown", "norg", "rmd", "org" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  --------------------------------------------------------------------------------------
  { --- Markdown linting
    "mfussenegger/nvim-lint",
    optional = disabled,
    opts = {
      linters_by_ft = {
        markdown = { "markdownlint-cli2" },
      },
      -- linters = {
      --   -- https://github.com/LazyVim/LazyVim/discussions/4094#discussioncomment-10178217
      --   ["markdownlint-cli2"] = { args = { "--config", os.getenv("HOME") .. "/.markdownlint-cli2.yaml", "--" } },
      -- },
    },
  },
  --------------------------------------------------------------------------------------
  { --- Vim pencil support
    "preservim/vim-pencil",
    enabled = false,
  },
  --------------------------------------------------------------------------------------
  { --- Zen mode
    "folke/zen-mode.nvim",
    enabled = false,
  },
  --------------------------------------------------------------------------------------
  { --- Spell check as warnings
    "ravibrock/spellwarn.nvim",
    enabled = false,
    event = "VeryLazy",
    config = true,
    opts = {
      event = { -- event(s) to refresh diagnostics on
        "CursorHold",
        "InsertLeave",
        "TextChanged",
        "TextChangedI",
        "TextChangedP",
        "TextChangedT",
        "FileAppendCmd", -- To detect a zg add to spellfile
      },
    },
  },
  --------------------------------------------------------------------------------------
  { --- Classic bullets
    "bullets-vim/bullets.vim",
    enabled = true,
    ft = { "markdown", "norg", "rmd", "org" },
  },
}
