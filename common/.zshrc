[[ $TMUX = "" ]] && export TERM="xterm-256color"

# zsh prompt
# Personal prompt setting: simplicity is best
# 참조: https://www.youtube.com/watch?v=nEvsWQrKVcQ
# use git status info : git 설치 필요
autoload -Uz vcs_info
precmd() { vcs_info }
precmd_functions+=( precmd_vcs_info )

zstyle ':vcs_info:git:*' formats 'on branch %b '
setopt PROMPT_SUBST

PROMPT='%F{117}%n%f  %F{221}%m%f   %F{038}${PWD/#$HOME/~}%f ${vcs_info_msg_0_}
%{$fg_bold[white]%}>%{$reset_color%} '

# Format the git branch name in the prompt
zstyle ':vcs_info:git:*' formats 'on %F{011} %b%f'

# yubico 키 사용을 위한 설정
# 참고: https://aditsachde.com/posts/yubikey-ssh/
SSH_AUTH_SOCK="~/.ssh/agent"

HISTFILE=~/.histfile
HISTSIZE=20000
SAVEHIST=50000

# vi type key_binding
bindkey -v

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/settings:$HOME/config/:/opt/homebrew/bin:/usr/local/bin:$PATH
export GOROOT=/usr/local/go
# 설정 관리 일원화
export XDG_DATA_HOME=$HOME/.config
export XDG_CONFIG_HOME=$HOME/.config
# 한글 환경을 위한 locale 설정: synologynote/MacOS/Mac에서 Locale 오류 해결법
# LC_ALL=ko_KR.UTR-8로 설정할 경우 모든 시스템 메시지가 한글로 표시 됨
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# keybingd for fzf
bindkey '^f' cd_with_fzf
bindkey '^o' open_with_fzf
bindkey '^[p' open_ps_fzf
bindkey '^[o' open_pages_fzf

cd_with_fzf() {
    cd /users/xupei/ && cd "$(fd -t d -H -E '.*/\.[^.config][^/]*' -E 'Library' -E 'Photos Library.photoslibrary' | fzf --preview="tree -L 1 {}" --bind="space:toggle-preview" --preview-window=:hidden)"
}

open_with_fzf() {
    fd -t f -H -I | fzf -m --preview="bat {}" | open 2>&-
}

# 고객이름으로 해당 directory로 이동, MacPro 기준으로 폴더 지정 함
# open_ps_fzf() {
#     cd /Users/xupei/PS/ && cd "$(fd -t d | fzf --preview="tree -L 1 {}" --bind="space:toggle-preview" --preview-window=:hidden)" && echo "$PWD" && tree -L 1
# }

open_ps_fzf() {
    cd /Users/xupei/PS/ && cd "$(fd -t d | fzf --preview="tree -L 1 {}" --bind="space:toggle-preview" --preview-window=:hidden)" 2>&-

    # if [ "$?" -eq 0 ]; then
    #     echo "$PWD"
    #     tree -L 1

    #     # Prompt to open in Finder
    #     read "?Press 'o' to open in Finder: " -k 1 answer
    #     echo

    #     if [[ "$answer" == "o" ]]; then
    #         open .
    #     fi
    # fi
}

open_pages_fzf() {
    cd /Users/xupei/Library/Mobile\ Documents/com~apple~CloudDocs/Share && open "$(fd -td | fzf )"
}

zle -N cd_with_fzf
zle -N open_with_fzf
zle -N open_ps_fzf
zle -N open_pages_fzf

# --------------#
# fzf 관련 설정 #
# --------------#
export FD_OPTIONS="--follow --hidden --exclude .git --exclude Library --exclude node_modules --ignore-file .gitignore"
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix -H --follow -E .git -E .DS_Store'
export FZF_DEFAULT_OPTS="--height 60% --layout reverse --info inline --border \
    --preview 'bat -n --color=always {}' --preview-window up,15,border-horizontal \
    --bind 'ctrl-/:change-preview-window(80%|hidden|)'"

# OPTION_C : cd into the selected directory - 매우 유용한 기능
# MacOS에서 ALT_C를 이용하기 위해서는 iTerm 옵션 수정해야 함
# iTerm>Preferences>Profiles>Keys>General>Left Option Key --> Esc+ 선택
export FZF_ALT_C_COMMAND="fd --type d $FD_OPTIONS"
# Print tree structure in the preview window
export FZF_ALT_C_OPTS="--preview 'tree -C {}'"

# Preview file content using bat (https://github.com/sharkdp/bat)
# preview windwos : 위쪽, 15 라인, horizontal
export FZF_CTRL_T_COMMAND="fd $FD_DEFAULT_OPTS"
export FZF_CTRL_T_OPTS="
  --preview 'bat -n --color=always {}'
  --preview-window up,15,border-horizontal
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

# CTRL-/ to toggle small preview window to see the full command
# CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window up:1:hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"

# Use ~~ as the trigger sequence instead of the default **
export FZF_COMPLETION_TRIGGER='~~'

# If you're on a tmux session, you can start fzf in a tmux split-pane or in a tmux popup window by setting FZF_TMUX_OPTS (e.g. export FZF_TMUX_OPTS='-p80%,60%'). See fzf-tmux --help for available options.
export FZF_TMUX_OPTS='-p80%,60%'

# Options to fzf command
export FZF_COMPLETION_OPTS='+c -x'

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
# --hidden : include hidden files, --follow : follow sym link, --exclude : exclude directory
_fzf_compgen_path() {
  fd --hidden --follow --exclude "Library" --exclude "Photos Library.photoslibrary" --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude "Library" --exclude "Photos Library.photoslibrary" --exclude ".git" . "$1"
}

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'tree -C {} | head -200'   "$@" ;;
    export|unset) fzf --preview "eval 'echo \$'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview 'bat -n --color=always {}' "$@" ;;
  esac
}

# bat 관련 설정 : https://github.com/sharkdp/bat
# export BAT_CONFIG_PATH="$HOME/.config/bat/config"
export BAT_PAGER="less -R"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# GnuPG와 관련된 설정, 해당 터미널과 해당 ssh 세션으로 정보창 표시
# .gnupg/gpg-agent.confd에서 pinentry 설정
export GPG_TTY=$(tty)

# 해당 ssh 세션창: https://juliansimioni.com/blog/troubleshooting-gpg-git-commit-signing/
if [[ -n "$SSH_CONNECTION" ]]; then
  export PINENTRY_USER_DATA="USE_CURSES=1"
fi

# For MacOS show/hide hidden files
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
# alias vim=nvim
alias rmds='fd -H '^\.DS_Store$' -tf -X rm'
# alias ll='exa -1lagh --sort modified --sort extension --group-directories-first --icons'
# alias ld='exa -1lgh --sort modified --sort extension --group-directories-first --icons'
# alias ls=exa
alias ll='lsd -ASX1hl --group-dirs=first --icon auto'
alias ld='lsd -tXh1l --git --icon auto'

# wether forecast with curl
alias weather='curl wttr.in/qindao'

export ZSH_CUSTOM=$HOME/Sync/dotfiles/common/.config/zsh
# git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.config/zsh/zsh-autosuggestions
source $ZSH_CUSTOM/zsh-autosuggestions/zsh-autosuggestions.zsh
# git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $HOME/.config/zsh/zsh-autocomplete
# source ~/.config/zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.config/zsh/zsh-syntax-highlighting
source $ZSH_CUSTOM/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(zoxide init zsh)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
