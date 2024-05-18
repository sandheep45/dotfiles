return {
  "maxmx03/fluoromachine.nvim",
  config = function()
    local fm = require("fluoromachine")
    local themeArray = { "fluoromachine", "retrowave", "delta" }
    local randomIndex = math.random(1, #themeArray)
    local randomTheme = themeArray[randomIndex]

    fm.setup({
      glow = true,
      theme = randomTheme,
      brightness = "0.9",
      overrides = {
        ["@keyword"] = { italic = true },
        ["@conditional"] = { italic = true },
        ["@include"] = { italic = true },
        ["@exception"] = { italic = true },
        ["@define"] = { italic = true },
        -- ["@SpecialComment"] = { italic = true },
      },
    })
  end,
}
