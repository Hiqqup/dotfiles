cd $HOME/dotfiles
cp -r $HOME/.config/nvim/ home/.config
cp  $HOME/.bashrc home
cp  $HOME/.gitconfig home
cp  $HOME/.config/tmux/tmux.conf home/.config/tmux
cp  $HOME/.suckless/dwm/config.h home/.suckless/dwm
cp  $HOME/.suckless/st/config.h home/.suckless/st
cp  -r $HOME/.suckless/dwm/patches home/.suckless/dwm
cp  -r $HOME/.suckless/st/patches home/.suckless/st
cp -r $HOME/.config/X11 home/.config
cp -r $HOME/.config/neofetch home/.config
cp -r $HOME/.config/my-scripts home/.config
cp -r $HOME/.dwm home/
cp -r /etc/X11/xorg.conf.d root/X11/
cp /etc/profile.d/startx.sh root/etc/profile.d
