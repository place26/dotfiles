local mapkey = require("util.keymapper").mapkey

-- Buffer Navigation
mapkey("<leader>bn", "bnext", "n") -- Next buffer
mapkey("<leader>bp", "bprevious", "n") -- Prev buffer
mapkey("<leader>bb", "e #", "n") -- Switch to Other Buffer
mapkey("<leader>`", "e #", "n") -- Switch to Other Buffer

-- Directory Navigation : nvim-tree.lua에서 설정
-- mapkey("<leader>m", "NvimTreeFocus", "n")
-- mapkey("<leader>e", "NvimTreeToggle", "n")

mapkey("jk", "<ESC>", "i") -- jk to exit insert mode
mapkey("<leader>nh", ":noh1<CR>", "n") -- clear search highlights

-- Pane and Window Navigation
mapkey("<C-h>", "<C-w>h", "n") -- Navigate Left
mapkey("<C-j>", "<C-w>j", "n") -- Navigate Down
mapkey("<C-k>", "<C-w>k", "n") -- Navigate Up
mapkey("<C-l>", "<C-w>l", "n") -- Navigate Right
mapkey("<C-h>", "wincmd h", "t") -- Navigate Left
mapkey("<C-j>", "wincmd j", "t") -- Navigate Down
mapkey("<C-k>", "wincmd k", "t") -- Navigate Up
mapkey("<C-l>", "wincmd l", "t") -- Navigate Right
mapkey("<C-h>", "TmuxNavigateLeft", "n") -- Navigate Left
mapkey("<C-j>", "TmuxNavigateDown", "n") -- Navigate Down
mapkey("<C-k>", "TmuxNavigateUp", "n") -- Navigate Up
mapkey("<C-l>", "TmuxNavigateRight", "n") -- Navigate Right

-- tabs
mapkey("<leader>to", "tabnew<CR>", "n") -- open new tab
mapkey("<leader>tx", "tabclose<CR>", "n") -- close current tab
mapkey("<leader>tn", "tabn<CR>", "n") -- go to next tab
mapkey("<leader>tp", "tabp<CR>", "n") -- go to previous tab
mapkey("<leader>tf", "tabnew %<CR>", "n") -- move current buffer to new tab

-- Window Management
mapkey("<leader>sv", "vsplit", "n") -- Split Vertically
mapkey("<leader>sh", "split", "n") -- Split Horizontally
mapkey("<leader>sm", "MaximizerToggle", "n") -- Toggle Minimise
mapkey("<leader>sx", "close<CR>", "n") -- close current split window

-- Indenting
mapkey("<", "<gv", "v") -- Shift Indentation to Left
mapkey(">", ">gv", "v") -- Shift Indentation to Right

-- Show Full File-Path
mapkey("<leader>pa", "echo expand('%:p')", "n") -- Show Full File Path

-- Comments
mapkey("<leader>c", "gcc", "n")    -- line-comment
mapkey("<leader>c", "gbc", 'v')    -- block-comment 
