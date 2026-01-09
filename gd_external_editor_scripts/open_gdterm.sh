#!/bin/bash
FILE=$1
LINE=$2
COL=$3
TITLE="gdterm"
if ! wmctrl -l | grep -q "$TITLE"; then
    xfce4-terminal \
        --title="$TITLE" \
        --hold \
        --font="Monospace 15" \
        --command 'vim --listen /tmp/gd' \
        --geometry 112x25+280+140
fi
vim --server /tmp/gd --remote-send "<C-\><C-N>:n $FILE<CR>${LINE}G$COL|"
wmctrl -a "$TITLE"
