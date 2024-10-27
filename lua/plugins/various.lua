return {
  {
    -- Prettier indent markers
    "lukas-reineke/indent-blankline.nvim",
    opts = function(_, opts)
      opts.indent = { char = "┆" }
      -- opts.indent = { char = "" }
      -- opts.indent = { char = "╎" }
      -- opts.indent = { char = "┃" }
    end,
  },
  { -- Faster than esc for me
    "max397574/better-escape.nvim",
  },
  -- {
  --   require("better_escape").setup({
  --     timeout = vim.o.timeoutlen,
  --     default_mappings = false,
  --     mappings = {
  --       i = { k = { j = "<Esc>" } },
  --       c = { k = { j = "<Esc>" } },
  --       -- t = { k = { j = "<Esc>", }, },
  --       -- v = { k = { j = "<Esc>", }, },
  --       s = { k = { j = "<Esc>" } },
  --     },
  --   }),
  -- },
  {
    -- TODO: This needs refactoring in light of mini-files & oil usage
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      -- JC:  Hopefully we get kitty graphics protocol in windows Terminal
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    opts = {
      filesystem = {
        filtered_items = {
          visible = false, -- when true, they will just be displayed differently than normal items
          hide_dotfiles = true,
          hide_gitignored = true,
          hide_hidden = false, -- only works on Windows for hidden files/directories
          hide_by_name = {
            ".DS_Store",
            "thumbs.db",
            "node_modules",
          },
          hide_by_pattern = {
            --"*.meta",
            --"*/src/*/tsconfig.json",
          },
          always_show = { -- remains visible even if other settings would normally hide it
            ".gitignore",
            ".local",
            ".config",
          },
          never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
            ".DS_Store",
            "thumbs.db",
          },
          never_show_by_pattern = { -- uses glob style patterns
            ".null-ls_*",
          },
        },
      },
    },
  },

  -- require("lspconfig")["yamlls"].setup {
  --   settings = {
  --     yaml = {
  --       schemas = {
  --         ["http://json-schema.org/draft-07/schema#"] = "*.schema.yaml",
  --       },
  --     },
  --   },
  -- },
  --
}
