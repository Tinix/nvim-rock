local default_colorscheme = "batman"
local fallback_colorscheme = "tokyonight"

local function all_colorschemes()
  local names = {}
  for _, plugin in pairs(require("lazy.core.config").plugins) do
    for _, file in ipairs(vim.fn.glob(plugin.dir .. "/colors/*.{vim,lua}", false, true)) do
      names[vim.fn.fnamemodify(file, ":t:r")] = true
    end
  end
  for _, name in ipairs(vim.fn.getcompletion("", "color")) do
    names[name] = true
  end
  local list = vim.tbl_keys(names)
  table.sort(list)
  return list
end

return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "night",
        transparent = false,
        terminal_colors = true,
        plugins = {
          auto = true,
          telescope = true,
          ["nvim-tree"] = true,
          cmp = true,
          gitsigns = true,
          treesitter = true,
        },
      })

      if not pcall(vim.cmd.colorscheme, default_colorscheme) then
        vim.cmd.colorscheme(fallback_colorscheme)
      end

      vim.keymap.set("n", "<leader>th", function()
        require("telescope.builtin").colorscheme({ enable_preview = true, colors = all_colorschemes() })
      end, { desc = "Theme picker" })
    end,
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = false,
        term_colors = true,
        integrations = {
          telescope = { enabled = true },
          nvimtree = true,
          cmp = true,
          gitsigns = true,
          treesitter = true,
        },
      })
    end,
  },

  {
    "sainnhe/sonokai",
    lazy = true,
    config = function()
      vim.g.sonokai_style = "default"
      vim.g.sonokai_transparent_background = 0
      vim.g.sonokai_enable_italic = 1
      vim.g.sonokai_disable_italic_comment = 0
    end,
  },

  {
    "ellisonleao/gruvbox.nvim",
    lazy = true,
    config = function()
      require("gruvbox").setup({
        terminal_colors = true,
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
          strings = true,
          emphasis = true,
          comments = true,
          operators = false,
          folds = true,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = true,
        contrast = "",
        palette_overrides = {},
        overrides = {},
        dim_inactive = false,
        transparent_mode = false,
      })
    end,
  },

  {
    "Mofiqul/dracula.nvim",
    lazy = true,
    config = function()
      require("dracula").setup({
        transparent_bg = false,
        italic_comment = true,
      })
    end,
  },

  {
    "shaunsingh/nord.nvim",
    lazy = true,
    config = function()
      vim.g.nord_contrast = true
      vim.g.nord_borders = false
      vim.g.nord_disable_background = false
      vim.g.nord_italic = false
      vim.g.nord_uniform_diff_background = true
      vim.g.nord_bold = false
    end,
  },

  {
    "EdenEast/nightfox.nvim",
    lazy = true,
    config = function()
      require("nightfox").setup({
        options = {
          transparent = false,
          terminal_colors = true,
          dim_inactive = false,
          module_default = true,
        },
      })
    end,
  },

  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = true,
    config = function()
      require("rose-pine").setup({
        variant = "auto",
        dark_variant = "main",
        bold_vert_split = false,
        dim_nc_background = false,
        disable_background = false,
        disable_float_background = false,
      })
    end,
  },

  {
    "rebelot/kanagawa.nvim",
    lazy = true,
    config = function()
      require("kanagawa").setup({
        compile = false,
        undercurl = true,
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = false,
        dimInactive = false,
        terminalColors = true,
      })
    end,
  },

  {
    "navarasu/onedark.nvim",
    lazy = true,
    config = function()
      require("onedark").setup({
        style = "dark",
        transparent = false,
        term_colors = true,
        ending_tildes = false,
        cmp_itemkind_reverse = false,
      })
    end,
  },

  {
    "ishan9299/nvim-solarized-lua",
    lazy = true,
    config = function()
      vim.o.background = "dark"
    end,
  },

  {
    "the-coding-doggo/batman.nvim",
    lazy = true,
    cmd = { "Batman", "BatmanList", "BatmanPreview", "BatmanRestore", "BatmanLspToggle" },
    opts = {
      theme = "arkham",
      use_persistence = true,
      transparent_background = false,
    },
    config = function(_, opts)
      local orig_print = print
      print = function() end
      local ok, err = pcall(require("batman").setup, opts)
      print = orig_print
      if not ok then
        vim.notify("batman.nvim: " .. tostring(err), vim.log.levels.ERROR)
      end
    end,
  },

  { "sainnhe/everforest", lazy = true },
  { "sainnhe/gruvbox-material", lazy = true },
  { "craftzdog/solarized-osaka.nvim", lazy = true },
  { "scottmckendry/cyberdream.nvim", lazy = true },
  { "nyoom-engineering/oxocarbon.nvim", lazy = true, build = false },
  { "AlexvZyl/nordic.nvim", lazy = true },
  { "projekt0n/github-nvim-theme", lazy = true },
  { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = true },
  { "bluz71/vim-nightfly-colors", name = "nightfly", lazy = true },
  { "oxfist/night-owl.nvim", lazy = true },
  { "savq/melange-nvim", lazy = true },
  { "loctvl842/monokai-pro.nvim", lazy = true },
  { "tiagovla/tokyodark.nvim", lazy = true },
}
