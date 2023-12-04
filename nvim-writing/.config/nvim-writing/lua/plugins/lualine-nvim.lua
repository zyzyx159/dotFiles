local function getWords()
  return  "Word count: " .. tostring(vim.fn.wordcount().words)
end

local config = function()
  local theme = require("lualine.themes.catppuccin")
  theme.normal.c.bg = nil

  require('lualine').setup {
    options = {
      theme = theme,
      globalstatus = true,
    },
    sections = {
      lualine_a = {
        {
          'mode',
        }
      },
      lualine_b = {
        {
        'filename'
        }
      },
      lualine_c = {
        {
        getWords
        }
      },
    }
  }
end

return {
  "nvim-lualine/lualine.nvim",
  lazy = false,
  config = config,
}
