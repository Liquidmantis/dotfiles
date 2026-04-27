local function save() vim.cmd.write() end
local function copy() vim.cmd([[normal! "+y]]) end
local function paste() vim.api.nvim_paste(vim.fn.getreg("+"), true, -1) end

vim.keymap.set({ "n", "i", "v" }, "<D-s>", save, { desc = "Save" })
vim.keymap.set("v", "<D-c>", copy, { silent = true, desc = "Copy" })
vim.keymap.set({ "n", "i", "v", "c", "t" }, "<D-v>", paste, { silent = true, desc = "Paste" })

vim.g.neovide_input_macos_option_key_is_meta = 'only_left'
