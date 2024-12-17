-- ~/.config/nvim/lua/plugins/configs/treesitter.lua

-- Define the options for Treesitter configuration
local options = {
  ensure_installed = { "lua", "vim", "vimdoc", "markdown", "markdown_inline", "perl" },

  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true },

  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    colors = {
      "#77bdfb", -- Set the color you want for the first level
      -- Add more colors if you want more nested levels to be highlighted differently
    },
  },
}

return options

