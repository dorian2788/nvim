vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

require "user.options"
require "user.keymaps"
require "user.mason"
require "user.plugins"
require "user.colourscheme"
require "user.cmp"
require "user.lsp"
require "user.telescope"
require "user.treesitter"
require "user.autopairs"
require "user.comment"
require "user.nvim-tree"
require "user.dap"
require "user.lualine"
require "user.indent-blankline"
