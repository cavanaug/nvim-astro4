return {
  {
    "nvim-telescope/telescope.nvim",

    opts = function()
      local actions = require "telescope.actions"
      local get_icon = require("astroui").get_icon
      return {
        defaults = {
          mappings = {
            i = {
              -- I prefer c-s rather than c-x to open in horizontal split
              ["<C-x>"] = false
              ["<C-s>"] = actions.select_horizontal
            },
          },
        },
      }
    end,
    }
}
