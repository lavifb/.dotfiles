#!/bin/bash
# script to make the tmux layout
# doesn't really work right now though...

# tmux new-session -s lay1
tmux splitw -t 0 -h -p 35
tmux splitw -v -p 70
tmux splitw -v -p 50
tmux selectp -t 0
tmux splitw -t 0 -v -p 35
