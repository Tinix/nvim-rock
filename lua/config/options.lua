-- lua/config/options.lua
-- Vim options configuration

local opt = vim.opt

-- General
opt.mouse = "a"                          -- Enable mouse support
opt.clipboard = "unnamedplus"            -- Use system clipboard
opt.swapfile = false                     -- Don't use swapfile
opt.completeopt = "menuone,noinsert,noselect" -- Completion options

-- Appearance
opt.number = true                        -- Show line numbers
opt.relativenumber = false                -- Show relative line numbers
opt.showmatch = true                     -- Show matching brackets
opt.foldmethod = "marker"                -- Enable folding (space + za to toggle)
opt.colorcolumn = "80,100,120"                   -- Show column at 80 characters
opt.splitright = true                    -- Vertical split to the right
opt.splitbelow = true                    -- Horizontal split to the bottom
opt.ignorecase = true                    -- Ignore case letters when search
opt.smartcase = true                     -- Ignore lowercase for the whole pattern
opt.linebreak = true                     -- Wrap on word boundary
opt.termguicolors = true                 -- Enable true colors support
opt.signcolumn = "yes"                   -- Always show signcolumn

-- Tabs and indentation
opt.expandtab = true                     -- Use spaces instead of tabs
opt.shiftwidth = 2                       -- Shift 2 spaces when tab
opt.tabstop = 2                          -- 1 tab == 2 spaces
opt.smartindent = true                   -- Autoindent new lines
opt.wrap = false                         -- Don't wrap lines

-- Search
opt.incsearch = true                     -- Show search results as you type
opt.hlsearch = true                      -- Highlight search results

-- Performance
opt.updatetime = 250                     -- Faster completion (default 4000ms)
opt.timeoutlen = 300                     -- Faster key sequence completion

-- Undo and backup
opt.undofile = true                      -- Enable persistent undo
opt.undodir = vim.fn.expand("~/.config/nvim/undo")
opt.backup = false                       -- Don't store backup
opt.writebackup = false                  -- Don't write backup

-- Create undo directory if it doesn't exist
vim.fn.mkdir(vim.fn.expand("~/.config/nvim/undo"), "p")
