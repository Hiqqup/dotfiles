alias startwl='$HOME/.config/my-scripts/wl.sh'
alias config='$HOME/dotfiles/config.sh'
alias vim='nvim'
alias ogvim='/bin/vim'
alias vimNoFormat='nvim +"set eventignore=BufWritePre"'
alias leetcode='source $HOME/.config/my-scripts/leetcode/leetcode-time.sh'
alias leetcodec='source $HOME/.config/my-scripts/leetcode/leetcode-c.sh'
alias draw='$HOME/.config/my-scripts/draw/lets-draw.sh'
alias startx='startx ~/.config/X11/xinitrc.sh'
alias donut='~/.config/my-scripts/donut'
alias latexHw='~/.config/my-scripts/latex/latex-hw.sh'
alias xmodmap='xmodmap ~/.config/X11/Xmodmap'
alias maptohdmi='xrandr --output HDMI2 --auto'
alias mdToPdf='~/.config/my-scripts/latex/mdToPdf.sh'
alias flipTablet='xsetwacom set "$(xsetwacom list devices | grep STYLUS | awk '\''{print $9}'\'')" Rotate 3'
#pabs stuff
alias cdHw='source ~/hw/scripts/cd-current-week.sh'
alias pabs-mkdir='source ~/hw/scripts/mkdir-java.sh'
alias pabs-touch='source ~/hw/scripts/touch-java.sh'
#alias to pipe into x clipboard
#alias clip='xclip -sel c'
alias xournal='~/.config/xournalpp/xournalpp.sh'

alias neofetchm='neofetch --ascii_distro linuxmint'


# dont look there is some unholy emacs goin on
export PATH="$HOME/.config/emacs/bin:$PATH"


alias emacsServer="emacs --daemon"
alias e="emacsclient -c -a 'nvim'"

#ill go to hell for this probably
#some other change
HISTSIZE=HISTFILESIZE=
#vi mode and cursor
set -o vi
echo -ne '\e[6 q'

shopt -s autocd
export VISUAL=nvim
export EDITOR=nvim
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash

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

export FZF_DEFAULT_OPTS='--color=fg:#f8f8f2,hl:#bd93f9 --color=fg+:#f8f8f2,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'
source ~/.config/my-scripts/git-bashrc

export PS1="\[\e[32m\]\`parse_git_branch\`\[\e[m\]\[\e[34m\]\w\[\e[m\] "

. "$HOME/.cargo/env"
