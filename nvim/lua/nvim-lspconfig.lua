require'lspconfig'.terraformls.setup{
  cmd = { "terraform-ls", "serve" };
  filetypes =  { "terraform", "tf" };
}    

require'lspconfig'.pyright.setup{}

require'lspconfig'.denols.setup{}

require'lspconfig'.powershell_es.setup{
  bundle_path = '/usr/local/share/powershell_es',
}
