-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
--
-- Add the following to your tmux.conf to enable vim-tmux-navigator as a companion
--     set -g @plugin 'christoomey/vim-tmux-navigator' # Tmux Neovim navigation integration
return {
  "mrjones2014/smart-splits.nvim",
  lazy = false,
  -- enable = false,
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local maps = opts.mappings
        maps.n["<C-Up>"] = false
        maps.n["<C-Down>"] = false
        maps.n["<C-Left>"] = false
        maps.n["<C-Right>"] = false
        maps.n["<A-h>"] = { function() require("smart-splits").resize_left() end, desc = "Resize split left (*)" }
        maps.n["<A-j>"] = { function() require("smart-splits").resize_down() end, desc = "Resize split down (*)" }
        maps.n["<A-k>"] = { function() require("smart-splits").resize_up() end, desc = "Resize split up (*)" }
        maps.n["<A-l>"] = { function() require("smart-splits").resize_right() end, desc = "Resize split right (*)" }
        maps.n["<leader><leader>h"] = { function() require("smart-splits").swap_buf_left() end, desc = "Swap left (*)" }
        maps.n["<leader><leader>j"] =
          { function() require("smart-splits").swap_buf_down() end, desc = "Swap below (*)" }
        maps.n["<leader><leader>k"] = { function() require("smart-splits").swap_buf_up() end, desc = "Swap above (*)" }
        maps.n["<leader><leader>l"] =
          { function() require("smart-splits").swap_buf_right() end, desc = "Swap right (*)" }
      end,
    },
  },
  opts = { ignored_filetypes = { "nofile", "quickfix", "qf", "prompt" }, ignored_buftypes = { "nofile" } },
}
