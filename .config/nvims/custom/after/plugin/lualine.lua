local theme = require'lualine.themes.ayu_mirage'
theme.normal.b.bg = '#2a1d38'
theme.normal.c.bg = '#170f1f'
theme.normal.c.fg = '#dedede'

theme.inactive.b.bg = '#2a1d38'
theme.inactive.c.bg = '#170f1f'
theme.inactive.c.fg = '#dedede'

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = theme,
    -- component_separators = { left = '', right = ''},
    -- section_separators = { left = '', right = ''},
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {
      {
        'filetype',
        colored = true,   -- Displays filetype icon in color if set to true
        icon_only = true, -- Display only an icon for filetype
        icon = { align = 'right' }, -- Display filetype icon on the right hand side
      },
      'filename',
    },
    lualine_x = {},
    lualine_y = {'searchcount'},
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
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {'trouble'}
}
