return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false,
    opts = {
      provider = "openai",
      providers = {
        openai = {
          endpoint = "https://api.openai.com/v1",
          model = "gpt-4o-mini",
          api_key = os.getenv("OPENAI_API_KEY"),
          extra_request_body = {
            max_tokens = 2048,
            temperature = 0,
          },
        },
      },
      behaviour = {
        auto_suggestions = false,
        auto_set_highlight_group = true,
        auto_set_keymaps = true,
        auto_apply_diff_after_generation = false,
        support_paste_from_clipboard = false,
      },
      mappings = {
        diff = {
          ours = "co",
          theirs = "ct",
          all_theirs = "ca",
          both = "cb",
          cursor = "cc",
          next = "]x",
          prev = "[x",
        },
        suggestion = {
          accept = "<M-l>",
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
        jump = {
          next = "]]",
          prev = "[[",
        },
        submit = {
          normal = "<CR>",
          insert = "<C-s>",
        },
      },
      hints = { enabled = true },
      windows = {
        position = "right",
        width = 30,
        sidebar_header = { align = "center", rounded = true },
      },
      highlights = {
        diff = { current = "DiffText", incoming = "DiffAdd" },
      },
      diff = { autojump = true, list_opener = "copen" },
    },
    build = "make",
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
  },

  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup({
        api_key_cmd = "echo $OPENAI_API_KEY",
        openai_params = {
          model = "gpt-4",
          frequency_penalty = 0,
          presence_penalty = 0,
          max_tokens = 4096,
          temperature = 0,
          top_p = 1,
          n = 1,
        },
        openai_edit_params = {
          model = "gpt-4",
          frequency_penalty = 0,
          presence_penalty = 0,
          temperature = 0,
          top_p = 1,
          n = 1,
        },
      })
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "folke/trouble.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },

  -- Autocompletado inline con GitHub Copilot (plan Free: 2000 completions/mes).
  -- Requiere Node >= 20 en el PATH. Primera vez: :Copilot auth
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    cmd = "Copilot",
    keys = {
      { "<leader>ct", "<cmd>Copilot toggle<CR>", mode = "n", desc = "Copilot toggle" },
    },
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 150,
        keymap = {
          accept = false, -- <Tab> se mapea abajo, con fallback a tab normal
          accept_line = "<M-a>",
          accept_word = false,
          next = "<M-n>",
          prev = "<M-p>",
          dismiss = "<M-e>",
        },
      },
      panel = { enabled = false },
      -- Deshabilitado donde no aporta, para no gastar cuota
      filetypes = {
        markdown = false,
        gitcommit = false,
        yaml = false,
        help = false,
        ["."] = false,
      },
    },
    config = function(_, opts)
      require("copilot").setup(opts)
      local suggestion = require("copilot.suggestion")
      -- Tab acepta la sugerencia de Copilot si hay una visible; si no, inserta un tab normal
      vim.keymap.set("i", "<Tab>", function()
        if suggestion.is_visible() then
          suggestion.accept()
        else
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
        end
      end, { desc = "Copilot accept / Tab" })
      vim.keymap.set("i", "<M-A>", suggestion.accept, { desc = "Copilot accept" })
    end,
  },
}
