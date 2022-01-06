local M = {}
M.config = function()
  lvim.builtin.lualine = {
    active = true,
    style = "lvim",
    options = {
      icons_enabled = true,
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
      theme = "gruvbox-material",
      disabled_filetypes = nil,
    },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
    tabline = nil,
    extensions = nil,
    on_config_done = nil,
  }
end

M.setup = function()
  require("lvim.core.lualine.styles").update()
  require("lvim.core.lualine.utils").validate_theme()

  local lualine = require "lualine"
  lualine.setup(lvim.builtin.lualine)

  if lvim.builtin.lualine.on_config_done then
    lvim.builtin.lualine.on_config_done(lualine)
  end
end

return M
