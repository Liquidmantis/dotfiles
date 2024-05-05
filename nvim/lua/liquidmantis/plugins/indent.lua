return {
  'lukas-reineke/indent-blankline.nvim',

  config = function()
    -- vim.opt.listchars = {

    --     space = "⋅",
    --     eol = "↴",
    -- }

    require("ibl").setup(
      -- config = {
      --   indent = {
      --     space = "⋅",
      --   },
      -- }
    )
  end
}
