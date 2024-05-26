-- set vim options here (vim.<first_key>.<second_key> = value)
return {
  {
    "AstroNvim/astrocore",
    ---@param opts AstroCoreOpts
    opts = {
      options = {
        opt = {
          backup = true,
          backupdir = ".bkp/," .. vim.env.HOME .. "/.local/state/nvim/backup/",
          -- clipboard = "unnamed",
          clipboard = "",
          conceallevel = 2, -- enable conceal
          cursorline = true,
          -- cursorcolumn = true,
          ignorecase = true,
          smartcase = true,
          linebreak = true, -- linebreak soft wrap at words
          list = true, -- show whitespace characters
          listchars = { tab = " ", extends = "⟩", precedes = "⟨", trail = "·", eol = "¬" },
          modeline = true,
          number = false, -- sets vim.opt.number
          relativenumber = false, -- sets vim.opt.relativenumber
          scrolloff = 5, -- give at least 3 lines of text before/after active line
          showbreak = "↪ ",
          signcolumn = "yes", -- sets vim.opt.signcolumn to auto
          spell = false, -- sets vim.opt.spell
          undodir = vim.env.HOME .. "/.local/state/nvim/undo/,.",
          wrap = true, -- sets vim.opt.wrap
          writebackup = true,
          termsync = false,

          -- Treesitter folding
          -- foldcolumn = "2", -- set the foldclolumn width
          -- foldenable = true,
          -- foldmethod = "expr",
          -- foldexpr = "nvim_treesitter#foldexpr()", -- set Treesitter based folding

          -- Ufo folding
          foldcolumn = "auto",
          foldlevel = 99,
          foldlevelstart = -1,
          foldenable = true,
        },
        g = {
          mapleader = " ", -- sets vim.g.mapleader
          localleader = ",", -- sets vim.g.localleader
          autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
          autopairs_enabled = true, -- enable autopairs at start
          cmp_enabled = true, -- enable completion at start
          diagnostics_mode = 3, -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
          icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
          ui_notifications_enabled = true, -- disable notifications when toggling UI elements
          vim_json_conceal = 0,
        },
      },
    },
  },
}
