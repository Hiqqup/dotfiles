#!/bin/bash

cd ~/5head
git add .
if [ "$1" = "-m" ]; then
  git commit
else
  git commit -m $(date +'%d-%m-%Y-%H:%M:%S')
fi
git push
syncthing
