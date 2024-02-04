" General Options: {{{

set termguicolors
set background=dark
set nocompatible                " make vim more powerful
filetype plugin indent on
filetype plugin on
syntax on
set mouse=a                     " support mouse
set confirm                     " ask before unsage action

" ssh 사용시 발생할 수 있는 문제 예방
set noswapfile                  " don't use swap file
set nobackup
set undodir=~/.vim/undodir
set undofile

set encoding=utf-8
set clipboard=unnamed,unnamedplus               " 외부 clipboard 이용
set updatetime=100
set number relativenumber                     " with relativenumber, show current number
set langmap=ㅁa,ㅠb,ㅊc,ㅇd,ㄷe,ㄹf,ㅎg,ㅗh,ㅑi,ㅓj,ㅏk,ㅣl,ㅡm,ㅜn,ㅐo,ㅔp,ㅂq,ㄱr,ㄴs,ㅅt,ㅕu,ㅍv,ㅈw,ㅌx,ㅛy,ㅋz

set showcmd
set noshowmode
set wildmenu
set wildmode=longest,list,full

" tab settings: remove autoindent, shiftround
set smarttab tabstop=4                                   " width of a tab character
set expandtab softtabstop=4 shiftwidth=4                    " cause spaces to be used instead of tabs
set smartindent

set ignorecase smartcase
set incsearch hlsearch
set gdefault

set wrap
set breakindent
set textwidth=0
set paste                                       " paste 시 자동 들여쓰기 하지 않기
                                                 " 사용시 아래 inoremap jk <ESC> 안됨

" Set <leader> key to <Space>
nnoremap <Space> <Nop>
let mapleader=" "
let maplocalleader=","

" iPad를 위해 <ESC>를 키 매핑, 무척 편리함. set paste와 같이 쓸 경우 안됨.
inoremap jk <ESC>
inoremap ㅓㅏ <ESC>

set backspace=indent,start,eol                      " <BS> 역할설정, eol 제외
set scrolloff=3                                 " during scroll keep 3 lines be shown"
set laststatus=2                                " always show status line
set cursorline                                  " highlight the line with a cursor
set list
set listchars=tab:▸\ ,trail:⋅,extends:>,precedes:<,eol:¬,nbsp:_

" Disable cursor line highlighting in Insert mode
augroup aug_cursor_line
   au!
   au InsertEnter * setlocal nocursorline
   au InsertLeave * setlocal cursorline
augroup END



" }}}

" Plugins: {{{

