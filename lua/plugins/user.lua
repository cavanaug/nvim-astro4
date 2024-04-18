-- TODO: THIS WHOLE FILE NEEDS TO BE REFACTORED TO USE LAZY CONFIGURATION WITH FUNCTIONS
return {
  { "AndrewRadev/bufferize.vim" },
  { "samoshkin/vim-mergetool" },
  {
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
    "projekt0n/github-nvim-theme",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    -- main = "ibl", --
    opts = function(plugin, opts)
      opts.indent = { char = "┆" }
      -- opts.indent = { char = "" }
      -- opts.indent = { char = "╎" }
      -- opts.indent = { char = "┃" }
    end,
  },
  {
    "max397574/better-escape.nvim",
    opts = function(plugin, opts)
      opts.indent = { char = "┆" }
      opts.mapping = { "kj", "jj" } -- a table with mappings to use
      opts.timeout = vim.o.timeoutlen -- the time in which the keys must be hit in ms. Use option timeoutlen by default
      opts.clear_empty_lines = true -- clear line after escaping if there is only whitespace
    end,
  },
  -- require("illuminate").configure {
  --   under_cursor = true,
  --   min_count_to_highlight = 2,
  -- },
  -- require("mini.indentscope").setup {
  --   symbol = "│",
  -- },
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
