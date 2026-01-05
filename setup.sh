
DOTFILES_DIR=$HOME/Documents/dotfiles
CONFIG_DIR=$HOME/.config

#rm -r $CONFIG_DIR/nvim
#ln -s $DOTFILES_DIR/nvim $CONFIG_DIR
#rm -fr $CONFIG_DIR/tmux
#mkdir -p $CONFIG_DIR/tmux
#ln -s $DOTFILES_DIR/tmux.conf $CONFIG_DIR/tmux
rm -fr $HOME/.emacs.d
ln -s $DOTFILES_DIR/.emacs.d $HOME
#rm $HOME/.bashrc
#ln -s $DOTFILES_DIR/.bashrc $HOME

