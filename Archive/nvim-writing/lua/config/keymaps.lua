local keymap = vim.keymap

-- Directory Navigation
keymap.set("n", "<leader>m", ":NvimTreeFocus<CR>", {noremap = true, silent = true, desc = "Focus on NvimTree"})
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", {noremap = true, silent = true, desc = "Toggle NvimTree"})

-- Navigation keys
keymap.set("n", "k", "gk", {noremap = true, silent = true, desc = "Move up one visual line"})
keymap.set("n", "j", "gj", {noremap = true, silent = true, desc = "Move down one visual line"})

keymap.set("n", "<up>", "gk", {noremap = true, silent = true, desc = "Move up one visual line"})
keymap.set("n", "<down>", "gj", {noremap = true, silent = true, desc = "Move down one visual line"})

