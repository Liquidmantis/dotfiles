return {
  'stevearc/dressing.nvim',
  config = function()
    require('dressing').setup({
      input = {
        get_config = function(opts)
          return opts
        end
      },
    })
  end
}
