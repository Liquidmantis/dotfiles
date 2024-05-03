local harpoon_installed, harpoon = pcall(require, 'harpoon')
if not harpoon_installed then
  vim.notify('harpoon not installed', 'error')
  return
end

harpoon:setup()

local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end

vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
    { desc = "Open harpoon window" })

-- local group = vim.api.nvim_create_augroup("Harpoon Augroup", { clear = true })
-- vim.api.nvim_create_autocmd("FileType", {
--     pattern = "harpoon",
--     group = group,
--     callback = function()
--         vim.keymap.set("n", "<C-V>", function()
--             local curline = vim.api.nvim_get_current_line()
--             local working_directory = vim.fn.getcwd() .. "/"
--             vim.cmd("vs")
--             vim.cmd("e " .. working_directory .. curline)
--         end, { noremap = true, silent = true })
--     end,
-- })
