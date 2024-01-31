local opt = vim.opt

-- Tab/Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true

-- Search
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true

-- Appearance
opt.number = true
opt.relativenumber = true
opt.termguicolors = true
opt.cmdheight = 1
opt.scrolloff = 10
opt.completeopt = "menuone,noinsert,noselect"
opt.showmode = false
opt.cursorline = true
opt.termguicolors = true

-- Behavior
opt.hidden = true
opt.errorbells = true
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.backspace = "indent,eol,start"
opt.iskeyword:append("-")
opt.mouse:append("a")
opt.clipboard:append("unnamedplus")
opt.modifiable = true
opt.encoding = "UTF-8"
opt.wrap = true
opt.wrapmargin = 8
opt.linebreak = true
--opt.nolist = true

-- Spell check
opt.spelllang = 'en_us'
opt.spell = true
opt.spellsuggest={10}
