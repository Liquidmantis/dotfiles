return {
  'nvimdev/lspsaga.nvim',

  config = function()
    require('lspsaga').setup({
      diagnostic = {
        keys = {
          quit = {'q', '<ESC>'}
        }
      },
    })
  end
}
