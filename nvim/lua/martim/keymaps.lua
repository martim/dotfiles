vim.keymap.set('n', 'x', '"_x')

vim.keymap.set('n', '<Up>', '<C-a>')
vim.keymap.set('n', '<Down>', '<C-x>')

vim.keymap.set('n', '<C-a>', 'gg<S-v>G')

vim.keymap.set('n', 'ss', ':split<Return><C-w>w', {silent = true})
vim.keymap.set('n', 'sv', ':vsplit<Return><C-w>w', {silent = true})

vim.keymap.set({'n', 'v'}, '<Space>', '<Nop>', {silent = true})

vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set({"i", "n"}, "<esc>", "<cmd>noh<cr><esc>")

vim.keymap.set("n", "n", "'Nn'[v:searchforward]", {expr = true})
vim.keymap.set("x", "n", "'Nn'[v:searchforward]", {expr = true})
vim.keymap.set("o", "n", "'Nn'[v:searchforward]", {expr = true})
vim.keymap.set("n", "N", "'nN'[v:searchforward]", {expr = true})
vim.keymap.set("x", "N", "'nN'[v:searchforward]", {expr = true})
vim.keymap.set("o", "N", "'nN'[v:searchforward]", {expr = true})

vim.keymap.set({"i", "v", "n", "s"}, "<C-s>", "<cmd>w<cr><esc>")

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

vim.keymap.set("n", "<tab>l", "<cmd>tablast<cr>")
vim.keymap.set("n", "<tab>f", "<cmd>tabfirst<cr>")
vim.keymap.set("n", "<tab><tab>", "<cmd>tabnew<cr>")
vim.keymap.set("n", "<tab>n", "<cmd>tabnext<cr>")
vim.keymap.set("n", "<tab>c", "<cmd>tabclose<cr>")
vim.keymap.set("n", "<tab>p", "<cmd>tabprevious<cr>")