call plug#begin('~/.vim/plugged')

   " Vim Make Pretty:
   Plug 'sainnhe/forest-night'                  " my favorit colorscheme
   Plug 'gruvbox-community/gruvbox'             " well made browny theme
   Plug 'mhinz/vim-startify'                    " fancy start screen for vim
   Plug 'itchyny/lightline.vim'                 " simple light weight status/tabline plugin for vim

   " Shell:
   " Plug 'mcchrish/nnn.vim'                    " nnn
   Plug 'scrooloose/nerdtree'
   " Plug 'ptzz/lf.vim'                           " lf integration in vim
   Plug '907th/vim-auto-save'
   Plug 'samoshkin/vim-lastplace'               " 파일을 열때 마지막 상태로 불러들임
   Plug 'terryma/vim-smooth-scroll'             " C-u(p)|d(own)|b(ack)|f(ront)
   Plug 'vim-scripts/CursorLineCurrentWindow'
   Plug 'tpope/vim-obsession'                   " write current state of vim: window position, open folds
                                                " automatically re-invoke :mksession before exit
                                                " invoke :mksession whenever the layout change
   " Plug 'majutsushi/tagbar'
   " Plug 'ludovicchabant/vim-gutentags'

   " GIT:
   Plug 'tpope/vim-fugitive'                     " git plugin
   Plug 'junegunn/gv.vim'                        " git commit browser :GV | GV! | GV?
   Plug 'airblade/vim-gitgutter'                 " show git diff in the 'gutter' (sign colume)

   " Search:
   Plug 'dyng/ctrlsf.vim'                       " :CtrlSF {pattern} ~/Sync
   Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }      " fuzzy file finder
   " Plug 'junegunn/fzf.vim'                      " <leader>o :Files, <leader>b(uffer)|l(ine)|`(marks)|p(command)|t(filetype)|<F1>(help)|;(changes)
                                                " <C-x>|<C-k>(word),<C-f>(path),<C-l>(bufferline)
                                                " <leader>o(Files)|O(Files!)
                                                " check Mappings
   Plug 'rhysd/clever-f.vim'
   Plug 'romainl/vim-qf'                        " :help vim-qf, vim-quickfix - 여러 plugin에서 활용
                                                " <F5> to hide/show quickfix window
   Plug 'junegunn/vim-slash'                    " 검색된 결과를 강조(highlight), 커서가 벗어나면 강조해제
                                                " improved star-search (visual-mode, highlighting without moving)

   " Keyboard:
   Plug 'SirVer/ultisnips'
   Plug 'honza/vim-snippets'
   Plug 'tpope/vim-commentary'
   " Plug 'Valloric/YouCompleteMe'              " best python auto-complete
   Plug 'tpope/vim-surround'                    " surroundings: parentheses, brackets, quotes, XML tabs and more
                                                " cs"'|cs'<q>|ysiw]|cs]{|yssb
                                                " or yss)|ysiw<em>|visual mode S<p class="important">
   Plug 'jiangmiao/auto-pairs'                  " pair brackets,parens,quotes

   " VimWiki:
   Plug 'vimwiki/vimwiki'                       " <leader>ww|wt|w<leader>
   Plug 'mattn/calendar-vim'
   Plug 'tpope/vim-speeddating'

   " Markdown:
   Plug 'junegunn/goyo.vim'                     " :Goyo
   Plug 'junegunn/limelight.vim'                " Goyo와 함께 사용되는 플러그인
   " Plug 'godlygeek/tabular'                     " aligning text :Tab(ularize) /=
   Plug 'plasticboy/vim-markdown'               " syntax highlighting matching rules and mappings for the original Markdown and extensions
                                                " tabular plugin must come before vim-markdown
   " Plug 'suan/vim-instant-markdown'


call plug#end()

" Load the version of matchit.vim that ships with Vim
packadd! matchit

" }}}

" colorscheme must be located after Plug
let g:forest_night_enable_italic= 0
let g:forest_night_disable_italic_comment = 1
colorscheme gruvbox

" Folding {{{

" 속도 문제가 발생, 파일오픈 시 unfolded로 불러들임.
set foldenable
set foldmethod=marker
set foldlevelstart=99
" set foldcolumn=1

" What triggers automatic fold opening
set foldopen-=block
set foldopen-=hor
set foldopen+=jump

" Use [z and ]z to navigate to start/end of the fold
" Use zj and zk to navigate to neighbooring folds
" Use zJ and zK to navigate to prev/next opened fold
" https://stackoverflow.com/questions/9403098/is-it-possible-to-jump-to-closed-folds-in-vim
nnoremap <silent> zJ :call <SID>NextOpenedFold('j')<CR>
nnoremap <silent> zK :call <SID>NextOpenedFold('k')<CR>

function! s:NextOpenedFold(dir)
  let cmd = 'norm!z' . a:dir
  let view = winsaveview()
  let [l0, l, open] = [0, view.lnum, 0]
  while l != l0 && !open
    exe cmd
    let [l0, l] = [l, line('.')]
    let open = foldclosed(l) < 0
  endwhile
  if !open
    call winrestview(view)
  endif
endfunction

" Remap because 'za' is highly inconvenient to type
nnoremap <leader><Space> za
" Remap folds everything all the way: fold-close-all
nnoremap <leader>fca zM
" Close all folds except the one under the cursor, and center the screen
nnoremap <leader>fce zMzvzz

" }}}

" Window management {{{
" 적응해서 사용하기: 괜찮은 것 같음
" Navigate between windows
noremap <silent> <C-k> :wincmd k<CR>
noremap <silent> <C-j> :wincmd j<CR>
noremap <silent> <C-h> :wincmd h<CR>
noremap <silent> <C-l> :wincmd l<CR>

" Use <Bslash> instead of <C-w>, which is tough to type
nmap <Bslash> <C-w>

" Splits : default splitabove
set splitbelow
set splitright
nnoremap <silent> <leader>_ :split<CR>
nnoremap <silent> <leader>\| :vsplit<CR>
nnoremap <silent> <leader>0 :only<CR>

" Maximize split
" Use '<C-w>=' to make window sizes equal back
nnoremap <C-w><Bslash> <C-w>_<C-w>\|

" Tab navigation
nnoremap <silent> <leader>1 :tabnext 1<CR>
nnoremap <silent> <leader>2 :tabnext 2<CR>
nnoremap <silent> <leader>3 :tabnext 3<CR>
nnoremap <silent> <leader>4 :tabnext 4<CR>
nnoremap <silent> <leader>5 :tabnext 5<CR>
nnoremap <silent> <leader>9 :tablast<CR>

" Or use built-in gt/gT to traverse between tabs
nnoremap <silent> ]<Tab> :tabnext<CR>
nnoremap <silent> [<Tab> :tabprev<CR>

" Tab management
nnoremap <silent> <leader>+ :tabnew<CR>:edit .<CR>
nnoremap <silent> <leader>) :tabonly<CR>
nnoremap <silent> <leader>- :tabclose<CR>

" <C-w>T, moves window to a new tab (built-in)
" <C-w>t, copies window to a new tab
" NOTE: Hides original <C-w>t behavior to move to the topmost window
nnoremap <C-w>t :tab split<CR>

" Cycle between main and alternate file
nnoremap <C-w><Tab> <C-^>zz

" Resize windows
" in steps greather than just 1 column at a time
let _resize_factor = 1.2
nnoremap <C-w>> :exe "vert resize " . float2nr(round(winwidth(0) * _resize_factor))<CR>
nnoremap <C-w>< :exe "vert resize " . float2nr(round(winwidth(0) * 1/_resize_factor))<CR>
nnoremap <C-w>+ :exe "resize " . float2nr(round(winheight(0) * _resize_factor))<CR>
nnoremap <C-w>- :exe "resize " . float2nr(round(winheight(0) * 1/_resize_factor))<CR>

augroup aug_window_management
  au!

  " Detect when window is closed and fire custom event
  au BufWinEnter,WinEnter,BufDelete * call s:CheckIfWindowWasClosed()
  au User OnWinClose call s:Noop()

  " Make all windows of equal size on Vim resize
  au VimResized * wincmd =
augroup END

" Detect when window in a tab was closed
" Vim does not have WinClose event, so try to emulate it
" NOTE: does not work when non-current window gets closed
" See: https://github.com/vim/vim/issues/742
function! s:CheckIfWindowWasClosed()
  " Check if previous window count per tab is greather than current window count
  " It indicates that window was closed
  if get(t:, 'prevWinCount', 0) > winnr('$')
    doautocmd User OnWinClose
  endif

  let t:prevWinCount = winnr('$')
endfunction

function s:Noop()
endfunction

" }}}

" {{{ PLUGIN: dyng/ctrlsf.vim

" 이것 하나면 충분할 것 같음
let g:ctrlsf_auto_focus = { "at": "start" }
" let g:ctrlsf_ignore_dir = g:search_ignore_dirs
let g:ctrlsf_regex_pattern = 1
let g:ctrlsf_case_sensitive = 'smart'
let g:ctrlsf_follow_symlinks = 1
let g:ctrlsf_selected_line_hl = 'po'
let g:ctrlsf_indent = 8
" NOTE: 운영체제에 따라 설치위치가 달라짐. 확인 필요
let g:ctrlsf_ackprg = '/bin/ag'
let g:ctrlsf_winsize = '35%'

" Autoclose search pane in both normal and compact view
" o, <CR>, open file and close search pane
" O, open file and keep search pane
" n/N, navigate thru results and immediately open a preview
let g:ctrlsf_auto_close = {
      \ "normal" : 1,
      \ "compact": 1
      \ }
let g:ctrlsf_mapping = {
      \ "open": ["<CR>", "o"],
      \ "openb": "O",
      \ "next": { "key": "n", "suffix": ":norm O<CR><C-w>p" },
      \ "prev": { "key": "N", "suffix": ":norm O<CR><C-w>p" },
      \ }

" let g:ctrlsf_ackprg = '/usr/bin/ag'에서 manual로 지정 함
" If ripgrep is available, use it
" if executable('rg')
"   let g:ctrlsf_ackprg = 'rg'
"   let g:ctrlsf_extra_backend_args = {
"         \ 'rg': '--hidden'
"         \ }
" endif

" Tweak search pane window options
function! g:CtrlSFAfterMainWindowInit()
  setlocal list
endfunction

" Commands and mappings
nnoremap <leader>csfo :CtrlSFOpen<CR>
nnoremap <leader>csfc :call <SID>ctrlsf_search_quit()<CR>

" Stop searching, get back
function s:ctrlsf_search_quit()
  CtrlSFClose
  CtrlSFClearHL
  if exists("t:is_ctrlsf_tab")
    tabclose
  endif
endfunction

" }}}

" PLUGIN: fzf.vim{{{

let g:fzf_layout = { 'down': '~60%' }
" Empty value to disable preview window altogether
let g:fzf_preview_window = ''

" Populate quickfix list with selected files
function! s:build_quickfix_list(lines)
    call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
    botright copen
    cc
endfunction

" Ctrl-q allows to select multiple elements an open them in quick list
let g:fzf_action = {
            \ 'ctrl-q': function('s:build_quickfix_list'),
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-s': 'split',
            \ 'ctrl-v': 'vsplit' }

" Add namespace for fzf.vim exported commands
" let g:fzf_command_prefix = 'Fzf'

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" File path completion in Insert mode using fzf
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-buffer-line)

" Use preview when FzfFiles runs in fullscreen
command! -nargs=? -bang -complete=dir Files
            \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)
" Sync 하위 폴더에서 찾음
command! -bang SyncFiles call fzf#vim#files('~/Sync', <bang>0)
command! -bang HHPatients call fzf#vim#files('/media/xupei/4T5')
command! -bang RsyncLogs call fzf#vim#files('~/Rsync/logs', <bang>0)

" Mappings
nnoremap <silent> <leader>o :Files<CR>
nnoremap <silent> <leader>O :Files!<CR>
nnoremap <silent> <leader>l :Buffers<CR>
nnoremap <silent> <leader>b :BLines<CR>
nnoremap <silent> <leader>` :Marks<CR>
nnoremap <silent> <leader>p :Commands<CR>
nnoremap <silent> <leader>t :Filetypes<CR>
nnoremap <silent> <F1> :Helptags<CR>
inoremap <silent> <F1> <ESC>:Helptags<CR>
cnoremap <silent> <expr> <C-p> getcmdtype() == ":" ? "<C-u>:History:\<CR>" : "\<ESC>:History/\<CR>"
cnoremap <silent> <C-_> <C-u>:Commands<CR>

