return {
  'nyngwang/murmur.lua',              -- cursor word highlighting

  config = function()
    require('murmur').setup({
      max_len = 80,
    })
  end
}
