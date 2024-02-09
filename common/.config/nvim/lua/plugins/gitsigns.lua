return {
  'lewis6991/gitsigns.nvim',
  requires = {'nvim-lua/plenary.nvim'},
  config = function()
    require('gitsigns').setup {
      -- 여기에 gitsigns의 설정을 추가합니다.
      -- 예시 설정:
      signs = {
        add          = {hl = 'GitSignsAdd'   , text = '+', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
        change       = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
        delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
        topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
        changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
      },
      signcolumn = true,  -- Show signs in the sign column
      numhl = false,      -- Toggle numbering highlighting
      linehl = false,     -- Toggle line highlighting
      watch_gitdir = {
        interval = 1000,
        follow_files = true
      },
      current_line_blame = false, -- Toggle current line blame
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
      },
      current_line_blame_formatter_opts = {
        relative_time = false
      },
      sign_priority = 6,
      update_debounce = 100,
      status_formatter = nil, -- Use default
      word_diff = false, -- Toggle word diff
      -- 더 많은 설정은 gitsigns.nvim의 문서를 참조하세요.
    }
  end
}

