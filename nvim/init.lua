-- Neovim configuration
-- Migrated from vimrc, modernized for 2024+

-- Set leader key before lazy
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Load configuration modules
require("options")
require("keymaps")
require("plugins")
