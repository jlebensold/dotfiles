-- Editor options (migrated from vimrc)
local opt = vim.opt

-- Indentation
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.autoindent = true
opt.copyindent = true
opt.shiftround = true
opt.smarttab = true

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Display
opt.wrap = false
opt.showmatch = true
opt.signcolumn = "yes"
opt.colorcolumn = "100"
opt.scrolloff = 8

-- Enable true colors only if terminal supports it
-- Apple Terminal does NOT support true color; use iTerm2, Kitty, or Alacritty for best results
if os.getenv("COLORTERM") == "truecolor" or os.getenv("COLORTERM") == "24bit" then
  opt.termguicolors = true
else
  opt.termguicolors = false
end

-- Use system clipboard
opt.clipboard = "unnamedplus"

-- Behavior
opt.backspace = "indent,eol,start"
opt.history = 1000
opt.undolevels = 1000
opt.undofile = true
opt.title = true
opt.visualbell = true

-- No backup/swap (use undofile instead)
opt.backup = false
opt.swapfile = false

-- Wildmenu
opt.wildignore = "*.swp,*.bak,*.pyc,*.class,*/tmp/*,*.so,*.zip,*/log/*,*/vendor/bundle,*/node_modules,*/coverage/*,*/build/*"

-- Splits
opt.splitbelow = true
opt.splitright = true

-- Window sizing (from your vimrc)
opt.winwidth = 79
opt.winminheight = 0

-- Colorscheme - habamax (built-in, matches iTerm2 Dark)
opt.background = "dark"
vim.cmd.colorscheme("habamax")

-- Prose-friendly settings for markdown
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    local o = vim.opt_local
    o.wrap = true           -- soft wrap long lines
    o.linebreak = true      -- wrap at word boundaries, not mid-word
    o.colorcolumn = ""      -- hide the column ruler
    o.spell = true          -- highlight misspelled words (z= to fix)
    o.spelllang = "en_us"
    o.conceallevel = 2      -- hide markup syntax (bold markers, etc.)
    o.shiftwidth = 2
  end,
})
