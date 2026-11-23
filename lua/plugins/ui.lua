return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function()
      -- En modo visual la barra se ve igual que en NORMAL
      local theme = require("lualine.themes.auto")
      theme.visual = theme.normal
      local hide = { VISUAL = 1, ["V-LINE"] = 1, ["V-BLOCK"] = 1, SELECT = 1, ["S-LINE"] = 1, ["S-BLOCK"] = 1 }
      return {
        options = { theme = theme },
        sections = {
          lualine_a = { { "mode", fmt = function(s) return hide[s] and "NORMAL" or s end } },
        },
      }
    end,
  },
  { "nvim-tree/nvim-web-devicons" },
  { "nvim-tree/nvim-tree.lua", opts = {} },
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "lua",
          "elixir",
          "heex",
          "eex",
          "ruby",
          "javascript",
          "html",
          "css",
        },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
      })
    end,
  },
}
