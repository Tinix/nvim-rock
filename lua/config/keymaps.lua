-- lua/config/keymaps.lua
-- lua/config/keymaps.lua
-- Key mappings configuration

local keymap = vim.keymap

-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable the spacebar key's default behavior in Normal and Visual modes
keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Save file
keymap.set("n", "<C-s>", ":w<CR>", { desc = "Save file" })

-- Quit
keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit" })
keymap.set("n", "<leader>Q", ":qa!<CR>", { desc = "Quit all" })

-- Clear highlights
-- keymap.set("n", "<Esc>", ":nohlsearch<CR>", { desc = "Clear highlights" })

-- Better window navigation
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Resize windows
keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- Buffer navigation
keymap.set("n", "<S-l>", ":bnext<CR>", { desc = "Next buffer" })
keymap.set("n", "<S-h>", ":bprevious<CR>", { desc = "Previous buffer" })

keymap.set("n", "<S-A-j>", ":m .+1<CR>==", { noremap = true, silent = true, desc = "Move line down" })
keymap.set("n", "<S-A-k>", ":m .-2<CR>==", { noremap = true, silent = true, desc = "Move line up" })
keymap.set("v", "<S-A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true, desc = "Move selection down" })
keymap.set("v", "<S-A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true, desc = "Move selection up" })

keymap.set("n", "<C-S-j>", ":m .+1<CR>==", { noremap = true, silent = true, desc = "Move line down" })
keymap.set("n", "<C-S-k>", ":m .-2<CR>==", { noremap = true, silent = true, desc = "Move line up" })
keymap.set("v", "<C-S-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true, desc = "Move selection down" })
keymap.set("v", "<C-S-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true, desc = "Move selection up" })

keymap.set("n", "<S-A-t>", ":m .+1<CR>==", { noremap = true, silent = true, desc = "Move line down (Dvorak)" })
keymap.set("n", "<S-A-n>", ":m .-2<CR>==", { noremap = true, silent = true, desc = "Move line up (Dvorak)" })
keymap.set("v", "<S-A-t>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true, desc = "Move selection down (Dvorak)" })
keymap.set("v", "<S-A-n>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true, desc = "Move selection up (Dvorak)" })

-- Better indenting
keymap.set("v", "<", "<gv", { desc = "Indent left" })
keymap.set("v", ">", ">gv", { desc = "Indent right" })

-- Paste over currently selected text without yanking it
keymap.set("v", "p", '"_dP', { desc = "Paste without yanking" })

-- AI keymaps
keymap.set("n", "<leader>aa", ":AvanteAsk<CR>", { desc = "Avante Ask" })
keymap.set("v", "<leader>ae", ":AvanteEdit<CR>", { desc = "Avante Edit" })
keymap.set("n", "<leader>ar", ":AvanteRefresh<CR>", { desc = "Avante Refresh" })
keymap.set("n", "<leader>at", ":AvanteToggle<CR>", { desc = "Avante Toggle" })

-- ChatGPT keymaps
keymap.set("n", "<leader>cc", ":ChatGPT<CR>", { desc = "ChatGPT" })
keymap.set("v", "<leader>ce", ":ChatGPTEditWithInstruction<CR>", { desc = "Edit with instruction" })
keymap.set("v", "<leader>cg", ":ChatGPTRun grammar_correction<CR>", { desc = "Grammar correction" })
keymap.set("v", "<leader>ct", ":ChatGPTRun translate<CR>", { desc = "Translate" })
keymap.set("v", "<leader>ck", ":ChatGPTRun keywords<CR>", { desc = "Keywords" })
keymap.set("v", "<leader>cd", ":ChatGPTRun docstring<CR>", { desc = "Docstring" })
keymap.set("v", "<leader>ca", ":ChatGPTRun add_tests<CR>", { desc = "Add tests" })
keymap.set("v", "<leader>co", ":ChatGPTRun optimize_code<CR>", { desc = "Optimize code" })
keymap.set("v", "<leader>cs", ":ChatGPTRun summarize<CR>", { desc = "Summarize" })
keymap.set("v", "<leader>cf", ":ChatGPTRun fix_bugs<CR>", { desc = "Fix bugs" })
keymap.set("v", "<leader>cx", ":ChatGPTRun explain_code<CR>", { desc = "Explain code" })
keymap.set("v", "<leader>cr", ":ChatGPTRun roxygen_edit<CR>", { desc = "Roxygen edit" })
keymap.set("v", "<leader>cl", ":ChatGPTRun code_readability_analysis<CR>", { desc = "Code readability analysis" })

-- Toggle NvimTree with Ctrl+e
keymap.set("n", "<C-e>", function()
  require("nvim-tree.api").tree.toggle()
end, { noremap = true, silent = true, desc = "Toggle NvimTree" })

-- Remap movement keys for Dvorak: htns
keymap.set("n", "h", "h", { noremap = true, silent = true })
keymap.set("n", "t", "j", { noremap = true, silent = true })
keymap.set("n", "n", "k", { noremap = true, silent = true })
keymap.set("n", "s", "l", { noremap = true, silent = true })

keymap.set("v", "h", "h", { noremap = true, silent = true })
keymap.set("v", "t", "j", { noremap = true, silent = true })
keymap.set("v", "n", "k", { noremap = true, silent = true })
keymap.set("v", "s", "l", { noremap = true, silent = true })
