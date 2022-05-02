require('lualine').setup{
  options = {
    icons_enabled = true,
    theme = 'onedark',
  },
  tabline = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'buffers'},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
}
