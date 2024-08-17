return {
  { "AndrewRadev/bufferize.vim" },
  { "samoshkin/vim-mergetool" },
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = function(_, opts)
      opts.indent = { char = "┆" }
      -- opts.indent = { char = "" }
      -- opts.indent = { char = "╎" }
      -- opts.indent = { char = "┃" }
    end,
  },
  { -- lua, default settings
    require("better_escape").setup {
      timeout = vim.o.timeoutlen,
      default_mappings = true,
      mappings = {
        i = {
          k = {
            -- These can all also be functions
            j = "<Esc>",
          },
        },
        c = {
          k = {
            j = "<Esc>",
          },
        },
        t = {
          k = {
            j = "<Esc>",
          },
        },
        v = {
          k = {
            j = "<Esc>",
          },
        },
        s = {
          k = {
            j = "<Esc>",
          },
        },
      },
    },
  },
  -- {
  --   "max397574/better-escape.nvim",
  --   opts = function(_, opts)
  --     opts.indent = { char = "┆" }
  --     opts.mapping = { "kj", "jj" } -- I prefer to use 'kj' instead of 'jk'
  --     opts.timeout = vim.o.timeoutlen
  --     opts.clear_empty_lines = true
  --   end,
  -- },
  {
    -- TODO: This needs refactoring in light of mini-files usage
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
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

  {
    -- TODO: Move all theme and colorscheme related plugins to a separate file
    "projekt0n/github-nvim-theme",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
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
