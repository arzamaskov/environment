local M = {}

function M.run(use)
  servers = {
    'tsserver',
    'bashls',
    'dockerls',
    'solargraph',
    'sqlls',
    'lua_ls',
    'stylelint_lsp',
    'vimls',
    'yamlls',
    'html',
    'cssls',
    'eslint',
    'jsonls',
  }

  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      'neovim/nvim-lspconfig',
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Autocompletion
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      -- 'onsails/lspkind.nvim',

      -- Snippets
      'L3MON4D3/LuaSnip',
      'rafamadriz/friendly-snippets',
    },
    config = function()
      local lsp = require('lsp-zero')
      lsp.preset('recommended')

      lsp.ensure_installed(servers)

      lsp.on_attach(function(client, bufnr)
        local noremap = {buffer = bufnr, remap = false}
        local bind = vim.keymap.set

        bind('n', '<space>rn', vim.lsp.buf.rename, noremap)
        bind('n', '<space>ca', vim.lsp.buf.code_action, noremap)
        -- bind('n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<cr>', noremap)
      end)


      lsp.setup()

      local cmp = require('cmp')
      -- local lspkind = require('lspkind')
      local cmp_select = {behavior = cmp.SelectBehavior.Select}
      local sources = lsp.defaults.cmp_sources()
      table.insert(sources, { name = 'nvim_lsp_signature_help' })

      local cmp_config = lsp.defaults.cmp_config({
        sources = sources,
        completion = {
          autocomplete = false,
          completeopt = 'menu,menuone,noinsert',
          comfirmkey = '<Tab>'
        },
        -- formatting = {
        --   format = lspkind.cmp_format({
        --     mode = 'symbol', -- show only symbol annotations
        --     maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
        --   })
        -- },
        mapping = {
          ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
          ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e'] = cmp.mapping.close(),
        },
      })

      cmp.setup(cmp_config)

    end
  }

end

return M