" fzf.Tags uses existing 'tags' file or generates it otherwise
nnoremap <silent> <leader>] :Tags<CR>
xnoremap <silent> <leader>] "zy:Tags <C-r>z<CR>

" fzf.BTags generate tags on-fly for current file
nnoremap <silent> <leader>} :BTags<CR>
xnoremap <silent> <leader>} "zy:BTags <C-r>z<CR>

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Show list of change in fzf
" Some code is borrowed from ctrlp.vim and tweaked to work with fzf
" FzfChanges --> Change
command Changes call s:fzf_changes()
nnoremap <silent> <leader>; :Changes<CR>

function! s:fzf_changelist()
    redir => result
    silent! changes
    redir END

    return map(split(result, "\n")[1:], 'tr(v:val, "	", " ")')
endf

function! s:fzf_changeaccept(line)
    let info = matchlist(a:line, '\s\+\(\d\+\)\s\+\(\d\+\)\s\+\(\d\+\).\+$')
    call cursor(get(info, 2), get(info, 3))
    silent! norm! zvzz
endfunction

function! s:fzf_changes()
    return fzf#run(fzf#wrap({
                \ 'source':  reverse(s:fzf_changelist()),
                \ 'sink': function('s:fzf_changeaccept'),
                \ 'options': '+m +s --nth=3..'
                \ }))
