#!/bin/bash
FILE=$1
LINE=$2
COL=$3
TITLE="gdneovide"
if ! wmctrl -l | grep -q "$TITLE"; then
	rm /tmp/gd
	/nix/var/nix/profiles/default/bin/nix-shell\
		~/Documents/dotfiles/nix-shell/neovide.nix \
		--run 'neovide --size  1350x600 --frame none -- -c "\
		set title |\
		set titlestring='$TITLE'\
		" --listen /tmp/gd'
fi
nvim --server /tmp/gd --remote-send "<C-\><C-N>:n $FILE<CR>${LINE}G$COL|"
wmctrl -a "$TITLE"

