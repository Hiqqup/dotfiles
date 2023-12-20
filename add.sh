cd $HOME/dotfiles
mkdir -p home/.config/tmux
mkdir -p root/etc/keyd
cp -r $HOME/.config/nvim/ home/.config
cp  $HOME/.bashrc home
cp  $HOME/.gitconfig home
cp  $HOME/.config/tmux/tmux.conf home/.config/tmux
cp -r $HOME/.config/foot home/.config/
cp -r $HOME/.config/xournalpp home/.config/
cp -r $HOME/.config/zathura home/.config
cp -r $HOME/.config/my-scripts home/.config
cp -r $HOME/.config/sway home/.config
cp /etc/keyd/default.conf root/etc/keyd/default.conf
cp /etc/sudoers root/etc/sudoers
pacman -Qe > packages
