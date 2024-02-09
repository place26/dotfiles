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
mapkey("<leader>nh", ":nohl<CR>", "n") -- clear search highlights

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

-- 'vim-multiple-cursors' 플러그인의 키 맵핑 추가
-- mapkey("<A-m>", "<Plug>(multiple-cursors-start)", 'n') -- Alt-m으로선택한 단어의 다중 선택을 시작 
-- mapkey("<A-m>", "<Plug>(multiple-cursors-next)", 'n') -- 다음 단어로 이동
-- mapkey("<A-p>", "<Plug>(multiple-cursors-prev)", 'n') -- 이전 단어로 이동
-- mapkey("<A-x>", "<Plug>(multiple-cursors-skip)", 'n') -- 해당 단어 제외
-- mapkey("<Esc>", "<Plug>(multiple-cursors-quit)", 'n') -- 다중선택 모든에서 나오기, 다중 커서는 유지

-- 'vim-multiple-cursors' 플러그인의 키 맵핑 추가
-- mapkey("<A-m>", function() vim.cmd('MultipleCursorsStart') end, 'n')
-- mapkey("<A-m>", function() vim.cmd('MultipleCursorsNext') end, 'n')
-- mapkey("<A-p>", function() vim.cmd('MultipleCursorsPrev') end, 'n')
-- mapkey("<A-x>", function() vim.cmd('MultipleCursorsSkip') end, 'n')
-- mapkey("<Esc>", function() vim.cmd('MultipleCursorsQuit') end, 'n')

