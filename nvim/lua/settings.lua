local options = {
  langmap	  = 'ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz',
  clipboard	  = "unnamed,unnamedplus",    -- Copy-pase between vim and everything else
  smartindent	  = true,                     -- Makes indenting smart
  cindent	  = true,		      -- Automatic program indenting
  writebackup	  = false,                    -- Not needed
  swapfile	  = false,                    -- Swap not needed
  expandtab	  = true,                     -- Use spaces instead tabs
  tabstop	  = 2,                        -- Insert 4 spaces for a tab
  softtabstop	  = 2,                        -- Insert 4 spaces for a tab
  shiftwidth	  = 2,                        -- Change a number of space characeters inseted for indentation
  number	  = true,                     -- Shows current line number
  termguicolors	  = true,                     -- Correct terminal colors
  cmdheight	  = 1,                        -- Give more space for displaying messages
  completeopt	  = "menu,menuone,noselect",  -- Better autocompletion
  cursorline	  = true,                     -- Highlight of current line
  ignorecase	  = true,                     -- Needed for smartcase
  lazyredraw	  = true,                     -- Makes macros faster & prevent errors in complicated mappings
  mouse		  = "",                       -- Disable mouse
  scrolloff	  = 4,                        -- Always keep space when scrolling to bottom/top edge
  signcolumn	  = "yes:1",                  -- Add extra sign column next to line number
  smartcase	  = true,                     -- Uses case in search
  smarttab	  = true,                     -- Makes tabbing smarter will realize you have 2 vs 4
  splitright	  = true,                     -- Vertical splits will automatically be to the right
  timeoutlen	  = 200,                      -- Faster completion (cannot be lower than 200 because then commenting doesn't work)
  undofile	  = true,                     -- Sets undo to file
  updatetime	  = 100,                      -- Faster completion
  viminfo	  = "'1000",                  -- Increase the size of file history
  wrap		  = true,                     -- Display long lines as just one line
  relativenumber  = true,		      -- Set relateve number
  linebreak	  = true,		      -- Break long lines by word, not char
  inccommand	  = "nosplit"
  -- foldmethod	= "indent",
  -- foldlevel	= 2
}

local globals = {
  mapleader     = ',',                      -- Map leader key to SPC
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

for k, v in pairs(globals) do
	vim.g[k] = v
end

vim.cmd([[
  set runtimepath^=~/.config/nvim/plugin/bbye/
]])
