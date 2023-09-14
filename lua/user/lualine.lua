local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

vim.api.nvim_set_hl(0, "SLGitIcon", { fg = "#d65d0e", bg = "#504945"})
vim.api.nvim_set_hl(0, "SLBranchName", { fg = "#fbf1c7", bg = "#504945", bold = false })
vim.api.nvim_set_hl(0, "SLProgress", { fg = "#fbf1c7", bg = "#665c54" })
vim.api.nvim_set_hl(0, "SLSeparator", { fg = "#d5c4a1", bg = "#3c3836" })
vim.api.nvim_set_hl(0, "SLLSP", { fg = "#fabd2f", bg = "#3c3836" })

local mode_color = {
  n = "#b8bb26",
  i = "#83a598",
  v = "#d65d0e",
  [""] = "#d3869b",
  V = "#b16286",
  c = "#83a598",
  o = "#61afef",
  s = "#d19a66",
  S = "#d19a66",
  [""] = "#d19a66",
  ic = "#e06c75",
  R = "#d79921",
  Rv = "#e06c75",
  cv = "#61afef",
  ce = "#61afef",
  r = "#e06c75",
  rm = "#56b6c2",
  ["r?"] = "#56b6c2",
  ["!"] = "#56b6c2",
  t = "#98c379",
}

local mode = {
  -- mode component
  function()
    return "  "
  end,
  color = function()
    -- auto change color according to neovims mode
    return { bg = mode_color[vim.fn.mode()] }
  end,
  -- padding = { right = 1 },
  padding = 0,
}

local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

local icons = require "user.icons"

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn" },
  symbols = { error = icons.diagnostics.Error .. " ", warn = icons.diagnostics.Warning .. " " },
  colored = false,
  update_in_insert = false,
  always_visible = true,
}

local diff = {
  "diff",
  colored = false,
  symbols = { added = icons.git.Add .. " ", modified = icons.git.Mod .. " ", removed = icons.git.Remove .. " " }, -- changes diff symbols
  cond = hide_in_width,
  separator = "%#SLSeparator#" .. "│ " .. "%*",
}

local filetype = {
  "filetype",
  icons_enabled = true,
  -- icon = nil,
}

local branch = {
  "branch",
  icons_enabled = true,
  icon = "%#SLGitIcon#" .. "" .. "%*" .. "%#SLBranchName#",
  -- color = "Constant",
  colored = false,
}

local progress = {
  "progress",
  color = "SLProgress",
}

--[[ local current_signature = function() ]]
--[[   if not pcall(require, "lsp_signature") then ]]
--[[     return ]]
--[[   end ]]
--[[   local sig = require("lsp_signature").status_line(30) ]]
--[[   return "%#SLSeparator#" .. sig.hint .. "%*" ]]
--[[ end ]]

local spaces = {
  function()
    return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
  end,
  padding = 0,
  separator = "%#SLSeparator#" .. " │" .. "%*",
}

local lanuage_server = {
  function()
    local clients = vim.lsp.buf_get_clients()
    local client_names = {}

    -- add client
    for _, client in pairs(clients) do
      if client.name ~= "copilot" and client.name ~= "null-ls" then
        table.insert(client_names, client.name)
      end
    end

    local buf_ft = vim.bo.filetype

    -- add formatter
    local s = require "null-ls.sources"
    local available_sources = s.get_available(buf_ft)
    local registered = {}
    for _, source in ipairs(available_sources) do
      for method in pairs(source.methods) do
        registered[method] = registered[method] or {}
        table.insert(registered[method], source.name)
      end
    end

    local formatter = registered["NULL_LS_FORMATTING"]
    local linter = registered["NULL_LS_DIAGNOSTICS"]
    if formatter ~= nil then
      vim.list_extend(client_names, formatter)
    end
    if linter ~= nil then
      vim.list_extend(client_names, linter)
    end

    -- join client names with commas
    local client_names_str = table.concat(client_names, ", ")
    -- 
    return "%#SLLSP#" .. "[" .. client_names_str .. "]" .. "%*"
  end,
  padding = 0,
  cond = hide_in_width,
  separator = "%#SLSeparator#" .. " │ " .. "%*",
}

local location = {
  "location",
  color = function()
    -- darkerplus
    -- return { fg = "#252525", bg = mode_color[vim.fn.mode()] }
    return { fg = "#1E232A", bg = mode_color[vim.fn.mode()] }
  end,
}

lualine.setup {
  options = {
    globalstatus = true,
    icons_enabled = true,
    theme = "gruvbox-material",
    -- theme = theme,
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "alpha", "dashboard" },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { mode, branch },
    lualine_b = { diagnostics },
    lualine_c = {'filename'},
    -- lualine_c = {},
    --[[ lualine_c = { { current_signature, cond = hide_in_width } }, ]]
    -- lualine_x = { diff, spaces, "encoding", filetype },
    lualine_x = { diff, lanuage_server, spaces, filetype },
    lualine_y = { progress },
    lualine_z = { location },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
}