endfunction

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'
" }}}

" PLUGIN: rhysd/clever-f.vim{{{

" Add highlighting for f/t searches
" Uses f/t to advance to next match instead of using ';' and ','
let g:clever_f_ignore_case = 1
let g:clever_f_smart_case = 1

" Use same highlighting group as a normal search
let g:clever_f_mark_char_color = 'IncSearch'

" Use ; character as a placeholder for any sign characters: {, (, "
let g:clever_f_chars_match_any_signs = ';'
" }}}

" PLUGIN: vim-commentary {{{

augroup aug_commentary
  au!

  " Tell how comment is marked depending on file type
  au FileType vim setlocal commentstring=\"\ %s
augroup end

" Comment line and move 1 line down
nmap <silent> <leader>c <Plug>CommentaryLine :normal j<CR>
xmap <leader>c <Plug>Commentary

" }}}

" PLUGIN: junegunn/goyo.vim {{{

augroup aug_plug_goyo
  au!

  autocmd! User GoyoEnter Limelight
  autocmd! User GoyoLeave Limelight!
augroup END

let g:limelight_default_coefficient = 0.7
let g:limelight_priority = -1
let g:goyo_width = 99 


" }}}

" PLUGIN: VimWiki/UltiSnips {{{

" disable folding
let g:vimwiki_folding = ''
let g:vimwiki_global_ext=0
let g:vimwiki_hl_cb_checked=2
" <tab> 키를 이용한 table 정렬을 취소
let g:vimwiki_table_mappings = 0
let g:vimwiki_conceallevel = 2

