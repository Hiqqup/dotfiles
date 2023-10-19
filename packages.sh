sudo pacman -S xorg-xinit xorg-server neovim feh xclip xdotool fzf tmux keepassxc ttf-jetbrains-mono-nerd xorg-xrandr xf86-input-wacom ripgrep syncthing alsa-utils openssh htop unzip xorg-xbacklight acpi scrot xournalpp zathura-pdf-mupdf man-db cmake npm

#suckless
cd ~/.suckless/dwm
sudo make clean install
cd ~/.suckless/st
sudo make clean install
cd ~/.suckless/dmenu
sudo make clean install
#uni stuff gotta add the latex stuff all of it
sudo pacman -S svn jre17-openjdk jdk17-openjdk texlive

