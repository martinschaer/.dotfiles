require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'onedark',
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { { 'filename', path = 1 } },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  tabline = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'buffers' },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
}