" vimwiki를 위한 wrap 설정
au BufRead,BufNewFile *.wiki setlocal textwidth=99
au BufRead,BufNewFile *.wiki setlocal formatoptions+=w
au BufRead,BufNewFile *.md setlocal textwidth=99
au BufRead,BufNewFile *.md setlocal formatoptions+=w
" VimWikiWrap
nnoremap <leader>vww gqip
nnoremap <leader>vdg :VimwikiDiaryGenerateLinks<CR>

" syncthing 공유 폴더를 활용
" 두개의 wikilist를 사용, 두번째는 huahan 전용 markdown syntax 사
let g:vimwiki_list = [
      \{
      \  'path'               : '~/Sync/wiki/',
      \  'syntax'             : 'markdown',
      \  'ext'                : '.md',
      \  'auto_diary_index'   : 1,
      \},
      \{
      \  'path'               : '~/PatientsNotes/',
      \  'auto_tags'          : 1,
      \  'auto_diary_index'   : 1,
      \},
\]

let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsListSnippets="<C-p>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
" let g:UltiSnipsEditSplit = 'context'

let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']

hi VimwikiHeader1 cterm=bold term=bold gui=bold guifg=#FF7B25
hi VimwikiHeader2 cterm=bold term=bold gui=bold guifg=#82B74B
hi VimwikiHeader3 cterm=bold term=bold gui=bold guifg=#92A8D1
hi VimwikiHeader4 cterm=bold term=bold gui=bold guifg=#F18973
hi VimwikiHeader5 cterm=bold term=bold gui=bold guifg=#F4A688
hi VimwikiHeader6 cterm=bold term=bold gui=bold guifg=#B8A9C9

" }}}

" PLUGIN: Others {{{
"
" vim-lastplace
" buffer types to ignore
let g:lastplace_ignore_buftype = "quickfix,nofile,help"
" closed folds are automatically opened when jumping to the last edit position
" let g:lastplace_open_folds = 0

" vim-smooth-scroll : 의외로 쓸모 있음
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 20, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 20, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 20, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 20, 4)<CR>

