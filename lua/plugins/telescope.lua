-- JOHNC Note:
-- This only exists to customize
-- * 2 insert mode mappings for horizontal split.
-- * 2 normal mode mappings for fs & fb
--
-- I couldnt figure out how to simplify to just that and instead had to pull in the whole astrovim config file
--
return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", lazy = true },
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        lazy = true,
        enabled = vim.fn.executable("make") == 1,
        build = "make",
      },
      "nvim-treesitter/nvim-treesitter",
      "scottmckendry/telescope-resession.nvim", -- JOHNC
      {
        "AstroNvim/astrocore",
        opts = function(_, opts)
          local maps = opts.mappings
          local astro = require("astrocore")
          local is_available = astro.is_available
          maps.n["<Leader>f"] = vim.tbl_get(opts, "_map_sections", "f")
          maps.n["<Leader>g"] = vim.tbl_get(opts, "_map_sections", "g")
          maps.n["<Leader>gb"] = {
            function()
              require("telescope.builtin").git_branches({ use_file_path = true })
            end,
            desc = "Git branches",
          }
          maps.n["<Leader>gc"] = {
            function()
              require("telescope.builtin").git_commits({ use_file_path = true })
            end,
            desc = "Git commits (repository)",
          }
          maps.n["<Leader>gC"] = {
            function()
              require("telescope.builtin").git_bcommits({ use_file_path = true })
            end,
            desc = "Git commits (current file)",
          }
          maps.n["<Leader>gt"] = {
            function()
              require("telescope.builtin").git_status({ use_file_path = true })
            end,
            desc = "Git status",
          }
          maps.n["<Leader>f<CR>"] = {
            function()
              require("telescope.builtin").resume()
            end,
            desc = "Resume previous search",
          }
          maps.n["<Leader>f'"] = {
            function()
              require("telescope.builtin").marks()
            end,
            desc = "Find marks",
          }
          maps.n["<Leader>f/"] = {
            function()
              require("telescope.builtin").current_buffer_fuzzy_find()
            end,
            desc = "Find words in current buffer",
          }
          maps.n["<Leader>fa"] = {
            function()
              require("telescope.builtin").find_files({
                prompt_title = "Config Files",
                cwd = vim.fn.stdpath("config"),
                follow = true,
              })
            end,
            desc = "Find AstroNvim config files",
          }
          maps.n["<Leader>fb"] = {
            function()
              require("telescope").extensions.file_browser.file_browser()
            end,
            desc = "File browser (*)",
          } -- JOHNC

          maps.n["<Leader>fB"] = {
            function()
              require("telescope.builtin").buffers()
            end,
            desc = "Find buffers (*)",
          } -- JOHNC
          maps.n["<Leader>fc"] = {
            function()
              require("telescope.builtin").grep_string()
            end,
            desc = "Find word under cursor",
          }
          maps.n["<Leader>fC"] = {
            function()
              require("telescope.builtin").commands()
            end,
            desc = "Find commands",
          }
          maps.n["<Leader>ff"] = {
            function()
              require("telescope.builtin").find_files()
            end,
            desc = "Find files",
          }
          maps.n["<Leader>fF"] = {
            function()
              require("telescope.builtin").find_files({ hidden = true, no_ignore = true })
            end,
            desc = "Find all files",
          }
          maps.n["<Leader>fh"] = {
            function()
              require("telescope.builtin").help_tags()
            end,
            desc = "Find help",
          }
          maps.n["<Leader>fk"] = {
            function()
              require("telescope.builtin").keymaps()
            end,
            desc = "Find keymaps",
          }
          maps.n["<Leader>fm"] = {
            function()
              require("telescope.builtin").man_pages()
            end,
            desc = "Find man",
          }
          if is_available("nvim-notify") then
            maps.n["<Leader>fn"] = {
              function()
                require("telescope").extensions.notify.notify()
              end,
              desc = "Find notifications",
            }
          end
          maps.n["<Leader>fo"] = {
            function()
              require("telescope.builtin").oldfiles()
            end,
            desc = "Find history",
          }
          maps.n["<Leader>fr"] = {
            function()
              require("telescope.builtin").registers()
            end,
            desc = "Find registers",
          }
          maps.n["<Leader>fs"] = {
            function()
              require("telescope").extensions.resession.resession()
            end,
            desc = "Find sessions (*)",
          } -- JOHNC
          maps.n["<Leader>ft"] = {
            function()
              require("telescope.builtin").colorscheme({ enable_preview = true })
            end,
            desc = "Find themes",
          }
          maps.n["<Leader>fw"] = {
            function()
              require("telescope.builtin").live_grep()
            end,
            desc = "Find words",
          }
          maps.n["<Leader>fW"] = {
            function()
              require("telescope.builtin").live_grep({
                additional_args = function(args)
                  return vim.list_extend(args, { "--hidden", "--no-ignore" })
                end,
              })
            end,
            desc = "Find words in all files",
          }
          maps.n["<Leader>ls"] = {
            function()
              if is_available("aerial.nvim") then
                require("telescope").extensions.aerial.aerial()
              else
                require("telescope.builtin").lsp_document_symbols()
              end
            end,
            desc = "Search symbols",
          }
        end,
      },
    },
    cmd = "Telescope",
    opts = function()
      local actions = require("telescope.actions")
      local get_icon = require("astroui").get_icon
      return {
        defaults = {
          previewer = true,
          git_worktrees = require("astrocore").config.git_worktrees,
          prompt_prefix = get_icon("Selected", 1),
          selection_caret = get_icon("Selected", 1),
          path_display = { "truncate" },
          sorting_strategy = "ascending",
          layout_config = {
            horizontal = { prompt_position = "top", preview_width = 0.55 },
            vertical = { mirror = false },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 1,
          },
          mappings = {
            i = {
              -- JOHNC: I prefer to keep horizontal split mappings to the S key
              ["<C-x>"] = false, -- JOHNC
              ["<C-s>"] = actions.select_horizontal, -- JOHNC
              --
              ["<C-n>"] = actions.cycle_history_next,
              ["<C-p>"] = actions.cycle_history_prev,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
            },
            n = { q = actions.close },
          },
        },
      }
    end,
    config = function(...)
      require("astronvim.plugins.configs.telescope")(...)
    end,
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
}
