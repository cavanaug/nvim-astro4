-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  --
  -- ColorSchemes
  --
  -- { import = "astrocommunity.colorscheme.gruvbox-baby" },
  -- { "luisiacc/gruvbox-baby", lazy = false },
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.colorscheme.gruvbox-nvim" },
  { import = "astrocommunity.colorscheme.kanagawa-nvim" },
  { import = "astrocommunity.colorscheme.nightfox-nvim" },
  { import = "astrocommunity.colorscheme.rose-pine" },
  { import = "astrocommunity.colorscheme.sonokai" },
  { import = "astrocommunity.colorscheme.tokyonight-nvim" },
  { import = "astrocommunity.colorscheme.vscode-nvim" },
  { import = "astrocommunity.colorscheme.monokai-pro-nvim" },
  { "catppuccin", lazy = false },
  { "ellisonleao/gruvbox.nvim", lazy = false },
  { "rebelot/kanagawa.nvim", lazy = false },
  { "EdenEast/nightfox.nvim", lazy = false },
  { "rose-pine/neovim", lazy = false },
  { "sainnhe/sonokai", lazy = false },
  { "folke/tokyonight.nvim", lazy = false },
  { "Mofiqul/vscode.nvim", lazy = false },
  { "loctvl842/monokai-pro.nvim", lazy = false },

  --
  -- Motion & Features
  --
  { import = "astrocommunity.bars-and-lines.vim-illuminate" },
  { import = "astrocommunity.completion.cmp-cmdline" },
  { import = "astrocommunity.completion.copilot-lua" },
  { import = "astrocommunity.completion.copilot-lua-cmp" },
--  { import = "astrocommunity.debugging.nvim-bqf" },
  { import = "astrocommunity.diagnostics.trouble-nvim" },
  { import = "astrocommunity.editing-support.chatgpt-nvim" },

  { import = "astrocommunity.editing-support.telescope-undo-nvim" },
  { import = "astrocommunity.fuzzy-finder.telescope-zoxide" },

  { import = "astrocommunity.motion.flash-nvim" },
  { import = "astrocommunity.motion.harpoon" },
  { import = "astrocommunity.motion.marks-nvim" },
  { import = "astrocommunity.motion.mini-surround" },

  { import = "astrocommunity.register.nvim-neoclip-lua" },
  { import = "astrocommunity.scrolling.mini-animate" },
  { import = "astrocommunity.split-and-window.windows-nvim" },

  { import = "astrocommunity.indent.indent-blankline-nvim" },
  { import = "astrocommunity.indent.mini-indentscope" },
  -- { import = "astrocommunity.project.project-nvim" },
  -- { import = "astrocommunity.utility.noice-nvim" },
  -- { import = "astrocommunity.editing-support.ultimate-autopair-nvim" },
  -- { import = "astrocommunity.editing-support.todo-comments-nvim" },
  -- { import = "astrocommunity.motion.tabout-nvim" },
  -- { import = "astrocommunity.motion.leap-nvim" },
  -- { import = "astrocommunity.git.diffview-nvim" },

  --
  -- Recipes
  --
  { import = "astrocommunity.recipes.heirline-vscode-winbar" },
  { import = "astrocommunity.recipes.heirline-mode-text-statusline" },

  --
  -- Language Packs
  --
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.python-ruff" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.pack.cpp" },
  -- { import = "astrocommunity.pack.docker" },
  -- { import = "astrocommunity.pack.go" },
  -- { import = "astrocommunity.pack.rust" },
  -- { import = "astrocommunity.pack.zig" },
}
