-- Shortcuts
vim.g.mapleader = " "
vim.keymap.set('n', '<leader>n', '<cmd>Neotree toggle filesystem right<CR>')

-- Basic Settings
vim.opt.number = true                           -- Line numbers
vim.opt.relativenumber = true                   -- Relative line numbers
vim.opt.cursorline = true                       -- Highlight current line
vim.opt.wrap = false                            -- Don't wrap lines
vim.opt.scrolloff = 10                          -- Keep 10 lines above/below cursor 
vim.opt.sidescrolloff = 8                       -- Keep 8 columns left/right of cursor

-- Indentation
vim.opt.tabstop = 4                             -- Tab width
vim.opt.shiftwidth = 4                          -- Indent width
vim.opt.softtabstop = 4                         -- Soft tab stop
vim.opt.expandtab = true                        -- Use spaces instead of tabs
vim.opt.smartindent = true                      -- Smart auto-indenting
vim.opt.autoindent = true                       -- Copy indent from current line

-- Search settings
vim.opt.ignorecase = true                       -- Case insensitive search
vim.opt.smartcase = false                       -- Case sensitive if uppercase in search
vim.opt.hlsearch = false                        -- Don't highlight search results 
vim.opt.incsearch = true                        -- Show matches as you type

require("config.lazy")

require('transparent').clear_prefix('NeoTree')
