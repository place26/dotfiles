return {
  'terryma/vim-multiple-cursors',
  config = function()
    -- 여기에 vim-multiple-cursors의 설정을 추가할 수 있습니다.
    -- 기본적으로 vim-multiple-cursors는 사용하기 쉬운 키 바인딩을 제공합니다.
    -- 만약 추가적인 커스터마이징이 필요하다면, 여기에 Lua 코드로 설정을 추가할 수 있습니다.

    -- 예시: 기본 키 바인딩 변경하기
    -- vim.api.nvim_set_keymap('n', '<새 키 바인딩>', '<Plug>(multiple-cursors-find)', {silent = true, noremap = false})
    -- 위 코드는 실제 동작하지 않으며, 키 바인딩 커스터마이징 예시를 보여줍니다.
  end
}

