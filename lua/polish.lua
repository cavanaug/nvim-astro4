-- if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Set up custom filetypes
-- vim.filetype.add {
--   extension = {
--     foo = "fooscript",
--   },
--   filename = {
--     ["Foofile"] = "fooscript",
--   },
--   pattern = {
--     ["~/%.config/foo/.*"] = "fooscript",
--   },
-- }
--
-- Things I didnt know how to convert to Lua but I still want
vim.cmd [[
      autocmd BufNewFile,BufRead .envrc setfiletype sh
      autocmd BufNewFile,BufRead *.avsc setfiletype json
      autocmd BufNewFile,BufRead *.rss *.atom setfiletype xml
      autocmd BufNewFile,BufRead *.json setfiletype jsonc
      "autocmd bufwritepost tmux.conf execute ':!tmux source-file %'
      autocmd bufwritepost tmux.conf execute ':!tmux-refresh all'
]]
-- "autocmd BufNewFile,BufRead *.json set filetype=jsonc
-- "let g:mergetool_layout = 'mr'
-- ""let g:mergetool_prefer_revision = 'local'
