-- ================================================================================================
-- TITLE : catppuccin-nvim
-- ABOUT : Soothing pastel theme for the high-spirited!
-- LINKS :
--   > github : https://github.com/catppuccin/nvim
-- ================================================================================================

return {
	"catppuccin/nvim",
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd("colorscheme catppuccin-mocha")
	end,
}
