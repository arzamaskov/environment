local keymap = vim.keymap.set
local options = { silent = true }

-- Disable search result highlighting
keymap('n', '<C-[>', ':nohlsearch<CR>', options)

-- Open / close file manager
keymap('n', '<leader><leader>', ':NvimTreeToggle<CR>', options)
-- Move the cursor it the tree for the curren buffer
keymap('n', '<C-n>', ':NvimTreeFindFile<CR>', options)

keymap("n", "<leader>mn", require("nvim-tree.api").marks.navigate.next, options)
keymap("n", "<leader>mp", require("nvim-tree.api").marks.navigate.prev, options)
keymap("n", "<leader>ms", require("nvim-tree.api").marks.navigate.select, options)

-- Better window movements
keymap('n', '<C-l>', '<C-w>l', options)
keymap('n', '<C-h>', '<C-w>h', options)
keymap('n', '<C-j>', '<C-w>j', options)
keymap('n', '<C-k>', '<C-w>k', options)

keymap('n', 'gV', '`[v`]', options)

keymap('n', 'k', 'gk', options)
keymap('n', 'j', 'gj', options)

-- for russian layout
keymap('n', 'л', 'gk', options)
keymap('n', 'о', 'gj', options)

-- Buffers
keymap('n', 'gn', ':bn<CR>', options)
keymap('n', 'gp', ':bp<CR>', options)

-- Don't yank on delete char
-- keymap('n', 'x', '"_x', options)
-- keymap('n', 'X', '"_X', options)
-- keymap('v', 'x', '"_x', options)
-- keymap('v', 'X', '"_X', options)

-- Don't yank on visual paste
keymap('v', 'p', '"_dP', options)

-- Refactor with spectre
keymap("n", "<Leader>pr", "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", options)
keymap("v", "<Leader>pr", "<cmd>lua require('spectre').open_visual()<CR>")

-- LSP
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", options)
keymap("n", "gr", "<cmd>lua vim.lsp.buf.references({ includeDeclaration = false })<CR>", options)
keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", options)
keymap("v", "<leader>ca", "<cmd>'<,'>lua vim.lsp.buf.range_code_action()<CR>", options)
keymap("n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<CR>", options)
keymap("n", "<leader>cf", "<cmd>lua vim.lsp.buf.formatting({ async = true })<CR>", options)
keymap("v", "<leader>cf", "<cmd>'<.'>lua vim.lsp.buf.range_formatting()<CR>", options)
keymap("n", "<leader>cl", "<cmd>lua vim.diagnostic.open_float({ border = 'rounded', max_width = 100 })<CR>", options)
keymap("n", "K", "<cmd>lua vim.lsp.buf.signature_help()<CR>", options)
keymap("n", "]g", "<cmd>lua vim.diagnostic.goto_next({ float = { border = 'rounded', max_width = 100 }})<CR>", options)
keymap("n", "[g", "<cmd>lua vim.diagnostic.goto_prev({ float = { border = 'rounded', max_width = 100 }})<CR>", options)

-- FZF Search
keymap('n', ';', ':Buffers<cr>', options)
keymap('n', '<leader>t', ':Files<cr>', options)
keymap('n', '<leader>f', ':Rg<space>', { silent = false })
keymap('n', '<leader>F', ':exec "Rg ".expand("<cword>")<cr>', options)

-- Close buffer
keymap('n', '<leader>q', ':Bdelete<cr>', options)

-- Git mappings
keymap('n', '<leader>g', ':Gitsigns<cr>', options)

-- VimWiki searcher
keymap('n', '<leader>nv', ':NV!<CR>', options)
keymap('n', '<leader>NV', ':NV!<CR>', options)

-- Display all the troubles in all buffers
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
  {silent = true, noremap = true}
)

-- Send selected content in Carbon
keymap('n', '<F9>', ':CarbonNowSh<CR>', options)
keymap('v', '<F9>', ':CarbonNowSh<CR>', options)

-- Format JSON
keymap('n', '<leader>jq', ':%!python -m json.tool<CR>', options)
keymap('v', '<leader>jq', '!python -m json.tool<CR>', options)

-- CtrlSF mappings
keymap('n', '<C-F>f', ':CtrlSF ', { silent = false })
keymap('n', '<C-F>t', ':CtrlSFToggle<cr>', options)
