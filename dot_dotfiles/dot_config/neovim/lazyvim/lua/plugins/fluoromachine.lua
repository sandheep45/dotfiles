return {
  {
    "maxmx03/fluoromachine.nvim",
    priority = 1000,
    config = function()
      local fm = require("fluoromachine")

      fm.setup({
        glow = true,
        theme = "fluoromachine",
        brightness = 0.01,
        styles = {
          keywords = {
            italic = true,
          },
        },
        transparent = true,
      })

      vim.cmd.colorscheme("fluoromachine")
    end,
  },
}
