local cmp = require'cmp'
local luasnip = require'luasnip'
local lspkind = require'lspkind'


cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
    
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = function(fallback)
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end,
  }),

  formatting = {
    format = lspkind.cmp_format({
      with_text = true,
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      
      -- The function below will be called before any actual modifications from lspkind
      -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
      before = function (entry, vim_item)
        return vim_item
      end
    })
  },

  sources = cmp.config.sources({
    { name = 'luasnip' },
    { name = 'nvim_lua' },
    { name = 'nvim_lsp' },
  }, {
    { name = 'path' },
    { name = 'buffer' },
  }),

  experimental = {
    ghost_text = true,
    native_menu = false,
  }
})

-- Setup lspconfig.
-- require('lspconfig')[%YOUR_LSP_SERVER%].setup {
  -- capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.mke_client_capabilities())
-- }
