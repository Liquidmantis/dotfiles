require'lspconfig'.terraformls.setup{
  cmd = { "terraform-ls", "serve" };
  filetypes =  { "terraform", "tf" };
}    
--     root_dir = root_pattern(".terraform", ".git")


require'lspconfig'.pyright.setup{}

--   Commands:
--   - PyrightOrganizeImports: Organize Imports
  
--   Default Values:
--     cmd = { "pyright-langserver", "--stdio" }
--     filetypes = { "python" }
--     root_dir = function(filename)
--           return util.root_pattern(unpack(root_files))(filename) or
--                  util.path.dirname(filename)
--         end;
--     settings = {
--       python = {
--         analysis = {
--           autoSearchPaths = true,
--           diagnosticMode = "workspace",
--           useLibraryCodeForTypes = true
--         }
--       }
--     }
     
