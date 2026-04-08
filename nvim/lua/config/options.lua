local opt = vim.opt

-- Line numbers
opt.number = true

-- Tabs/indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true

-- Appearance
opt.termguicolors = true
opt.signcolumn = "yes"
opt.scrolloff = 8

-- Behaviour
opt.splitright = true
opt.splitbelow = true
opt.iskeyword:append("-")

-- Undofile
opt.swapfile = false
opt.backup = false
opt.undofile = true
