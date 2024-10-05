-- Set the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Disable the space bar's default behaviour in normal & visual mode 
vim.keymap.set({'n', 'v'}, '<Space>', '<Nop>', {silent = true})

local opts = {noremap = true, silent = true}

-- save file using ctrl+s
vim.keymap.set('n', '<C-s>', '<cmd> w <CR>', opts)

-- delete single character without copying into register
vim.keymap.set('n', 'x', '"_x', opts)

vim.keymap.set('n', '<leader>to', ':tabnew<CR>', opts) -- open new tab
vim.keymap.set('n', '<leader>tx', ':tabclose<CR>', opts) -- close current tab
vim.keymap.set('n', '<leader>tn', ':tabn<CR>', opts) --  go to next tab
vim.keymap.set('n', '<leader>tp', ':tabp<CR>', opts) --  go to previous tab


