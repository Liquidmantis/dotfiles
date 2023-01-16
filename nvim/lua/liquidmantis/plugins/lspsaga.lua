local lspsaga_installed, lspsaga = pcall(require, 'lspsaga')
if not lspsaga_installed then
  vim.notify('lspsaga not installed', 'error')
  return
end

lspsaga.setup({})
