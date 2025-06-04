return {
  "benlubas/molten-nvim",
  version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
  -- commit = "7f780809c56ecd1bc2327c09d50eb38b0425f7dd",
  build = ":UpdateRemotePlugins",
  init = function()
    -- this is an example, not a default. Please see the readme for more configuration options
    vim.g.molten_output_win_max_height = 12

    -- Output as virtual text. Allows outputs to always be shown, works with images, but can
    -- be buggy with longer images
    vim.g.molten_virt_text_output = true

    -- this will make it so the output shows up below the \`\`\` cell delimiter
    vim.g.molten_virt_lines_off_by_1 = true
    vim.g.molten_image_provider = "image.nvim"
    vim.g.molten_image_location = "float"

    vim.g.python3_host_prog = vim.fn.expand("~/.virtualenvs/neovim/bin/python")
  end,
}