" " NERDTree
" let NERDTreeQuitOnOpen=1                            " automatically close tree after file is opened from it
" let NERDTreeNaturalSort=1                           " sort files with numbers natuarlly
" let NERDTreeShowHidden=1                            " show hidden files by default
" let NERDTreeMinimalUI=1                             " minimal UI, do not show bookmars and help blocksk
" let NERDTreeWinSize=40                              " increase tree explorer split ( default is 31 )
" let NERDTreeAutoDeleteBuffer=1                      " automatically delete buffer when file is deleted from the tree explorer

" noremap  <leader>ne :NERDTreeToggle<CR>
" nnoremap <leader>nf :NERDTreeFind<CR>

" " Open and preview in splits
" let g:NERDTreeMapOpenSplit="s"
" let g:NERDTreeMapPreviewSplit="S"
" let g:NERDTreeMapOpenVSplit="v"
" let g:NERDTreeMapPreviewVSplit="V"

" " Open and preview in current window
" let g:NERDTreeMapActivateNode="o"
" let g:NERDTreeMapPreview="O"

" " Do not show '.git' directories, in addition to what specified in .gitignore
" let NERDTreeIgnore=['\~$', '^\.git$[[dir]]']

" " Tweak status line, so it shortens path if it's under HOME directory
" let g:NERDTreeStatusline="%{exists('b:NERDTree')? fnamemodify(b:NERDTree.root.path.str(), ':p:~') :''}"

" vim-auto-save
" enable autosave on vim startup
let g:auto_save = 1
let g:auto_save_events=["InsertLeave", "TextChanged"]

" Calendar-vim
let g:calendar_datetime = 'statusline'
let g:calendar_number_of_months = 5
let g:calendar_diary=$HOME.'/Sync/wiki/diary'
let g:calendar_wruler = '일 월 화 수 목 금 토'
let g:calendar_monday = 1

" startify
let g:startify_custom_header = [
  \ '   ____  _ _ _                      _   _         ____  _         _ _     _      ',
  \ '  / ___|(_) | |__   ___  _   _  ___| |_| |_ ___  / ___|| |_ _   _| (_)___| |_    ',
  \ '  \___ \| | |  _ \ / _ \| | | |/ _ \ __| __/ _ \ \___ \| __| | | | | / __| __|   ',
  \ '   ___) | | | | | | (_) | |_| |  __/ |_| ||  __/  ___) | |_| |_| | | \__ \ |_    ',
  \ '  |____/|_|_|_| |_|\___/ \__,_|\___|\__|\__\___| |____/ \__|\__, |_|_|___/\__|   ',
  \ '                                                             |___/               ',
  \ '                                                                                 ',
  \ '               __  __       ____        _   _   _                                ',
  \ '               \ \/ /_   _ |  _ \  ___ (_) | | | | _   _   __ _  _ __    __ _    ',
  \ '                \  /| | | || |_) |/ _ \| | | |_| || | | | / _` || `_ \  / _` |   ',
  \ '                /  \| |_| ||  __/|  __/| | |  _  || |_| || (_| || | | || (_| |   ',
  \ '               /_/\_\\__,_||_|    \___||_| |_| |_| \__,_| \__,_||_| |_| \__, |   ',
  \ '                                                                        |___/    ',
  \ ]

" 'most recent files' number
let g:startify_files_number = 15
let g:startify_session_persistence = 1
let g:startify_lists = [
  \ { 'type': 'files',        'header': ['    Recent Files'] },
  \ { 'type': 'dir',          'header': ['    Recent Files '. getcwd()] },
  \ { 'type': 'sessions',     'header': ['    Saved Sessions'] },
  \ { 'type': 'bookmarks',    'header': ['    Bookmarks'] },
  \ ]

function! s:sy_add_bookmark(bookmark)
  if !exists('g:startify_bookmarks')
    let g:startify_bookmarks = []
  endif
  let g:startify_bookmarks += [ a:bookmark ]
endfunction

command! -nargs=1 StartifyAddBookmark call <sid>sy_add_bookmark(<q-args>)

