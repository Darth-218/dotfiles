local colors = {
  lightred = '#d9a594',
  blue     = '#8993a7',
  pink     = '#C586C0',
  black    = '#080808',
  white    = '#D4D4D4',
  green    = '#608B4E',
  orange   = '#FF9E3B',
  red      = '#e46876'
}

return {
  normal = {
    b = { fg = colors.lightred, bg = colors.black },
    a = { fg = colors.black, bg = colors.red, gui = 'bold' },
    c = { fg = colors.white, bg = colors.black },
    y = { bg = colors.blue, fg = colors.black, gui = 'bold'},
    z = { fg = colors.black, bg = colors.orange, gui = 'bold' },
  },
  visual = {
    b = { fg = colors.lightred, bg = colors.black },
    a = { fg = colors.black, bg = colors.red, gui = 'bold' },
    y = { bg = colors.blue, fg = colors.black, gui = 'bold'},
    z = { fg = colors.black, bg = colors.orange, gui = 'bold' },
  },
  inactive = {
    b = { fg = colors.lightred, bg = colors.black },
    a = { fg = colors.white, bg = colors.gray, gui = 'bold' },
    y = { bg = colors.blue, fg = colors.black, gui = 'bold'},
    z = { fg = colors.black, bg = colors.orange, gui = 'bold' },
  },
  replace = {
    b = { fg = colors.lightred, bg = colors.black },
    a = { fg = colors.black, bg = colors.red, gui = 'bold' },
    c = { fg = colors.white, bg = colors.black },
    y = { bg = colors.blue, fg = colors.black, gui = 'bold'},
    z = { fg = colors.black, bg = colors.orange, gui = 'bold' },
  },
  insert = {
    b = { fg = colors.lightred, bg = colors.black },
    a = { fg = colors.black, bg = colors.red, gui = 'bold' },
    c = { fg = colors.white, bg = colors.black },
    y = { bg = colors.blue, fg = colors.black, gui = 'bold'},
    z = { fg = colors.black, bg = colors.orange, gui = 'bold' },
  },
}
