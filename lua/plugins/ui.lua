return {
  { "nvim-lualine/lualine.nvim", opts = {} },
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
