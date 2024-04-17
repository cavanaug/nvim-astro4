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
      augroup user_filetype_settings
      autocmd!
      autocmd BufNewFile,BufRead .envrc setfiletype sh
      autocmd BufNewFile,BufRead *.avsc setfiletype json
      autocmd BufNewFile,BufRead *.rss *.atom setfiletype xml
      autocmd BufNewFile,BufRead *.json setfiletype jsonc
      autocmd BufWritePost tmux.conf execute ':!tmux source-file %'
      "autocmd bufwritepost tmux.conf execute ':!tmux-refresh all'
      "autocmd FileType help if winwidth("%")>4.5*winheight("%") | echo "wincmd L" | else | echo "wincmd K" | endif
      autocmd FileType help if winwidth("%")>4.5*winheight("%") | wincmd L | else | wincmd K | endif
      "autocmd FileType help if winnr('$') > 2 && winwidth("%")> 2.2*winheight("%")  | wincmd K | else | wincmd L | endif
      augroup END
]]
-- "autocmd BufNewFile,BufRead *.json set filetype=jsonc
-- "let g:mergetool_layout = 'mr'
-- ""let g:mergetool_prefer_revision = 'local'
