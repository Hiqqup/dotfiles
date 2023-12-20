alias config='$HOME/dotfiles/config.sh'
alias vim='nvim'
alias vi='/bin/vim'
alias leetcode='source $HOME/.config/my-scripts/leetcode/leetcode-c.sh'
alias donut='~/.config/my-scripts/donut'
alias xournal='~/.config/xournalpp/xournalpp.sh'
alias neofetch='neofetch --ascii_distro Ubuntu'


#some other change
HISTSIZE=HISTFILESIZE=
#vi mode and cursor
set -o vi
echo -ne '\e[6 q'

shopt -s autocd
export VISUAL=nvim
export EDITOR=nvim

#case insensitive autocompletion and vim cursor
if [ ! -a ~/.inputrc ]; then 
    echo '$include /etc/inputrc' >> ~/.inputrc
    echo 'set completion-ignore-case On' >> ~/.inputrc
    echo 'set editing-mode vi' >> ~/.inputrc
    echo 'set show-mode-in-prompt on' >> ~/.inputrc
    echo 'set vi-ins-mode-string \1\e[6 q\2' >> ~/.inputrc
    echo 'set vi-cmd-mode-string \1\e[2 q\2' >> ~/.inputrc
fi

#lscolor
export LS_OPTIONS='--color=auto'
eval "$(dircolors -b)"
alias ls='ls $LS_OPTIONS'

source ~/.config/my-scripts/git-bashrc

export PS1="\[\e[32m\]\`parse_git_branch\`\[\e[m\]\[\e[34m\]\w\[\e[m\] "

