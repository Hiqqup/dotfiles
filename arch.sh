#Arch installd dependencies
#setup yay
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://git.suckless.org/dwm ~/.suckless/dwm
git clone https://git.suckless.org/st ~/.suckless/st
git clone https://git.suckless.org/dmenu ~/.suckless/dmenu
cd /tmp
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd 

yay -S brave-bin dracula-gtk-theme dracula-rofi-git #as i said picom
#gotta look into picom later

