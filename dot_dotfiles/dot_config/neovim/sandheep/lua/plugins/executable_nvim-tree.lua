local function extract_folder_name(path)
	local parts = vim.fn.split(path, "/")
	return parts[#parts]
end

return {
	"nvim-tree/nvim-tree.lua",
	lazy = false,
	config = {
		filters = {
			dotfiles = true,
		},
		view = {
			-- side = "right",
			number = true,
			relativenumber = true,
		},
		renderer = {
			root_folder_label = extract_folder_name,
		},
	},
}
