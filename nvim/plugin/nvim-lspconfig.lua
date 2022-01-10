local lspconfig = require'lspconfig'
local configs = require'lspconfig/configs'    
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

lspconfig.html.setup {}
lspconfig.cssls.setup{}

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

lspconfig.pyright.setup{}

lspconfig.tsserver.setup{
  root_dir = require'lspconfig'.util.root_pattern("sketch.js", "index.html")
}

lspconfig.powershell_es.setup{
  bundle_path = '/usr/local/share/powershell_es';
  filetypes = { "powershell", "ps1" };
}

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

