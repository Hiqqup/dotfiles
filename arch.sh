: '

requirement git 
pull down the repo via https
mkdir ~/.config/X11
#xauth
'
cd ~/dotfiles/
cp -r home/.* ~
sudo -r cp root/* /

#Arch installd dependencies
sudo pacman -S xorg-xinit xorg-server awesome alacritty neovim feh rofi xclip xdotool fzf tmux keepassxc ttf-jetbrains-mono-nerd xorg-xrandr xinput xf86-input-wacom
#setup yay
cd /tmp
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd 

yay -S brave-bin dracula-gtk-theme  #as i said picom
#gotta look into picom later
