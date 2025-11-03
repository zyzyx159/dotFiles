-- ================================================================================================
-- TITLE : melange-nvim
-- ABOUT : A subtle, warm colorscheme for Neovim inspired by Sublime Text's Melange theme.
-- LINKS :
--   > github : https://github.com/savq/melange-nvim
-- ================================================================================================

return {
	"catppuccin/nvim",
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd("colorscheme catppuccin")
	end,
}
