local keymap = vim.keymap.set

keymap('n', '<C-e>', '$')
keymap('n', '<C-b>', '^')

keymap('n', '<C-a>', 'ggVG')
keymap('v', '<C-c>', '"+y')

keymap('n', '<C-j>', '<C-w>j')
keymap('n', '<C-k>', '<C-w>k')

keymap('t', '<C-x>', '<C-\\><C-n>')