" lightline
" let g:lightline = { 'colorscheme': 'wombat' }
" displaty brach infomration
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

" gitgutter
let g:gitgutter_terminal_reports_focus = 0
" Disable folding in "junegunn/gv.vim" plugin buffers
au FileType GV set nofoldenable
augroup END

" fugitive
" View GIT index window
nnoremap <silent> <leader>gs :Gstatus<CR>

" Use <leader>ge to return to working tree version from blob, blame, log
nnoremap <silent> <leader>ge :Gedit<CR>

" Undo changes in working tree
" nnoremap <silent> <leader>gu :Git checkout HEAD -- %:p<CR>
nnoremap <silent> <leader>gu :Gread<CR>
xnoremap <silent> <leader>gu :Gread<CR>

" Commit changes
nnoremap <silent> <leader>gca :Gcommit --all --verbose<CR>
nnoremap <silent> <leader>gcf :Gcommit --amend --reuse-message HEAD<CR>
nnoremap <silent> <leader>gcf :Gcommit --amend --verbose<CR>

" Diff working tree vs index vs HEAD
nnoremap <silent> <leader>gdw :Gdiff<CR>
nnoremap <silent> <leader>gdh :Gdiff HEAD<CR>
nnoremap <silent> <leader>gdi :Gdiff --cached HEAD<CR>

" gla, gva, list (a)ll commits
nnoremap <silent> <leader>gla :Commits<CR>
nnoremap <silent> <leader>gva :GV<CR>

" glf, gvf, list commits touching current (f)ile
nnoremap <silent> <leader>glf :BCommits<CR>
nnoremap <silent> <leader>gvf :GV!<CR>
xnoremap <silent> <leader>gvf :GV<CR>

" gls, gvs, list commits touching current file, but show file revisions or (s)napshots (populates quickfix list)
nnoremap <silent> <leader>gls :silent! Glog<CR><C-l>
nnoremap <silent> <leader>gvs :GV?<CR>

" glF, list commits touching current file, show full commit objects (using vim-fugitive)
nnoremap <silent> <leader>glF :silent! Glog -- %<CR><C-l>

" Change branch
nnoremap <silent> <leader>gco :Git checkout<Space>

" using tagbar with markdown/vimwiki
" let g:tagbar_type_markdown = {
"     \ 'ctagstype' : 'markdown',
"     \ 'kinds' : [
"             \ 'h:Heading_L1',
"             \ 'i:Heading_L2',
"             \ 'k:Heading_L3'
"         \ ],
"     \ "sort" : 0
" \ }

" https://johngrib.github.io/wiki/vim-tagbar-with-markdown/
let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
            \ 'h:headings',
            \ 'l:links',
            \ 'i:images'
        \ ],
    \ "sort" : 0
\ }

let g:tagbar_type_vimwiki = {
    \ 'ctagstype' : 'vimwiki',
    \ 'sort': 0,
    \ 'kinds' : [
            \ 'h:headings',
    \ ]
\ }

nnoremap <silent> <leader>tbo  :TabgarToggle<CR>

" tagbar 활용을 위한 ~/.ctags 파일 구성
" ctags를 설치해야 함
" --langdef=vimwiki
" --langmap=vimwiki:.wiki
" --regex-vimwiki=/^=[ \t]+(.+)[ \t]+=$/\1/h,header/
" --regex-vimwiki=/^==[ \t]+(.+)[ \t]+==$/. \1/h,header/
" --regex-vimwiki=/^===[ \t]+(.+)[ \t]+===$/.   \1/h,header/
" --regex-vimwiki=/^====[ \t]+(.+)[ \t]+====$/.     \1/h,header/
" --regex-vimwiki=/^=====[ \t]+(.+)[ \t]+=====$/.       \1/h,header/
" --regex-vimwiki=/^======[ \t]+(.+)[ \t]+======$/.         \1/h,header/

