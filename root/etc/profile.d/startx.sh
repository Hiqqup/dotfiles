if [ "$(tty)" = "/dev/tty1" ]; then
startx $HOME/.config/X11/xinitrc > /dev/null 2>&1
fi
