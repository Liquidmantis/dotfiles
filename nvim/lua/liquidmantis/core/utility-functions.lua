local M = {}

-- Refresh the tag-tree MOC block in the current note.
-- Prompts for the root tag (defaults to the note's own filename, lowercased).
M.update_moc = function()
  local file = vim.fn.expand("%:p")
  local default = vim.fn.expand("%:t:r"):lower()
  local tag = vim.fn.input("MOC root tag: ", default)
  if tag == "" then return end
  local vault = vim.fn.finddir(".obsidian", ".;")
  vault = vault ~= "" and vim.fn.fnamemodify(vault, ":h") or vim.fn.getcwd()
  local out = vim.fn.system({
    "python3", vault .. "/meta/moc.py", tag, file, vault,
  })
  vim.cmd("checktime") -- reload the buffer from disk
  vim.notify(vim.trim(out))
end

-- Toggle inline LaTeX/math rendering from snacks.nvim image.
-- Flips `math.enabled` (checked by the update loop at snacks/image/doc.lua),
-- clears current placements, then nudges a redraw. This survives edits, unlike
-- tearing down the augroup (snacks re-renders via an nvim_buf_attach on_lines
-- hook that isn't tied to that augroup).
-- NOTE: `math.enabled` is global, so this toggles for all buffers.
M.toggle_latex = function()
  local buf = vim.api.nvim_get_current_buf()
  local math = Snacks.image.config.math
  math.enabled = not math.enabled
  if not math.enabled then
    Snacks.image.placement.clean(buf)
  end
  vim.api.nvim_exec_autocmds("BufWinEnter", { buffer = buf })
  vim.notify("LaTeX rendering " .. (math.enabled and "on" or "off"))
end

return M