" --langdef=markdown
" --langmap=markdown:.md
" --regex-markdown=/^(#+)[ \t]+([^#]*)/\1 \2/h,header,Markdown Headers/
" --regex-markdown=/\[([^\[]+)\]\(([^\)]+)\)/\1/l,link,Markdown Links/
" --regex-markdown=/!\[\]\(.*[\/ ](.*\.[a-z]{3})\)/\1/i,image,Markdown Image/

" tagbar 활용을 위한 python3 script - 사용하지 않음
" let g:tagbar_type_vimwiki = {
" 	\   'ctagstype':'vimwiki'
" 	\ , 'kinds':['h:header']
" 	\ , 'sro':'&&&'
" 	\ , 'kind2scope':{'h':'header'}
" 	\ , 'sort':0
" 	\ , 'ctagsbin':'/usr/local/bin/vwtags.py'
" 	\ , 'ctagsargs': 'default'
"   \ }

" youcompleteme black list 해제
let g:ycm_filetype_blacklist = {}

" }}}

" 자동완성 기능 활용 {{{

" 눈성형 관련 시술 
iabbr des         Double Eyelidplasty
iabbr 쌍꺼풀수술  Double Eyelidplasty
iabbr ㅆㄲㅍ      Double Eyelidplasty
iabbr 앞트임수술  Medial Epicanthoplasty
iabbr ub          Upper Blepharoplasty
iabbr 상안검수술  Upper Blepharoplasty
iabbr lb          Lower Blepharoplasty
iabbr 하안검수술  Lower Blepharoplasty
iabbr mepi        Medial Epicanthoplasty
iabbr 뒷트임      Lateral Epicanthoplasty
iabbr lepi        Lateral Epicanthoplasty

" 코성형 관련 시술
iabbr 융비술      Augmentation Rhinoplasty
iabbr 매부리제거  Hump Reduction
iabbr 비익축소    Nasal Alar Reduction
iabbr 귀연골      Concha Cartilage
iabbr 비중격      Nasal Septum
iabbr 늑연골      Costal Cartilage
iabbr 인공늑연골  Demineralized Bone
iabbr 동종늑연골  Alloo-Rib Cartilage Graft

" 가슴성형 관련 시술
iabbr 유방확대    Augmentation Mammoplasty
iabbr 가슴확대    Augmentation Mammoplasty
iabbr 유방축소    Reduction Mammoplasty
iabbr 가슴축소    Reduction Mammoplasty

" 안면 거상 및 지방 이식
iabbr 안면거상    Facelift
iabbr 이마거상    Forehead Lift
iabbr 목거상      Neck Lift

" 지방 흡입/이식 및 body contouring
iabbr 지방흡입    Liposuction
iabbr 복부성형    Abdominoplasty
iabbr 지방이식    Fat Graft

" 기타
iabbr 귀족수술    Perinasal Augmentation
iabbr 앞턱수술    Genioplasty

" 단축어
iabbr augm        Augmentation
iabbr redu        Reduction
iabbr medi        Medial
iabbr late        Lateral
iabbr epic        Epicanthoplasty
iabbr endo        Endoscopic
iabbr revi        Revision
iabbr rhin        Rhinoplasty
iabbr mamm        Mammoplasty
iabbr fatg        Fat Graft
iabbr lipo        Liposuction

iabbr <expr> _date         strftime('%Y-%m-%d')：
iabbr <expr> _time         strftime('%H:%M:%S')
iabbr <expr> _dtime        strftime('%Y-%m-%d %H:%M:%S')

" 직원
iabbr ywy         闫文云医生
iabbr yanwenyun   闫文云医生
"iabbr 얜원윈      闫文云医生
iabbr sbx         史冰心主任
iabbr shibingxin  史冰心主任
iabbr 상담실장    咨询医生
iabbr 왕링        王玲
iabbr wangling    王玲
iabbr 왕징        王静
iabbr wangjing    王静
iabbr 장위에      张悦
iabbr zhangyue    张悦
iabbr 란롱롱      兰蓉蓉
iabbr lanrongrong 兰蓉蓉
iabbr 란자오시아  兰朝霞
iabbr lanzhaoxia  兰朝霞
iabbr 통역        兰朝霞
" }}}


