[[ $TMUX = "" ]] && export TERM="xterm-256color"

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
export PATH=$HOME/.local/bin:/opt/homebrew/bin:/usr/local/bin:$PATH
export GOROOT=/usr/local/go
# 설정 관리 일원화
export XDG_DATA_HOME=$HOME/.config
export XDG_CONFIG_HOME=$HOME/.config
# 한글 환경을 위한 locale 설정: synologynote/MacOS/Mac에서 Locale 오류 해결법
# LC_ALL=ko_KR.UTR-8로 설정할 경우 모든 시스템 메시지가 한글로 표시 됨
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
# wezterm을 위한 환경 설정
export PATH="$PATH:/Applications/WezTerm.app/Contents/MacOS"

# MacMini : gitea를 위한 설정
export GITEA_WORK_DIR=/usr/local/var/gitea/

# Homebrew 관련
export HOMEBREW_SERVICES_NO_DOMAIN_WARNING=1
export HOMEBREW_NO_ENV_HINTS=1


# --------------#
# fzf 관련 설정 #
# --------------#
export FD_OPTIONS="--follow --hidden --exclude .git --exclude Library --exclude node_modules"
export FZF_CTRL_T_COMMAND="fd -tf -H --follow -E .git -E .DS_Store -E Library -E Pictures -E Music -E Applications . '/Users/xupei'"
export FZF_DEFAULT_OPTS="--height 60% --border --info inline --layout reverse
    --preview 'bat -n --color=always {}'
    --bind 'ctrl-/:change-preview-window(right,90%|down,60%,border-horizontal|hidden|)'"

# OPTION_C : cd into the selected directory - 매우 유용한 기능
# MacOS에서 ALT_C를 이용하기 위해서는 iTerm 옵션 수정해야 함
# iTerm>Preferences>Profiles>Keys>General>Left Option Key --> Esc+ 선택
export FZF_ALT_C_COMMAND="fd -td -H --follow -E .git -E node_modules . '/Users/xupei'"
# Print tree structure in the preview window
export FZF_ALT_C_OPTS="--preview 'tree -C {}'"

# Preview file content using bat (https://github.com/sharkdp/bat)
# preview windwos : 위쪽, 15 라인, horizontal
export FZF_CTRL_T_COMMAND="fd -tf -H --follow -E .git -E .DS_Store . '/Users/xupei'"
export FZF_CTRL_T_OPTS="--height 70% --multi --info inline --border --layout reverse
  --preview 'bat -n --color=always {}'
  --preview-window 'right,40%,border-left'
  --header 'Tab - 복수선택'
  --bind 'ctrl-v:become(vim {})'
  --bind 'ctrl-/:change-preview-window(right,90%|down,60%,border-horizontal|hidden|)'"

# CTRL-/ to toggle small preview window to see the full command
# CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window up:1:hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --header '사용한 명령리스트| Press CTRL-Y to copy command into clipboard'"

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

# for vim supporting python3, brew를 사용하여 설치 함
# 맥에서 기본 설치된 vim이 아닌 brew로 설치한 vim을 사용하도록 함
if (command -v brew && brew list --formula | grep -c vim ) > /dev/null 2>&1; then
    alias vim="$(brew --prefix vim)/bin/vim"
fi


export ZSH_CUSTOM=$HOME/Sync/dotfiles/common/.config/zsh
# git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.config/zsh/zsh-autosuggestions
source $ZSH_CUSTOM/zsh-autosuggestions/zsh-autosuggestions.zsh
# git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $HOME/.config/zsh/zsh-autocomplete
# source ~/.config/zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.config/zsh/zsh-syntax-highlighting
source $ZSH_CUSTOM/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source /Users/xupei/Sync/dotfiles/common/.config/zsh/aliases.zsh
eval "$(zoxide init zsh)"
# eval "$(starship init zsh)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
