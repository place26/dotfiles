return {
  'nvim-treesitter/nvim-treesitter',
  run = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup {
      -- 여기에 설치하고자 하는 언어를 추가합니다.
      ensure_installed = { "lua", "vim", "vimdoc", "markdown", "python" },

      -- 자동으로 구문 강조를 활성화합니다.
      highlight = {
        enable = true, -- `false`로 설정하면 구문 강조가 비활성화됩니다.
        additional_vim_regex_highlighting = false,
      },
      
      -- 여기에 다른 nvim-treesitter 모듈 설정을 추가할 수 있습니다.
      -- 예를 들어, 코드 접기(folding)나 인덴테이션 조정 등의 기능을 활성화할 수 있습니다.
      indent = {
        enable = true, -- 언어별 자동 인덴테이션 활성화
      },
    }
  end
}
