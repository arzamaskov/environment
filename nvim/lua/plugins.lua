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

    -- Switching between a single-line statement and a multi-line one
    use {
      'AndrewRadev/splitjoin.vim',
      config = function()
       vim.api.nvim_command 'let g:splitjoin_php_method_chain_full = 1'
      end
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

    -- Highlight trailing whitespaces and delete them by `:StripWhitespace`
    use { 'ntpeters/vim-better-whitespace' }

    -- Annotation generator
    use {
      'danymat/neogen',
      config = function()
        require('neogen').setup({
          enabled = true,
          patterns = {
            php = {
              {'class (%S)', ''},
              {'function (%S)', ''}
            }
          }
        })
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
    use {
      'junegunn/fzf',
      run = function() vim.fn["fzf#install"]() end,
    }

    use { 'junegunn/fzf.vim' }

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
    use {
      'vimwiki/vimwiki',
      config = function()
        vim.g.vimwiki_list = {
          {
            path = '~/.notes/',
            index = 'README',
            syntax = 'markdown',
            ext = '.md'
          }
        }
        vim.g.vimwiki_global_ext = 0
      end
    }

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
    -- enable Packer
    enable = true,

    -- configure the display options
    display = {
      open_fn = require('packer.util').float,
    }
  }
})
