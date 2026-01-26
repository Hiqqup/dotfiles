#!/bin/bash
FILE=$1
LINE=$2
COL=$3
TITLE="gdneovide"
if ! wmctrl -l | grep -q "$TITLE"; then
	neovide  --size  1350x600 --frame none -- -c "\
		set title |\
		set titlestring=$TITLE|\
		let g:neovide_cursor_animation_length = 0|\
		let g:neovide_cursor_trail_size = 0\
	" --listen /tmp/gd
fi
nvim --server /tmp/gd --remote-send "<C-\><C-N>:n $FILE<CR>${LINE}G$COL|"
wmctrl -a "$TITLE"

