local keymap = vim.keymap.set

-- Move to the beginning and end of the line
keymap("n", "<C-e>", "$")
keymap("n", "<C-b>", "^")

-- Go to the beginning and end of the line in visual mode
keymap("v", "<C-e>", "$")
keymap("v", "<C-b>", "^")

-- Support copy and paste from clipboard
keymap("n", "<C-a>", "ggVG")
keymap("v", "<C-c>", '"+y')

-- Move to the beginning and end of the line when using gg and G
keymap("n", "gg", "gg0")
keymap("n", "G", "G0")

-- Move between windows
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")

-- Exit terminal mode
keymap("t", "<C-x>", "<C-\\><C-n>")

-- Move left and right in insert mode
keymap("i", "<C-h>", "<Left>")
keymap("i", "<C-l>", "<Right>")

-- Toggle comment with leader+/
keymap("n", "<leader>/", "gcc")

-- Disable F1 help key
keymap("n", "<F1>", "<Nop>")
