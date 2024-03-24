return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	event = "User FileOpened",
	config = function()
		require("bufferline").setup({})
	end,
}
