#!/bin/bash 

# 세션 이름 설정
SESSION_NAME="mySession"

# 새로운 tmux 세션 생성, 세션 이름 지정
tmux new-session -d -s $SESSION_NAME

# 첫 번째 분할 생성, 전체 공간의 35% 차지
tmux split-window -h -p 65

# 오른쪽 팬 선택
tmux select-pane -t 2

# 두 번째 분할 생성, 남은 공간의 약 30% 차지 (전체 공간 대비 약 15%)
tmux split-window -h -p 10


tmux select-pane -t 1
tmux split-window -v -p 80

# 오른쪽 위 팬으로 이동 (0부터 시작하므로 2번 팬)
tmux select-pane -t 1

# 'hotkey' 파일을 vim으로 열기
tmux send-keys 'vim /Users/xupei/Sync/dotfiles/common/.config/tmux/tmux.conf' C-m

# 세션에 첫 번째 창(왼쪽 창)으로 다시 연결
tmux select-window -t mySession:0
tmux select-pane -t 2

# tmux 세션에 연결
tmux attach-session -t mySession
#
