return {
  "3rd/image.nvim",
  build = false, -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
  opts = {
    processor = "magick_cli",
    max_height_window_percentage = math.huge,
    max_width_window_percentage = math.huge
  },
}
