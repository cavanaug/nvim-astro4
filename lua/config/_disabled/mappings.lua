return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        --
        -- Normal Mode Maps
        --
        v = {
          --
          -- Clipboard Mappings
          --
          ["<leader>Y"] = { '"+y', desc = "Yank to system clipboard (*)" },
          ["<leader>P"] = { '"+p', desc = "Paste from system clipboard (*)" },
        },
        n = {
          --
          -- navigate buffer tabs with `H` and `L`
          L = {
            function() require("astrocore.buffer").nav(vim.v.count1) end,
            desc = "Next buffer (*)",
          },
          H = {
            function() require("astrocore.buffer").nav(-vim.v.count1) end,
            desc = "Previous buffer (*)",
          },

          -- Reserved these for tmux, use <leader>jr for hydra resize
          ["<A-k>"] = { function() require("smart-splits").resize_up() end, desc = "Resize split up (*)" },
          ["<A-j>"] = { function() require("smart-splits").resize_down() end, desc = "Resize split down (*)" },
          ["<A-h>"] = { function() require("smart-splits").resize_left() end, desc = "Resize split left (*)" },
          ["<A-l>"] = { function() require("smart-splits").resize_right() end, desc = "Resize split right (*)" },

          -- Improved
          ["<Leader>C"] = { function() require("astrocore.buffer").close() end, desc = "Close buffer (*)" },
          ["<Leader>c"] = { "<cmd>close<cr>", desc = "Close pane (*)" },
          ["<C-C>"] = { function() require("astrocore.buffer").close(0, true) end, desc = "Close buffer (FORCE) (*)" },

          ["<C-Up>"] = false,
          ["<C-Down>"] = false,
          ["<C-Left>"] = false,
          ["<C-Right>"] = false,

          ["<M-,>"] = { "<cmd>ToggleTerm direction=float<cr>", desc = "Toggle Term [Float] (*)" },

          --
          --   Merge/Diff Mappings
          --
          -- Note: This is entirely predicated on a 3-way merge as I use for git/mercurial
          --       It assumes a model of  LOCAL | BASE | OTHER   on top with the MERGED on the bottom
          --       It also assumes that   LOCAL | BASE | OTHER   are RO, and that only MERGED IS RW
          --
          -- .gitconfig settings
          --     [merge]
          --     tool = nvimdiff
          --     #conflictstyle = diff3
          -- .hgrc settings
          --     [merge-tools]
          --     vimdiff.executable = nvimdiff
          --     vimdiff.args = -f -d $output -M $local $base $other -c "wincmd J" -c "set modifiable" -c "set write"
          --     vimdiff.premerge = keep

          ["<leader>m"] = { name = " Merge/Diff (*)" },
          ["<leader>mr"] = { "<cmd>diffget REMOTE<cr>", desc = "Merge <REMOTE> diff" },
          ["<leader>ml"] = { "<cmd>diffget LOCAL<cr>", desc = "Merge <LOCAL> diff" },
          ["<leader>mb"] = { "<cmd>diffget BASE<cr>", desc = "Merge <BASE>  diff" },
          ["<leader>mp"] = { "<cmd>diffput<cr>", desc = "Merge <this> diff" },
          ["<leader>mc"] = { "<cmd>wincmd j<cr>wqa<cr>", desc = "Merge complete..." },
          ["<leader>mq"] = { "<cmd>cq!<cr>", desc = "Merge quit/abandon..." },

          -- AI Mappings
          ["<leader>a"] = { name = "󰧑 AI/ChatGPT (*)" },
          ["<leader>aa"] = { "<cmd>ChatGPT<CR>", desc = "ChatGPT" },
          ["<leader>ad"] = { "<cmd>ChatGPTRun docstring<CR>", desc = "GPT Docstring" },
          ["<leader>ae"] = { "<cmd>ChatGPTEditWithInstruction<CR>", desc = "GPT Edit with instruction" },
          ["<leader>af"] = { "<cmd>ChatGPTRun fix_bugs<CR>", desc = "GPT Fix Bugs" },
          ["<leader>ag"] = { "<cmd>ChatGPTRun grammar_correction<CR>", desc = "GPT Grammar Correction" },
          ["<leader>ak"] = { "<cmd>ChatGPTRun keywords<CR>", desc = "GPT Keywords" },
          ["<leader>al"] = {
            "<cmd>ChatGPTRun code_readability_analysis<CR>",
            desc = "GPT Code Readability Analysis",
          },
          ["<leader>ao"] = { "<cmd>ChatGPTRun optimize_code<CR>", desc = "GPT Optimize Code" },
          ["<leader>ar"] = { "<cmd>ChatGPTRun roxygen_edit<CR>", desc = "GPT Roxygen Edit" },
          ["<leader>as"] = { "<cmd>ChatGPTRun summarize<CR>", desc = "GPT Summarize" },
          ["<leader>at"] = { "<cmd>ChatGPTRun translate<CR>", desc = "GPT Translate" },
          ["<leader>ax"] = { "<cmd>ChatGPTRun explain_code<CR>", desc = "GPT Explain Code" },
          --
          --
          -- Git/Goto mappings
          ["g"] = { name = "Go..." },
          ["gf"] = { "<cmd>wincmd F<cr>", desc = "Go to file:line under cursor (*)" },

          -- Telescope Mappings
          ["<leader>fC"] = false,
          ["<leader>fp"] = {
            function() require("telescope").extensions.projects.projects {} end,
            desc = "Find project repos (*)",
          },
          ["<leader>fe"] = { function() require("telescope.builtin").commands() end, desc = "Find ex commands (*)" },

          ["<leader>fA"] = {
            function()
              local cwd = vim.fn.stdpath "data" .. "/astronvim-v4/"
              require("telescope.builtin").find_files {
                prompt_title = "Astrovnim-v4 Plugin Files",
                cwd = cwd,
                follow = true,
              } -- call telescope
            end,
            desc = "Find Astronvim-v4 Plugin Files (*)",
          },
          ["<leader>fa"] = {
            function()
              local cwd = vim.fn.stdpath "config"
              require("telescope.builtin").find_files {
                prompt_title = "Astrovim-v4 User Files",
                cwd = cwd,
                follow = true,
              } -- call telescope
            end,
            desc = "Find Astronvim-v4 User Config files (*)",
          },
          ["<leader>fl"] = {
            function()
              local cwd = vim.fn.stdpath "data" .. "/lazy/astronvim-v4/"
              require("telescope.builtin").find_files {
                prompt_title = "Astrovim-v4 Plugin Files",
                cwd = cwd,
                follow = true,
              } -- call telescope
            end,
            desc = "Find words in Astrovim-v4 plugin files (*)",
          },
          ["<leader>fL"] = {
            function()
              local cwd = vim.fn.stdpath "data" .. "/lazy/"
              -- local cwd = vim.fn.stdpath "data" .. "/lazy/"
              require("telescope.builtin").find_files {
                prompt_title = "Find words in Neovim Plugin Files",
                cwd = cwd,
                follow = false,
              } -- call telescope
            end,
            desc = "Find words in Neovim Lazy plugin files (*)",
          },

          -- quick switch windows (Im not so sure about this long term as it seems to conflict with other things)
          ["<leader><tab>"] = { "<cmd>tabnext<cr>", desc = "Go to next tab (*)" },

          -- Support my old surround muscle memory
          -- ["<leader>s"] = { "gzaiw", desc = "Surround <nextchar>", remap = true },

          -- Support mini-files & neotree
          -- Probably needs an overhaul...  Not sure I like this...
          -- ["<leader>E"] = { "<cmd>Neotree source=filesystem selector=false reveal_force_cwd<cr>", desc = "Neotree Explorer (*)", },

          --
          -- Faster access to common items
          -- ["<C-s>"] = { "<cmd>w!<cr>", desc = "Save File" },  -- Reserved for other items such as tmux etc
          ["<C-Space>"] = { "za", desc = "Toggle fold under cursor (*)" },
          ["<C-Enter>"] = { "", desc = "Step into topic (*)" },
          ["<C-BS>"] = { "", desc = "Step out of topic (*)" },
          ["<C-'"] = false,
        },

        --
        -- Command Window Maps
        --
        -- c = {},

        --
        -- Terminal Window Maps
        --
        --  JUST USE TMUX...
        t = {
          -- Reserved these for tmux, use <leader>jr for hydra resize
          ["<A-k>"] = { function() require("smart-splits").resize_up() end, desc = "Resize split up (*)" },
          ["<A-j>"] = { function() require("smart-splits").resize_down() end, desc = "Resize split down (*)" },
          ["<A-h>"] = { function() require("smart-splits").resize_left() end, desc = "Resize split left (*)" },
          ["<A-l>"] = { function() require("smart-splits").resize_right() end, desc = "Resize split right (*)" },
          -- ["<Esc><Esc>"] = { "<C-\\><C-n>", desc = "Exit TERM mode" },
          -- ["<C-Space>"] = { "<C-><C-n>", desc = "Exit TERM mode" },
          -- ["<A-,>"] = { "<Cmd>ToggleTerm direction=float<CR>", desc = "Toggle Term - Float (*)" },
          ["<C-,>"] = { "<Cmd>ToggleTerm direction=float<CR>", desc = "Toggle Term - Float (*)" },
        },
      },
    },
  },
}
