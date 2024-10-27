-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
---------------------------------------------------------------------------------------------------
--- mini-family - A collection of mini plugins
---
--- Generally I prefer to use the mini family of plugins but situations do exists where they
--- are not the best choice. In those cases I will use other plugins.
---     alpha.nvim >> mini.starter
---------------------------------------------------------------------------------------------------

local ignore_filetypes = {
  "aerial",
  "alpha",
  "dashboard",
  "help",
  "lazy",
  "mason",
  "neo-tree",
  "NvimTree",
  "neogitstatus",
  "notify",
  "startify",
  "toggleterm",
  "Trouble",
}
local ignore_buftypes = {
  "nofile",
  "prompt",
  "quickfix",
  "terminal",
}
local char = "▏"
return {
  {
    ---------------------------------------------------------------------------------------------------
    --- mini-animate - Motion animation when jumping long distances
    ---------------------------------------------------------------------------------------------------
    "echasnovski/mini.animate",
    event = "VeryLazy",
    cond = not (vim.g.neovide or vim.g.vscode),
    -- enabled = false,
    opts = function()
      -- don't use animate when scrolling with the mouse
      local mouse_scrolled = false
      for _, scroll in ipairs { "Up", "Down" } do
        local key = "<ScrollWheel" .. scroll .. ">"
        vim.keymap.set({ "", "i" }, key, function()
          mouse_scrolled = true
          return key
        end, { expr = true })
      end

      local animate = require "mini.animate"
      return {
        resize = {
          timing = animate.gen_timing.linear { duration = 100, unit = "total" },
        },
        scroll = {
          timing = animate.gen_timing.linear { duration = 150, unit = "total" },
          subscroll = animate.gen_subscroll.equal {
            predicate = function(total_scroll)
              if mouse_scrolled then
                mouse_scrolled = false
                return false
              end
              return total_scroll > 1
            end,
          },
        },
        cursor = {
          timing = animate.gen_timing.linear { duration = 80, unit = "total" },
        },
      }
    end,
  },
  {
    ---------------------------------------------------------------------------------------------------
    --- mini.cursorword - Highlight the word under the cursor
    ---------------------------------------------------------------------------------------------------
    { "RRethy/vim-illuminate", enabled = false }, -- Disable & prefer mini.cursorword
    { "echasnovski/mini.cursorword", version = "*" },
  },
  {
    ---------------------------------------------------------------------------------------------------
    --- mini.files - A minimal file browser
    ---
    --- JOHNC: Im not happy with any of the file browsers i have tried so far. I will keep looking for a better one.
    ---------------------------------------------------------------------------------------------------
    "echasnovski/mini.files",
    version = "*",
    keys = {
      { "<Leader>e", function() require("mini.files").open() end, desc = "Toggle MiniFiles" },
      -- { "<Leader>E", "<Cmd>Neotree toggle<CR>", desc = "Toggle NeoTree" },
    },
    -- dependencies = {
    --   "nvim-tree/nvim-web-devicons",
    -- },
    opts = {},
  },
  {
    ---------------------------------------------------------------------------------------------------
    --- mini.icons - A minimal icon set
    ---------------------------------------------------------------------------------------------------
    "echasnovski/mini.icons",
    opts = function(_, opts)
      if vim.g.icons_enabled == false then opts.style = "ascii" end
    end,
    lazy = true,
    specs = {
      { "nvim-tree/nvim-web-devicons", enabled = false, optional = true },
      {
        "nvim-neo-tree/neo-tree.nvim",
        opts = {
          default_component_configs = {
            icon = {
              provider = function(icon, node)
                local text, hl
                local mini_icons = require "mini.icons"
                if node.type == "file" then
                  text, hl = mini_icons.get("file", node.name)
                elseif node.type == "directory" then
                  text, hl = mini_icons.get("directory", node.name)
                  if node:is_expanded() then text = nil end
                end

                if text then icon.text = text end
                if hl then icon.highlight = hl end
              end,
            },
            kind_icon = {
              provider = function(icon, node)
                icon.text, icon.highlight = require("mini.icons").get("lsp", node.extra.kind.name)
              end,
            },
          },
        },
      },
    },
    init = function()
      package.preload["nvim-web-devicons"] = function()
        require("mini.icons").mock_nvim_web_devicons()
        return package.loaded["nvim-web-devicons"]
      end
    end,
  },
  {
    ---------------------------------------------------------------------------------------------------
    --- mini.indentscope - Highlight the current scope
    ---------------------------------------------------------------------------------------------------
    "echasnovski/mini.indentscope",
    event = "User AstroFile",
    opts = function()
      return {
        options = { try_as_border = true },
        symbol = require("astrocore").plugin_opts("indent-blankline.nvim").context_char or char,
      }
    end,
    dependencies = {
      { "lukas-reineke/indent-blankline.nvim", optional = true, opts = { scope = { enabled = false } } },
      {
        "AstroNvim/astrocore",
        opts = {
          autocmds = {
            mini_indentscope = {
              {
                event = "FileType",
                desc = "Disable indentscope for certain filetypes",
                callback = function(event)
                  if vim.b[event.buf].miniindentscope_disable == nil then
                    local filetype = vim.bo[event.buf].filetype
                    local blankline_opts = require("astrocore").plugin_opts "indent-blankline.nvim"
                    if vim.tbl_contains(blankline_opts.filetype_exclude or ignore_filetypes, filetype) then
                      vim.b[event.buf].miniindentscope_disable = true
                    end
                  end
                end,
              },
              {
                event = "BufWinEnter",
                desc = "Disable indentscope for certain buftypes",
                callback = function(event)
                  if vim.b[event.buf].miniindentscope_disable == nil then
                    local buftype = vim.bo[event.buf].buftype
                    local blankline_opts = require("astrocore").plugin_opts "indent-blankline.nvim"
                    if vim.tbl_contains(blankline_opts.buftype_exclude or ignore_buftypes, buftype) then
                      vim.b[event.buf].miniindentscope_disable = true
                    end
                  end
                end,
              },
              {
                event = "TermOpen",
                desc = "Disable indentscope for terminals",
                callback = function(event)
                  if vim.b[event.buf].miniindentscope_disable == nil then
                    vim.b[event.buf].miniindentscope_disable = true
                  end
                end,
              },
            },
          },
        },
      },
    },
  },
}
