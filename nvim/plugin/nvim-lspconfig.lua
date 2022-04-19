local lspconfig = require'lspconfig'
local util = require'lspconfig/util'
local configs = require'lspconfig/configs'    
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

lspconfig.html.setup {}
lspconfig.cssls.setup{}

-- Terraform
lspconfig.terraformls.setup{
  cmd = { "terraform-ls", "serve" };
  filetypes =  { "terraform", "tf" };
}    

local pid = vim.fn.getpid()

lspconfig.omnisharp.setup {
  on_attach = function(_, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  end,
  cmd = { "/usr/local/bin/mono", "/usr/local/bin/omnisharp-manual/omnisharp/OmniSharp.exe", "--languageserver" , "--hostPID", tostring(pid) },
}

lspconfig.gopls.setup {
  cmd = {"gopls", "serve"},
  filetypes = {"go", "gomod"},
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
}

lspconfig.html.setup {
}

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
require('nlua.lsp.nvim').setup(require('lspconfig'), {
  capabilities = capabilities,
  bin_location = "/opt/homebrew/bin/lua-language-server",
  globals = {
    "hs",
    "use"
  },
  commands = {
    Format = {
      function()
        require("stylua-nvim").format_file()
      end,
    },
  },
})

