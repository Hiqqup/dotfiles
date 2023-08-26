: '

requirement git 
pull down the repo via https
mkdir ~/.config/X11
#xauth
'
cd ~/dotfiles/home
cp -ru . ~

#Arch installd dependencies
pacman -S xorg-xinit xorg-server awesome alacritty neovim feh rofi xclip xdotools fzf tmux keepassxc
#setup yay
cd /tmp
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd 

yay -S xdotool brave-bin #as i said picom
#gotta look into picom later
