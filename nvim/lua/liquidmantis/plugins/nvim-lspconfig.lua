return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'williamboman/mason.nvim',
  },

  config = function()
    local lsp = vim.lsp
    local util = require 'lspconfig/util'
    local configs = require 'lspconfig/configs'
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
    lsp.enable('lua_ls')

    lsp.config('pico8_ls', {
      filetypes = { "p8", 'pico8', 'lua' },
    })
    lsp.enable('pico8_ls')

    lsp.enable('pyright')

    -- TypeScript
    -- lspconfig.ts_ls.setup {
    --   root_dir = require 'lspconfig'.util.root_pattern("sketch.js", "index.html")
    -- }

    -- Lua
    -- local runtime_path = vim.split(package.path, ';')
    -- table.insert(runtime_path, "lua/?.lua")
    -- table.insert(runtime_path, "lua/?/init.lua")

    -- lspconfig.lua_ls.setup {
    --   settings = {
    --     Lua = {
    --       runtime = {
    --         -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
    --         version = 'LuaJIT',
    --         -- Setup your lua path
    --         path = runtime_path,
    --       },
    --       diagnostics = {
    --         globals = { 'vim', 'hs' },
    --       },
    --       workspace = {
    --         -- Make the server aware of Neovim runtime files
    --         library = {
    --           -- vim.api.nvim_get_runtime_file("", true),
    --           vim.env.VIMRUNTIME,
    --           "${3rd}/luv/library",
    --           vim.fn.expand("$VIMRUNTIME/lua"),
    --           "~/.hammerspoon/Spoons/EmmyLua.spoon/annotations"
    --         },
    --         checkThirdParty = false,
    --       },
    --       -- Do not send telemetry data containing a randomized but unique identifier
    --       telemetry = {
    --         enable = false,
    --       },
    --     },
    --   },
    -- }

    lsp.config('yamlls', {
      filetypes = { "yaml", "yml" },
    })
    lsp.enable('yamlls')
  end
}
