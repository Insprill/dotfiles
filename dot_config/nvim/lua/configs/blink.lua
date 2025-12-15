return {
  completion = {
    keyword = {
      range = "full",
    },
    list = {
      selection = {
        preselect = false,
      },
    },
    menu = {
      scrollbar = true,
      draw = {
        -- We don't need label_description now because label and label_description are already
        -- combined together in label by colorful-menu.nvim.
        columns = { { "kind_icon" }, { "label", gap = 1 } },
        components = {
          -- https://github.com/xzbdmw/colorful-menu.nvim#use-it-in-blinkcmp
          label = {
            text = function(ctx)
              return require("colorful-menu").blink_components_text(ctx)
            end,
            highlight = function(ctx)
              return require("colorful-menu").blink_components_highlight(ctx)
            end,
          },
        },
      },
    },
  },
}
