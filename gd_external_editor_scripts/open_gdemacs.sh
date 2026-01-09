#!/bin/bash
FILE=$1
LINE=$2
COL=$3
TITLE="gdEmacs"  # Name for window manager focus

# Start Emacs daemon if not already running
if ! emacsclient -e '(emacs-pid)' &>/dev/null; then
    emacs --daemon
fi

# Start GUI client if not already running
if ! wmctrl -l | grep -q "$TITLE"; then
    emacsclient -c -n --eval "
    (let ((f (selected-frame)))
      (set-frame-parameter f 'name \"$TITLE\")
      (set-frame-position f 280 140)
      (set-frame-size f 112 25))
    "
fi
emacsclient -n --eval "
(progn
  (select-frame-by-name \"$TITLE\")
  (find-file \"$FILE\")
  (goto-char (point-min))
  (forward-line (1- $LINE))
  (move-to-column $COLUMN))
"


wmctrl -a "$TITLE"
