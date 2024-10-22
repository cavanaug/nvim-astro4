return {
  "nvimtools/hydra.nvim",
  config = function()
    local Hydra = require "hydra"
    vim.keymap.set("n", "<leader>js", "", { noremap = true, desc = "Modal Scroll Win (*)" })
    Hydra {
      name = "Scroll Win",
      mode = "n",
      hint = "Scroll Win",
      body = "<leader>js",
      heads = {
        { "h", "zh", { desc = "Scroll  " } },
        { "l", "zl", { desc = "Scroll  " } },
        { "j", "<C-E>", { desc = "Scroll  " } },
        { "k", "<C-Y>", { desc = "Scroll  " } },
      },
    }
    vim.keymap.set("n", "<leader>jm", "", { noremap = true, desc = "Modal Move Win (*)" })
    Hydra {
      name = "Move Win",
      mode = "n",
      body = "<leader>jm",
      heads = {
        { "h", "<C-W>H", { desc = "Move  " } },
        { "l", "<C-W>L", { desc = "Move  " } },
        { "j", "<C-W>J", { desc = "Move  " } },
        { "k", "<C-W>K", { desc = "Move  " } },
        { "s", "<C-W>r", { desc = "Swap (*)" } },
      },
    }
    vim.keymap.set("n", "<leader>jr", "", { noremap = true, desc = "Modal Resize Win (*)" })
    Hydra {
      name = "Resize Win",
      mode = "n",
      body = "<leader>jr",
      heads = {
        { "h", "<C-W><", { desc = "Size  " } },
        { "l", "<C-W>>", { desc = "Size  " } },
        { "j", "<C-W>-", { desc = "Size  " } },
        { "k", "<C-W>+", { desc = "Size  " } },
      },
    }
  end,
}
