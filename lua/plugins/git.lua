-- lua/plugins/git.lua
return {
  {
    "tpope/vim-fugitive",
    lazy = false,
    dependencies = { "tpope/vim-rhubarb" },
    keys = {
      { "<leader>gs", "<cmd>Git<CR>", desc = "Git status" },
      { "<leader>gc", "<cmd>Git commit<CR>", desc = "Git commit" },
      { "<leader>gp", "<cmd>Git push<CR>", desc = "Git push" },
      { "<leader>gl", "<cmd>Git pull<CR>", desc = "Git pull" },
      { "<leader>gd", "<cmd>Gdiffsplit<CR>", desc = "Git diff" },
    },
  },
}

