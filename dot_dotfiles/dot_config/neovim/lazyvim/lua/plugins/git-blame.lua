return {
  "f-person/git-blame.nvim",
  config = function()
    vim.cmd("highlight default link gitblame SpecialComment")
    require("gitblame").setup({ enabled = true })
  end,
}
