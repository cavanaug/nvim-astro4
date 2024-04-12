-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
return {
  "nvimtools/hydra.nvim",
  -- keys = {
  --   { "<leader>ft", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
  -- },
  config = function()
    local Hydra = require "hydra"
    Hydra {
      name = "Scroll Win",
      mode = "n",
      hint = "Scroll Win",
      body = "<leader>js",
      heads = {
        { "j", "<C-E>", { desc = "Scroll " } },
        { "k", "<C-Y>", { desc = "Scroll " } },
        { "h", "zh", { desc = "Scroll " } },
        { "l", "zl", { desc = "Scroll " } },
      },
    }
    Hydra {
      name = "Move Win",
      mode = "n",
      body = "<leader>jm",
      heads = {
        { "h", "<C-W>H", { desc = "Move L" } },
        { "j", "<C-W>J", { desc = "Move D" } },
        { "k", "<C-W>K", { desc = "Move U" } },
        { "l", "<C-W>L", { desc = "Move R" } },
        { "s", "<C-W>r", { desc = "Swap" } },
      },
    }
    Hydra {
      name = "Resize Win",
      mode = "n",
      body = "<leader>jr",
      heads = {
        { "h", "<C-W><", { desc = "Size H-" } },
        { "j", "<C-W>+", { desc = "Size V+" } },
        { "k", "<C-W>-", { desc = "Size V-" } },
        { "l", "<C-W>>", { desc = "Size H+" } },
      },
    }
  end,
}
