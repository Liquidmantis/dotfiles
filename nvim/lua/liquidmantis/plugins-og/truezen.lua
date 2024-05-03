local truezen_installed, truezen = pcall(require, 'true-zen')
if not truezen_installed then
  vim.notify('truezen not installed', 'error')
  return
end

truezen.setup({
  integrations = {
    tmux = true
  }
})
