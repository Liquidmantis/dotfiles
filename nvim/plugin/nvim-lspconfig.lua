require'lspconfig'.terraformls.setup{
  cmd = { "terraform-ls", "serve" };
  filetypes =  { "terraform", "tf" };
}    

local pid = vim.fn.getpid()

require'lspconfig'.omnisharp.setup {
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  on_attach = function(_, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  end,
  cmd = { "/usr/local/bin/mono", "/usr/local/bin/omnisharp-manual/omnisharp/OmniSharp.exe", "--languageserver" , "--hostPID", tostring(pid) },
}

require'lspconfig'.pyright.setup{}

-- require'lspconfig'.denols.setup{
require'lspconfig'.tsserver.setup{
  -- root_dir = root_pattern("sketch.js")
}

require'lspconfig'.powershell_es.setup{
  bundle_path = '/usr/local/share/powershell_es';
  filetypes = { "powershell", "ps1" };
}

require('nlua.lsp.nvim').setup(require('lspconfig'), {
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

