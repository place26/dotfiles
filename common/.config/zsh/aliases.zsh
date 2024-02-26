#!/bin/zsh

######### Alias ##########
alias cl='clear'
alias l='ls -A -l -h --color=auto' # All file except . and .., list view, display unit suffix for the size
alias weather="curl 'https://wttr.in'"

# For MacOS show/hide hidden files
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
alias rmds='fd -H '^\.DS_Store$' -tf -X rm'
alias ll='lsd -ASX1hl --group-dirs=first --icon auto'
alias ld='lsd -tXh1l --git --icon auto'

# 편집을 원하는 파일을 fd/fzf를 활용해 홈을 기준으로 검색 후 불러오기, 다중선택 지원
alias vimfd="fd -tf -H -E Library -E Pictures  . '/Users/xupei' | fzf -m --preview 'bat -n color=always {}' --preview-window 'right,60%' --bind 'enter:become(vim {+})' --bind 'ctrl-/:change-preview-window(right,90%|down,60%,border-horizontal|hidden|)'"

# 성형외과 환자기록 : pspage - enter pages 오픈, 시술날짜 : psdate - enter키 finder 오픈
alias pspage="fd -td -e pages --follow  . '/Users/xupei/Library/Mobile Documents/com~apple~CloudDocs/Share' | fzf --preview-window=:hidden --bind 'enter:become(open {})'"
alias psdate="fd --follow  --regex '[a-zA-Z]+_[a-zA-Z]+(\(.*?\)|（.*?）)' -td . '/Users/xupei/PS'| fzf --preview 'tree -L 1 -C {}' --header '결과는 최초시술 날짜를 기준으로 리스트되어 있습니다. enter 폴더로 이동합니다.' --preview-window 'right,40%' --bind 'enter:become(open {})'"

# Macpro specific
alias syncbackup="~/backup_script/backup_sync.sh"
alias showshots="~/backup_script/showshots"
alias reversecom+="ssh -L 8484:localhost:8384 com+deliver"

# These personal aliases require various other env var from .zshrc
alias l1="cd \"$CACHE_DIR\""
alias dw="vim \"${DAILY_WRITING_DIR}/index.md\""
alias dot="cd \"$DOT_DIR\""

########## Small Functions ##########

mkcd() { mkdir -p $1; cd $1 }

# keybingd for fzf : 흔히 필요로하는 기능을 keybinding을 통해 할당
# # MacOS에서 ALT키를 사용하기 위해서는 iterm에서 preferences>profiles>keys에서 왼쪽 Option key에 대해 Esc+로 설정해야 함
bindkey '^[d' cd_with_fzf
bindkey '^o'  open_with_fzf
bindkey '^[p' open_ps_fzf
bindkey '^[o' open_pages_fzf
# Ctrl-t를 사용하여 folder와 file 선택가능 - 검색만 가능 
bindkey '^[v' run_fzf_fd

run_fzf_fd() {
  fd --type file |
    fzf --prompt 'Files> ' \
        --header 'CTRL-T: Switch between Files/Directories, CTRL-Y: Copy Selected' \
        --bind 'ctrl-t:transform:[[ ! {fzf:prompt} =~ Files ]] &&
                  echo "change-prompt(Files> )+reload(fd --type file)" ||
                  echo "change-prompt(Directories> )+reload(fd --type directory)"'
        --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
}

# exclude 폴더 설정
export Exclude_Folders="-E Library -E Pictures -E Applications -E Movies -E Music -E *.tar.gz -E *.tar -E PS -E *.pages"

# 별로 사용하지 않는 기능, fzf에서 기본적으로 ALT_C 조합을 지원하나 하위 폴더만을 검색 
# # ALT_D는 우선 홈으로 이동 후 검색
cd_with_fzf() {
    cd $HOME && cd "$(fd -t d -H -E Library | fzf --preview="tree -L 1 {}" --bind="space:toggle-preview" --preview-window=:hidden)" && echo "$PWD" && tree -L 2
}

# fzf과 bat을 이용해 파일 내용을 미리 보고 open할 수 있는 기능
# --search-path 옵션 추가
open_with_fzf() {
    # Documents, Sync 폴더 검색 bat 활용, obsidian fd 참조
    # -a = --absolut-path
    cd $HOME && fd -a -tf -H $Exclude_Folders | fzf -m --preview='bat --style=numbers --color=always {}' --preview-window=right:70%:wrap --bind='enter:execute(vim {+} < /dev/tty)'
}

# 아래 두가지 중 환경에 맞게 사용
# ALT_P키로 환자의 이름이나 촬영날짜에 해당하는 폴더로 이동이 가능
# 폴더에서 Finder를 열려면 open . 명형어를 입력
# 검색된 해당폴더로 이동을 위해 미리 huahan 폴더로 이동
# MacPro
# open_ps_fzf() {
#     # cd /Volumes/12THDD/huahan/ && fd -t d -E 'SynologyDrive' | fzf --preview="tree -L 1 {}" --bind="space:toggle-preview" --preview-window=:hidden --bind='enter:execute(imgcat {+} < /dev/tty)'
#     cd /Volumes/12THDD/huahan/ && cd "$(fd -t d -E 'SynologyDrive' | fzf --preview="tree -L 1 {}" --bind="space:toggle-preview" --preview-window=:hidden)" && echo "$PWD" && tree -L 2
# }

# mb16
open_ps_fzf() {
    cd /Users/xupei/PS/ && cd "$(fd -td | fzf --preview="tree -L 1 {}" --bind="space:toggle-preview" --preview-window=:hidden)" 2>&-
}

# iCloud/Share에서 공유되고 있는 환자 수술/치료기록 파일을 검색하여 pages로 열기
open_pages_fzf() {
    cd /Users/xupei/Library/Mobile\ Documents/com~apple~CloudDocs/Share && open "$( fd -td --extension pages | fzf --preview-window=:hidden )"
}

zle -N cd_with_fzf
zle -N open_with_fzf
zle -N open_ps_fzf
zle -N open_pages_fzf
zle -N run_fzf_fd
