-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost",
  { callback = function() vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 200 }) end })

-- Enable spell checking for certain file types
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { pattern = { "*.txt", "*.md" },
  command = "setlocal spell spelllang=en_us,ru" })

vim.cmd [[
  augroup myfiletypes
    " Clear old autocmds in group
    " autocmd!
    autocmd FileType ruby,eruby,yaml,javascript,typescript set ai sw=2 sts=2 et
    autocmd FileType java,php,smarty set ai sw=4 sts=4 et
  augroup END
]]

vim.cmd([[
  autocmd! User GoyoEnter Limelight
  autocmd! User GoyoLeave Limelight!
]])

vim.cmd([[
  " au BufRead,BufNewFile *.html set syntax=liquid
  autocmd TermOpen * setlocal statusline=%{b:term_title}
  au BufRead,BufNewFile .env set syntax=sh
]])
