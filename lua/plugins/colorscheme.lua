-- lua/plugins/colorscheme.lua
-- Tokyo Night es el tema por defecto y el único que carga al inicio.
-- El resto carga con :colorscheme <nombre> o con el selector (<leader>th).
-- El último tema elegido se guarda en stdpath("data")/last_colorscheme.

local default_colorscheme = "tokyonight"
local state_file = vim.fn.stdpath("data") .. "/last_colorscheme"

local function read_last_colorscheme()
  local ok, lines = pcall(vim.fn.readfile, state_file)
  if ok and lines[1] and lines[1] ~= "" then
    return lines[1]
  end
end

-- Todos los colorschemes disponibles, incluidos los de plugins lazy todavía no cargados
-- (el selector de Telescope solo ve los que ya están en el runtimepath).
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
  -- Tokyo Night (tema por defecto)
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "night", -- night, storm, day, moon
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

      -- Guardar el tema elegido
      vim.api.nvim_create_autocmd("ColorScheme", {
        group = vim.api.nvim_create_augroup("LastColorscheme", { clear = true }),
        callback = function(event)
          pcall(vim.fn.writefile, { event.match }, state_file)
        end,
        desc = "Save last colorscheme",
      })

      -- Cargar el último tema elegido; si no existe, volver a tokyonight
      local last = read_last_colorscheme()
      if not (last and pcall(vim.cmd.colorscheme, last)) then
        vim.cmd.colorscheme(default_colorscheme)
      end

      -- Selector de colorschemes con preview en vivo
      vim.keymap.set("n", "<leader>th", function()
        require("telescope.builtin").colorscheme({ enable_preview = true, colors = all_colorschemes() })
      end, { desc = "Theme picker" })
    end,
  },

  -- Catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
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

  -- Sonokai
  {
    "sainnhe/sonokai",
    lazy = true,
    config = function()
      vim.g.sonokai_style = "default" -- default, atlantis, andromeda, shusia, maia, espresso
      vim.g.sonokai_transparent_background = 0
      vim.g.sonokai_enable_italic = 1
      vim.g.sonokai_disable_italic_comment = 0
    end,
  },

  -- Gruvbox
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
        contrast = "", -- hard, soft o ""
        palette_overrides = {},
        overrides = {},
        dim_inactive = false,
        transparent_mode = false,
      })
    end,
  },

  -- Dracula
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

  -- Nord
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

  -- Nightfox
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

  -- Rose Pine
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = true,
    config = function()
      require("rose-pine").setup({
        variant = "auto", -- auto, main, moon, dawn
        dark_variant = "main",
        bold_vert_split = false,
        dim_nc_background = false,
        disable_background = false,
        disable_float_background = false,
      })
    end,
  },

  -- Kanagawa (incluye siempre los highlights de telescope, nvim-tree, cmp,
  -- gitsigns y treesitter, y su propio tema de lualine; no tiene toggles por plugin)
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

  -- Onedark
  {
    "navarasu/onedark.nvim",
    lazy = true,
    config = function()
      require("onedark").setup({
        style = "dark", -- dark, darker, cool, deep, warm, warmer, light
        transparent = false,
        term_colors = true,
        ending_tildes = false,
        cmp_itemkind_reverse = false,
      })
    end,
  },

  -- Solarized
  {
    "ishan9299/nvim-solarized-lua",
    lazy = true,
    config = function()
      vim.o.background = "dark" -- dark, light
    end,
  },

  -- Temas sin configuración extra
  { "sainnhe/everforest", lazy = true },
  { "sainnhe/gruvbox-material", lazy = true },
  { "craftzdog/solarized-osaka.nvim", lazy = true },
  { "scottmckendry/cyberdream.nvim", lazy = true },
  -- build = false: el Lua ya viene compilado; el rockspec pide fennel + Lua 5.1 sin necesidad
  { "nyoom-engineering/oxocarbon.nvim", lazy = true, build = false },
  { "AlexvZyl/nordic.nvim", lazy = true },
  { "projekt0n/github-nvim-theme", lazy = true }, -- github_dark, github_light, ...
  { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = true },
  { "bluz71/vim-nightfly-colors", name = "nightfly", lazy = true },
  { "oxfist/night-owl.nvim", lazy = true },
  { "savq/melange-nvim", lazy = true },
  { "loctvl842/monokai-pro.nvim", lazy = true },
  { "tiagovla/tokyodark.nvim", lazy = true },
}
