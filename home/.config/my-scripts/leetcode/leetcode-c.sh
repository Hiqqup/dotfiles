#!/bin/bash
if [ $# -eq 0 ]
then
    echo "No arguments supplied"
else
    cd ~/projects/.leetcode/c
    mkdir $1
    cd $1 
    #draw thoughts &
    touch main.c
    tmux split-window -h -p 33 
    tmux send-keys -t 2 "gcc main.c && ./a.out" 
    tmux select-pane -t 1
    nvim main.c
fi
