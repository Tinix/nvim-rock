-- lua/plugins/telescope.lua
local fd = vim.fn.executable("fdfind") == 1 and "fdfind" or vim.fn.executable("fd") == 1 and "fd" or nil

return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    opts = {
      pickers = {
        find_files = {
          hidden = not fd,
          file_ignore_patterns = { "^%.git/", "^%./%.git/" },
          find_command = fd and {
            fd, "--type", "f", "--hidden", "--strip-cwd-prefix",
            "--exclude", ".git",
            "--exclude", "deps",
            "--exclude", "_build",
            "--exclude", "target",
            "--exclude", "node_modules",
          } or nil,
        },
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)
      pcall(telescope.load_extension, "fzf")
    end,
    keys = {
      {
        "<leader>ff",
        function()
          require("telescope.builtin").find_files()
        end,
        desc = "Find files",
      },
      {
        "<leader>fg",
        function()
          require("telescope.builtin").live_grep()
        end,
        desc = "Live grep",
      },
      {
        "<leader>fb",
        function()
          require("telescope.builtin").buffers()
        end,
        desc = "Find buffers",
      },
      {
        "<leader>fh",
        function()
          require("telescope.builtin").help_tags()
        end,
        desc = "Help tags",
      },
    },
  },
}
