return require('packer').startup({

  function(use)
    -- Packer itself
    use { 'wbthomason/packer.nvim' }

    -- Speeding up
    use { 'lewis6991/impatient.nvim' }
    use { 'nathom/filetype.nvim' }
    use { 'nvim-lua/plenary.nvim' }

    -- Desingn
    use { 'kyazdani42/nvim-web-devicons' }

    -- Universal set of defaults
    use { 'tpope/vim-sensible' }

    -- File manager
    use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons'
      },
      config = function()
        require('nvim-tree').setup {
          view = {
            width = 45
          }
        }
      end
    }

    -- Colorscheme
    use {
      "catppuccin/nvim",
      as = "catppuccin",
      config = function()
        require("catppuccin").setup({
         flavour = "mocha",
         -- flavour = "latte",
         background = {
           light = "latte",
           dark = "mocha"
         },
         styles = {
           comments = { "italic" },
           conditionals = { "italic" },
         },
         color_overrides = {
           mocha = {
             base = "#002b36",
           },
         },
         integrations = {
           cmp = true,
           gitsigns = true,
           nvimtree = true,
           lsp_trouble = true,
           markdown = true,
           mason = true,
           native_lsp = {
             enabled = true,
             virtual_text = {
               errors = { "italic" },
               hints = { "italic" },
               warnings = { "italic" },
               information = { "italic" },
             },
             underlines = {
               errors = { "undercurl" },
               hints = { "undercurl" },
               warnings = { "undercurl" },
               information = { "undercurl" },
             },
           }
         }
       })
       vim.api.nvim_command 'colorscheme catppuccin'
     end
   }

   use {
      "ellisonleao/gruvbox.nvim",
      config = function ()
        require("gruvbox").setup({
          undercurl = true,
          italic = true,
          contrast = "hard"
        })
        -- vim.cmd("colorscheme gruvbox")
      end
    }

    use {
      'wuelnerdotexe/vim-enfocado'
    }

    use { 'marko-cerovac/material.nvim' }

    -- Switching between a single-line statement and a multi-line one
    use {
      'AndrewRadev/splitjoin.vim',
      config = function()
       vim.api.nvim_command 'let g:splitjoin_php_method_chain_full = 1'
      end
    }

    -- DAP (Debug Adapter Protocol)
    use {
      'mfussenegger/nvim-dap',
      config = function()
        require("dapui").setup()
      end
    }

    -- This plugin adds virtual text support to nvim-dap. nvim-treesitter is used to find variable definitions
    use {
      'theHamsta/nvim-dap-virtual-text',
      config = function()
        require("nvim-dap-virtual-text").setup()
      end
    }

    -- UI for nvim-dap
    use {
      'rcarriga/nvim-dap-ui',
      requires = {
        'mfussenegger/nvim-dap'
      }
    }

    -- Improve user iput interface
    use {
      'stevearc/dressing.nvim',
      config = function ()
        local dressing = require('dressing')
        dressing.setup({
          input = {
            get_config = function ()
              if vim.api.nvim_buf_get_option(0, "filetype") == "NvimTree" then
                return { enabled = false }
              end
            end
          },
        })
      end
    }

    -- Improve repeat using `.`
    use { 'tpope/vim-repeat' }

    -- While Yanking your cursor will not move to the start of the Yanked Text
    use { 'svban/YankAssassin.vim' }

    -- Show a lightbulb in the sign column whenever actions is available
    use {
      'kosayoda/nvim-lightbulb',
      requires = {
        'antoinemadec/FixCursorHold.nvim'
      },
      config = function()
        local lightbulb = require('nvim-lightbulb')
        lightbulb.setup({autocmd = {enabled = true}})
      end
    }

    -- SchemaStore catalog
    use { 'b0o/schemastore.nvim' }

    -- Status line
    -- use {
    --   'feline-nvim/feline.nvim',
    --   after = "nvim-web-devicons",
    --   config = function()
    --     -- local ctp_feline = require('catppuccin.groups.integrations.feline')
    --     require('feline').setup({
    --       -- preset = 'noicon',
    --       -- components = ctp_feline.get()
    --     })
    --     require('feline').use_theme('default')
    --   end
    -- }
    -- use {
    --   'nvim-lualine/lualine.nvim',
    --   requires = {
    --     'kyazdani42/nvim-web-devicons',
    --     opt = true
    --   },
    --   config = function()
    --     require('lualine').setup {
    --       options = {
    --         -- theme = 'enfocado',
    --         -- theme = 'onelight',
    --         disabled_filetypes = {
    --           'packer', 'NvimTree'
    --         }
    --       }
    --     }
    --   end
    -- }

    -- Highlight trailing whitespaces and delete them by `:StripWhitespace`
    use { 'ntpeters/vim-better-whitespace' }

    -- Annotation generator
    use {
      'danymat/neogen',
      config = function()
        require('neogen').setup {}
      end,
      requires = {
        'nvim-treesitter/nvim-treesitter'
      },
    }

    -- Autopairs
    use {
      'windwp/nvim-autopairs',
      requires = {
        'hrsh7th/nvim-cmp',
        'nvim-treesitter/nvim-treesitter',
      },
      config = function()
        local npairs = require('nvim-autopairs')
        npairs.setup({
          -- check_ts = true
        })
        -- npairs.add_rules(require('nvim-autopairs.rules.endwise-ruby'))
        -- npairs.add_rules(require('nvim-autopairs.rules.endwise-elixir'))
        -- npairs.add_rules(require('nvim-autopairs.rules.endwise-lua'))
      end
    }

    -- Automatically adjusts 'shiftwidth' and 'expandtab
    use { 'tpope/vim-sleuth' }

    -- Indentation guides
    use {
      'lukas-reineke/indent-blankline.nvim',
      config = function()
        require('indent_blankline').setup {
          char = '┊',
          show_trailing_blankline_indent = false,
        }
      end
    }

    -- Surroundings parentheses, brackets, quotes, XML tags, and more
    use { 'tpope/vim-surround' }

    -- Improve mappings
    use { 'tpope/vim-unimpaired' }

    use { 'tpope/vim-liquid' }

    -- Search??
    use { 'windwp/nvim-spectre' }

    -- Text searcher
    use { 'dyng/ctrlsf.vim' }

    -- Comments
    use {
      'numToStr/Comment.nvim',
      config = function ()
        local ts_comment_integration = require('ts_context_commentstring.integrations.comment_nvim')
        require('Comment').setup({
          pre_hook = ts_comment_integration.create_pre_hook(),
        })
      end
    }

    -- Refactor plugin
    use {
      'ThePrimeagen/refactoring.nvim',
      requires = {
        {'nvim-lua/plenary.nvim'},
        {'nvim-treesitter/nvim-treesitter'}
      }
    }

    -- LSP daignostics, references, implementations, definition and etc.
    use {
      'folke/trouble.nvim',
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("trouble").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      end
    }

    -- Fzf search
    use({
      'junegunn/fzf',
      run = function() vim.fn["fzf#install"]() end,
    })
    use 'junegunn/fzf.vim'

    vim.cmd([[
      autocmd VimEnter * command! -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --glob "!var/cache/*" --color  "always" '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)
    ]])

    -- Git decorations
    use {
      'lewis6991/gitsigns.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
      config = function()
        require('gitsigns').setup()
      end
    }

    -- Displays a popup with possible key bindings
    use {
      'folke/which-key.nvim',
      config = function()
        require("which-key").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      end
    }

    -- Smarty syntax
    use { 'blueyed/smarty.vim' }

    -- Slim-rails syntax
    use { 'slim-template/vim-slim' }

    -- VimWiki
    use {'vimwiki/vimwiki' }
    vim.cmd([[
      let g:vimwiki_list = [{'path': '~/.notes/',
      \ 'index': 'README',
      \ 'syntax': 'markdown', 'ext': '.md'}]
      let g:vimwiki_global_ext = 0
    ]])

    -- VimWiki Github sync
    -- use { 'michal-h21/vimwiki-sync' }
    -- vim.cmd([[
    --   let g:vimwiki_sync_branch = "main"
    -- ]])

    use { 'alok/notational-fzf-vim' }
    vim.cmd([[
      let g:nv_search_paths = ['~/Documents/Knowledge/']
      let g:nv_create_note_key = 'ctrl-x'
      let g:nv_default_extension = '.md'
    ]])

    -- Easy motion plugin
    use {
      'phaazon/hop.nvim',
      branch = 'v2', -- optional but strongly recommended
      config = function()
        -- you can configure Hop the way you like here; see :h hop-config
        require'hop'.setup()
      end
    }

    -- Start page
    use {
      'goolord/alpha-nvim',
      config = function()
        require 'alpha'.setup(require 'alpha.themes.startify'.config)
      end
    }

    -- use {
    --   'epwalsh/obsidian.nvim',
    --   config = function ()
    --     require('obsidian').setup({
    --       dir = "~/Documents/Knowledge",
    --       completion = {
    --         nvim_cmp = true,
    --       }
    --     })
    --   end
    -- }

    -- Focused mode in Vim
    use { 'junegunn/goyo.vim' }
    use { 'junegunn/limelight.vim' }

    -- Send selected content in Carbon
    use { 'kristijanhusak/vim-carbon-now-sh' }

    -- Add CSV support
    use { 'mechatroner/rainbow_csv' }

    -- Code statistics
    use 'wakatime/vim-wakatime'

    -- Formatters & linters

    require('plugins.treesitter').run(use)
    require('plugins.lsp').run(use)

  end,

  config = {
    enable = true,
    display = {
      open_fn = require('packer.util').float,
    }
  }
})
