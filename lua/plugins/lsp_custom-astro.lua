-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE return {
return {
  {
    "elijah-potter/harper",
    -- enabled = false,
  },
  {
    "AstroNvim/astrolsp",
    optional = true,
    ---@type AstroLSPOpts
    opts = {
      features = {
        signature_help = true, -- enable automatic signature help popup globally on startup
        inlay_hints = true, -- enable inlay hints globally on startup
      },
      config = {
        harper_ls = {
          settings = {
            -- enabled = false,
            ["harper-ls"] = {
              codeActions = {
                forceStable = true,
              },
              linters = {
                spell_check = false,
                spelled_numbers = false,
                sentence_capitalization = false,
                linking_verbs = true,
              },
            },
          },
        },
        ltex = {
          enabled = false,
          settings = {
            language = "en-US",
            disabledRules = { ["en"] = { "SPELL_CHECKING" } },
            ["ltex"] = {
              language = "en-US",
              disabledRules = { ["en"] = { "SPELL_CHECKING" } },
            },
          },
        },
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        -- "tsserver", --
        -- "harper-ls", --
      }, -- automatically install lsp
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "harper-ls" })
    end,
  },
}
