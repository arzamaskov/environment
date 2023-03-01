-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost",
  { callback = function() vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 200 }) end })

-- Enable spell checking for certain file types
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { pattern = { "*.txt", "*.md" },
  command = "setlocal spell spelllang=en_us,ru" })

vim.cmd ([[
  augroup myfiletypes
    " Clear old autocmds in group
    autocmd!
    autocmd FileType ruby,eruby,yaml,javascript,typescript set ai sw=2 sts=2 et
    autocmd FileType java,php,smarty set ai sw=4 sts=4 et
    autocmd BufRead,BufNewFile .env set syntax=sh
    autocmd BufRead,BufNewFile .rgignore set syntax=gitignore
  augroup END

  augroup goyo
    autocmd! User GoyoEnter Limelight
    autocmd! User GoyoLeave Limelight!
  augroup END

  augroup search
    autocmd VimEnter * command! -nargs=* Rg
        \ call fzf#vim#grep(
        \   'rg --column --line-number --no-heading --fixed-strings --ignore-file ~/.rgignore
        \ --ignore-case --no-ignore --hidden --follow --color "always" '.shellescape(<q-args>), 1,
        \   <bang>0 ? fzf#vim#with_preview('up:60%')
        \           : fzf#vim#with_preview('right:50%:hidden', '?'),
        \   <bang>0)
  augroup END
]])
