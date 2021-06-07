require'lspconfig'.terraformls.setup{
  cmd = { "terraform-ls", "serve" };
  filetypes =  { "terraform", "tf" };
}    

require'lspconfig'.pyright.setup{}

require'lspconfig'.denols.setup{}
