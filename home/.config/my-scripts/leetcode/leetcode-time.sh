#!/bin/bash
if [ $# -eq 0 ]
then
    echo "No arguments supplied"
else
    cd ~/leetcode/js/
    mkdir $1
    cd $1 
    #draw thoughts &
    touch index.js
    tmux split-window -h -p 25 -d bun --watch index.js
    nvim index.js
fi
