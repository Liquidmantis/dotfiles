local murmur_installed, murmur = pcall( require, 'murmur' )
if not murmur_installed then  
  vim.notify( 'murmur not installed', 'error' )
  return
end

murmur.setup({
  max_len = 80,
})
