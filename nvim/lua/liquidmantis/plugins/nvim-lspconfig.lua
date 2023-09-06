local lspconfig = require'lspconfig'
local util = require'lspconfig/util'
local configs = require'lspconfig/configs'
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

require('mason').setup()

lspconfig.html.setup {}
lspconfig.cssls.setup{}
lspconfig.asm_lsp.setup{}

-- Bash
require'lspconfig'.bashls.setup{}

-- Terraform
lspconfig.terraformls.setup{
  cmd = { "terraform-ls", "serve" };
  filetypes =  { "terraform", "tf" };
}

lspconfig.clangd.setup{}

-- Markdown
require'lspconfig'.marksman.setup{}

lspconfig.omnisharp.setup {
  on_attach = function(_, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  end,
  -- root_dir = util.root_pattern(".cs"),
  cmd = { "/usr/local/bin/mono", "/usr/local/bin/omnisharp-manual/omnisharp/OmniSharp.exe", "--languageserver" },
}

-- lspconfig.golangci_lint_ls.setup{}

lspconfig.gopls.setup {
  cmd = {"gopls", "serve"},
  filetypes = {"go", "gomod"},
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      completeUnimported = true,
      staticcheck = true,
      usePlaceholders = true,
    },
  },
}

lspconfig.gdscript.setup{capabilities = capabilities}

if not lspconfig.emmet_ls then
  configs.emmet_ls = {
    default_config = {
      cmd = {'emmet-ls', '--stdio'};
      filetypes = {'html', 'css', 'blade'};
      -- root_dir = function(fname)    
      --   return vim.loop.cwd()
      -- end;    
      settings = {};
    };
  }
end
lspconfig.emmet_ls.setup{ capabilities = capabilities; }

-- Python
lspconfig.pyright.setup{}

-- TypeScript
lspconfig.tsserver.setup{
  root_dir = require'lspconfig'.util.root_pattern("sketch.js", "index.html")
}

-- PowerShell
lspconfig.powershell_es.setup{
  bundle_path = '/usr/local/share/powershell_es';
  filetypes = { "powershell", "ps1" };
}

-- Lua
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require'lspconfig'.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
