--- TODO: Need to add spell checking support
return {
  {
    -- Markdown preview
    -- TODO: Need to fix the colorscheme for vscode        -- --
    "MeanderingProgrammer/markdown.nvim",
    main = "render-markdown",
    opts = {},
    name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you use the mini.nvim suite
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
  { -- Vim pencil support
    "preservim/vim-pencil",
  },
  {
    -- Obsidian notes support
    "epwalsh/obsidian.nvim",
    enabled = true, -- testing this out
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  { -- Zen mode
    "folke/zen-mode.nvim",
  },
}
