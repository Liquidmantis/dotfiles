-- Load all plugin configurations
local plugins = {}

-- List of all plugin files to load
local plugin_files = {
  'aerial',
  'blame', 
  'blink',
  'boole',
  'bqf',
  'catppuccin',
  'colorful-menu',
  'colorizer',
  'comment',
  'conform',
  'diffview',
  'dracula',
  'dressing',
  'fidget',
  'flash',
  'git-messenger',
  'gitsigns',
  'go',
  'grapple',
  'image',
  'indent',
  'jupytext',
  'lazydev',
  'lspsaga',
  'lualine',
  'luasnip',
  'mason',
  'maximizer',
  'molten',
  'movements',
  'murmur',
  'neoclip',
  'neotest',
  'noice',
  'nui',
  'nvim-dap',
  'nvim-lspconfig',
  'nvim-notify',
  'nvim-tree',
  'obsidian',
  'opencode',
  'openingh',
  'pico8',
  'quarto',
  'render-markdown',
  'snacks',
  'telescope',
  'todocomments',
  'treesitter',
  'undotree',
  'urlview',
  'vim-test',
  'vim-tmux-navigator',
  'yaml',
  'TODO-cleanup'
}

-- Load each plugin file
for _, file in ipairs(plugin_files) do
  local ok, plugin = pcall(require, 'liquidmantis.plugins.' .. file)
  if ok then
    table.insert(plugins, plugin)
  else
    vim.notify("Failed to load plugin: " .. file, vim.log.levels.ERROR)
  end
end

return plugins