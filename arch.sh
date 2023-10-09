: '

requirement git 
pull down the repo via https
mkdir ~/.config/X11
#xauth
#run packages as sudo
#install nvm and node for lsps
'
cd ~/dotfiles/
cp -r home/.* ~
sudo -r cp root/* /

#Arch installd dependencies
#setup yay
cd /tmp
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd 

yay -S brave-bin dracula-gtk-theme dracula-rofi-git #as i said picom
#gotta look into picom later

