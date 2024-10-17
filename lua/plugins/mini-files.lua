-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
-- JOHNC: Im not happy with any of the file browsers i have tried so far. I will keep looking for a better one.
return {
  {
    "echasnovski/mini.files",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      {
        "AstroNvim/astrocore",
        opts = {
          mappings = {
            n = {
              -- Allow for both neotree and mini.files to be used
              ["<Leader>e"] = { function() require("mini.files").open() end, desc = "Explorer" },
              ["<Leader>E"] = { "<Cmd>Neotree toggle<CR>", desc = "Toggle Explorer" },
            },
          },
        },
      },
    },
    opts = {},
  },
  {
    "catppuccin/nvim",
    optional = true,
    ---@type CatppuccinOptions
    opts = { integrations = { mini = true } },
  },
}
