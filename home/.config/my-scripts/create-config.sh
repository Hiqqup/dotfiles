#!/bin/bash
# Start a new session named "config" without any windows
tmux new-session -d -s config -n ".config" -c "$HOME/.config"
#old config
# Create windows and run commands
#tmux send-keys -t config:1 "cd $HOME/.config" C-m
#tmux new-window -t config: -n "awesome" -c "$HOME/.config/awesome"
#tmux send-keys -t config:2 "vim ." C-m
#tmux new-window -t config: -n "nvim" -c "$HOME/.config/nvim"
#tmux send-keys -t config:3 "vim ." C-m
#tmux new-window -t config: -n "tmux" -c "$HOME/.config/tmux"
#tmux send-keys -t config:4 "vim tmux.conf" C-m
#tmux new-window -t config: -n "bashrc" -c "$HOME"
#tmux send-keys -t config:5 "vim .bashrc" C-m
#tmux new-window -t config: -n "dotfiles" -c "$HOME/dotfiles"
#tmux send-keys -t config:6 "vim ." C-m
