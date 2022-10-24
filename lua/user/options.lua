local opt = vim.opt

opt.autoindent = true
opt.ignorecase = true
opt.shiftwidth = 2
opt.tabstop = 2

opt.termguicolors = true
opt.splitbelow = true
opt.splitright = true
opt.smartcase = true
opt.number = true
opt.relativenumber = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.clipboard = "unnamedplus"
opt.swapfile = false

vim.cmd([[
  if system('uname -r') =~ "microsoft"
    augroup Yank
    autocmd!
    autocmd TextYankPost * :call system('/mnt/c/windows/system32/clip.exe ',@")
    augroup END
  endif
]])
