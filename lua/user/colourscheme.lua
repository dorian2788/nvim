local colorscheme = "gruvbox-material"

vim.opt.background = "dark"

vim.g.gruvbox_material_background = 'hard'

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end
