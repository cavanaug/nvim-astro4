-------------------------------------------------------------------------------------------------------------
---- Notes:
---- AstroCommunity: import any community modules here
---- We import this file in `lazy_setup.lua` before the `plugins/` folder.
---- This guarantees that the specs are processed before any user plugins.
-------------------------------------------------------------------------------------------------------------

---@type LazySpec
return {
    "AstroNvim/astrocommunity",
    { import = "astrocommunity.pack.lua" },

    -------------------------------------------------------------------------------------------------------------
    ----  WIP: Items under evaluation
    -------------------------------------------------------------------------------------------------------------

    -- { import = "astrocommunity.motion.mini-move" }, --           -- Setup with hydra as a submode??

    -------------------------------------------------------------------------------------------------------------
    ----  visual - UI Visual Decorations
    -------------------------------------------------------------------------------------------------------------
    --- Mostly moved to mini family
    ---
    -- { import = "astrocommunity.scrolling.mini-animate" }, --     -- Motion animation when jumping long distances
    -- { import = "astrocommunity.bars-and-lines.vim-illuminate" }, -- Highlight other instances of word under cursor
    -- { import = "astrocommunity.indent.mini-indentscope" }, --    -- This is about motion actions and highlighting indentation
    -- { import = "astrocommunity.icon.mini-icons" }, --            -- Icons in the gutter

    -- { import = "astrocommunity.color.mini-hipatterns" },
    -- { import = "astrocommunity.editing-support.todo-comments-nvim" },
    -- { import = "astrocommunity.indent.indent-blankline-nvim" },   -- Indenting is messed up, I need to figure out how to fix it

    -------------------------------------------------------------------------------------------------------------
    ----  lsp - LSP / Completion / Hover
    -------------------------------------------------------------------------------------------------------------
    { import = "astrocommunity.completion.avante-nvim" },
    { import = "astrocommunity.completion.cmp-cmdline" },
    { import = "astrocommunity.completion.copilot-lua" },
    { import = "astrocommunity.completion.copilot-lua-cmp" }, --                -- Fixes tab completion
    { import = "astrocommunity.utility.hover-nvim" },
    { import = "astrocommunity.lsp.nvim-lint" },
    { import = "astrocommunity.editing-support.conform-nvim" },

    -------------------------------------------------------------------------------------------------------------
    ----  motion - "BUFFER" Motion / Editing / Searching
    -------------------------------------------------------------------------------------------------------------
    { import = "astrocommunity.motion.flash-nvim" },
    { import = "astrocommunity.motion.mini-surround" },
    { import = "astrocommunity.motion.marks-nvim" }, --                         -- Marks in the gutter
    { import = "astrocommunity.editing-support.telescope-undo-nvim" }, --       -- Telescope undo stack
    { import = "astrocommunity.editing-support.dial-nvim" }, --       -- Telescope undo stack
    { import = "astrocommunity.editing-support.suda-vim" }, --       -- Sudo support
    -- { import = "astrocommunity.motion.tabout-nvim" }, --                        -- Tabout of (), {} etc

    -- { import = "astrocommunity.editing-support.ultimate-autopair-nvim" },

    -------------------------------------------------------------------------------------------------------------
    ----  navigation - "FILE" Navigation / Searching / Exporation / Navigation
    -------------------------------------------------------------------------------------------------------------
    -- { import = "astrocommunity.file-explorer.oil-nvim" },

    -- { import = "astrocommunity.fuzzy-finder.telescope-zoxide" },
    -- { import = "astrocommunity.file-explorer.telescope-file-browser-nvim" },
    -- { import = "astrocommunity.motion.harpoon" },

    -------------------------------------------------------------------------------------------------------------
    ----  misc - Other Various Features
    ---        - Possibly split out ai coding and project into different areas
    -------------------------------------------------------------------------------------------------------------
    -- { import = "astrocommunity.split-and-window.windows-nvim" }, -- TMUX support??
    -- { import = "astrocommunity.code-runner.overseer-nvim" },
    -- { import = "astrocommunity.diagnostics.trouble-nvim" },                     -- Need to learn this

    -- { import = "astrocommunity.terminal-integration.toggleterm-manager-nvim" }, -- TMUX support??
    -- { import = "astrocommunity.editing-support.chatgpt-nvim" },
    -- { import = "astrocommunity.project.project-nvim" },
    -- { import = "astrocommunity.debugging.nvim-bqf" },
    -- { import = "astrocommunity.register.nvim-neoclip-lua" },
    -- { import = "astrocommunity.utility.noice-nvim" },
    -- { import = "astrocommunity.git.diffview-nvim" },

    -------------------------------------------------------------------------------------------------------------
    ----  recipe - Predefined setup recipes
    -------------------------------------------------------------------------------------------------------------
    { import = "astrocommunity.recipes.heirline-vscode-winbar" },
    { import = "astrocommunity.recipes.heirline-mode-text-statusline" },

    -------------------------------------------------------------------------------------------------------------
    ----  language - Various Language support
    -------------------------------------------------------------------------------------------------------------
    { import = "astrocommunity.neovim-lua-development.lazydev-nvim" },

    -------------------------------------------------------------------------------------------------------------
    ----  packs - Language support packs
    -------------------------------------------------------------------------------------------------------------
    { import = "astrocommunity.pack.bash" },
    { import = "astrocommunity.pack.json" },
    { import = "astrocommunity.pack.lua" },
    -- { import = "astrocommunity.pack.markdown" },                                -- Using my own stack
    -- { import = "astrocommunity.pack.harper" }, -- Grammar checking
    { import = "astrocommunity.pack.python-ruff" },
    { import = "astrocommunity.pack.yaml" },
    -- { import = "astrocommunity.pack.cpp" },
    -- { import = "astrocommunity.pack.docker" },
    { import = "astrocommunity.pack.go" },
    -- { import = "astrocommunity.pack.rust" },
    -- { import = "astrocommunity.pack.zig" },
}
