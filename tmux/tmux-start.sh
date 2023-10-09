#!/bin/bash

session="$(basename "$PWD")"
tmux new-session -d -s "$session"

window=0
tmux rename-window -t "$session:$window" "nvim"
tmux send-keys -t "$session:$window" "clear" C-m "nvim" C-m

# Check if it is a Git directory
if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  window=1
  tmux new-window -t "$session:$window" -n "git"
  tmux send-keys -t "$session:$window" "lazygit" C-m
fi

tmux select-window -t "$session:0"
tmux attach-session -t "$session"

