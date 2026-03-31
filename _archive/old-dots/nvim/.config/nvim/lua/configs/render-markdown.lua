return {
  checkbox = {
    enabled = true,
    render_modes = false,
    position = 'overlay',
    unchecked = {
      icon = '󰄱 ',
      highlight = 'RenderMarkdownUnchecked',
      scope_highlight = nil,
    },
    checked = {
      icon = '󰱒 ',
      highlight = 'RenderMarkdownChecked',
      scope_highlight = nil,
    },
    custom = {
      todo = { raw = '[-]', rendered = ' ', highlight = 'RenderMarkdownTodo', scope_highlight = nil },
      doing = { raw = '[/]', rendered = '󰥔 ', highlight = 'RenderMarkdownInProg', scope_highlight = nil },
    },
  },
}
