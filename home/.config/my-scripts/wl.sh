~/.config/my-scripts/status/status-loop-wl.sh &


if ! pgrep -x "ydotoold" > /dev/null
then
    sudo ydotoold -p /run/user/1000/.ydotool_socket -P 0666 &
fi

#dwl -s ' &&'&

dwl -s '
foot ~/.config/my-scripts/start-the-fun.sh &
firefox &
dwlb -center-title -custom-title -font "JetBrainsMonoNLNerdFont:size=15" -active-fg-color  ffffff -occupied-fg-color ffffff -inactive-fg-color ffffff -urgent-fg-color ffffff -occupied-bg-color 000000 -inactive-bg-color 000000 -urgent-bg-color   ff5555 -active-bg-color   bd93f9 -middle-bg-color  ff5555 -middle-bg-color-selected 000000'




