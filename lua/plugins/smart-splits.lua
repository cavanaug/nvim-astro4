return {
  "mrjones2014/smart-splits.nvim",
  lazy = true,
  enable = false,
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local maps = opts.mappings
        -- maps.n["<C-Up>"] = false
        -- maps.n["<C-Down>"] = false
        -- maps.n["<C-Left>"] = false
        -- maps.n["<C-Right>"] = false
        -- maps.n["<C-h>"] = { function() require("smart-splits").move_cursor_left() end, desc = "Move to left split" }
        -- maps.n["<C-j>"] = { function() require("smart-splits").move_cursor_down() end, desc = "Move to below split" }
        -- maps.n["<C-k>"] = { function() require("smart-splits").move_cursor_up() end, desc = "Move to above split" }
        -- maps.n["<C-l>"] = { function() require("smart-splits").move_cursor_right() end, desc = "Move to right split" }
        maps.n["<A-h>"] = { function() require("smart-splits").resize_left() end, desc = "Resize left" }
        maps.n["<A-j>"] = { function() require("smart-splits").resize_down() end, desc = "Resize down" }
        maps.n["<A-k>"] = { function() require("smart-splits").resize_up() end, desc = "Resize up" }
        maps.n["<A-l>"] = { function() require("smart-splits").resize_right() end, desc = "Resize right" }
        maps.n["<leader><leader>h"] = { function() require("smart-splits").swap_buf_left() end, desc = "Swap left" }
        maps.n["<leader><leader>j"] = { function() require("smart-splits").swap_buf_down() end, desc = "Swap below" }
        maps.n["<leader><leader>k"] = { function() require("smart-splits").swap_buf_up() end, desc = "Swap above" }
        maps.n["<leader><leader>l"] = { function() require("smart-splits").swap_buf_right() end, desc = "Swap right" }
      end,
    },
  },
  opts = { ignored_filetypes = { "nofile", "quickfix", "qf", "prompt" }, ignored_buftypes = { "nofile" } },
}
