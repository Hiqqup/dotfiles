if [ "$(tty)" = "/dev/tty1" ]; then
startx $HOME/.config/X11/xinitrc.sh > /dev/null 2>&1
fi
