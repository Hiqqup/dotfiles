alias config='$HOME/dotfiles/config.sh'
alias vim='nvim'
alias leetcode='source $HOME/.config/my-scripts/leetcode/leetcode-time.sh'
alias leetcodec='source $HOME/.config/my-scripts/leetcode/leetcode-c.sh'
alias draw='$HOME/.config/my-scripts/draw/lets-draw.sh'
alias startx='startx ~/.config/X11/xinitrc.sh'
alias donut='~/.config/my-scripts/donut'
alias latexHw='~/.config/my-scripts/latex/latex-hw.sh'
alias xmodmap='xmodmap ~/.config/X11/Xmodmap'
alias maptohdmi='xrandr --output HDMI2 --auto && xmodmap'
alias mdToPdf='~/.config/my-scripts/latex/mdToPdf.sh'
alias cdHw='source ~/hw/scripts/cd-current-week.sh'


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

#lscolors
export LS_OPTIONS='--color=auto'
eval "$(dircolors -b)"
alias ls='ls $LS_OPTIONS'

export FZF_DEFAULT_OPTS='--color=fg:#f8f8f2,hl:#bd93f9 --color=fg+:#f8f8f2,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'

export PS1="\[\e[32m\]\`parse_git_branch\`\[\e[m\]\[\e[34m\]\w\[\e[m\] "




#### only git stuff from here on
# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "[${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

