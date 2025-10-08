return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'williamboman/mason.nvim',
  },

  config = function()
    local lsp = vim.lsp
    -- local capabilities = vim.lsp.protocol.make_client_capabilities()
    -- capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

    require('mason').setup()

    lsp.enable('docker_compose_language_service')
    lsp.enable('dockerls')
    lsp.enable('html')

    -- Bash
    lsp.config('bashls', {
      filetypes = { "sh", "zsh" },
      root_markers = { ".bashrc", ".zshrc" }
    })
    lsp.enable('bashls')

    -- Terraform
    lsp.config('terraformls', {
      cmd = { "terraform-ls", "serve" },
      filetypes = { "terraform", "tf", "terraform-vars" },
    })
    lsp.enable('terraformls')

    lsp.enable('marksman')
    lsp.enable('gopls')
    lsp.enable('gdscript')

    lsp.config('pico8_ls', {
      filetypes = { "p8", 'pico8', 'lua' },
    })
    lsp.enable('pico8_ls')

    lsp.enable('pyright')

    -- TypeScript
    -- lspconfig.ts_ls.setup {
    --   root_dir = require 'lspconfig'.util.root_pattern("sketch.js", "index.html")
    -- }

    lsp.config('lua_ls', {
      on_init = function(client)
        if client.workspace_folders then
          local path = client.workspace_folders[1].name
          if
              path ~= vim.fn.stdpath('config')
              and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
          then
            return
          end
        end

        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
          runtime = {
            version = 'LuaJIT',
            -- Tell the language server how to find Lua modules same way as Neovim
            -- (see `:h lua-module-load`)
            path = {
              'lua/?.lua',
              'lua/?/init.lua',
            },
          },
          -- Make the server aware of Neovim runtime files
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME,
              "${3rd}/luv/library",
              --           vim.fn.expand("$VIMRUNTIME/lua"),
              "~/.hammerspoon/Spoons/EmmyLua.spoon/annotations"
            }
          }
        })
      end,
      settings = {
        Lua = {}
      }
    })
    lsp.enable('lua_ls')

    lsp.config('yamlls', {
      filetypes = { "yaml", "yml" },
    })
    lsp.enable('yamlls')
  end
}
