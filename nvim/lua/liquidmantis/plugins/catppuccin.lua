return {
  "catppuccin/nvim",
  name = "catppuccin",
  config = function()
    require('catppuccin').setup({
      transparent_background = true,
      integrations = {
        nvimtree = {
          transparent_panel = true,
        },
      },
    })
  end
}
