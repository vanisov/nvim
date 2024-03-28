local keymap_api = vim.api.nvim_set_keymap
local keymap = vim.keymap.set

keymap_api('n', '<C-n>', ':Ex<CR>', {noremap = true, silent = true })

keymap('n', '<C-e>', '$')
keymap('n', '<C-b>', '^')

keymap('n', '<C-a>', 'ggVG')
keymap('v', '<C-c>', '"+y')

keymap('n', '<C-j>', '<C-w>j')
keymap('n', '<C-k>', '<C-w>k')
