alias vim='nvim'
alias vimgd='vim --listen /tmp/gd'

alias fltab='xsetwacom set $(xsetwacom --list devices | grep -i stylus | grep -oP "id:\s*\K\d+") Rotate half'
alias neofetch='echo && neofetch  --ascii_distro Windows7  --colors 10 10 10 10 --disable icons theme' 
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

export PS1="\[\e[32m\]\`parse_git_branch\`\[\e[m\]\[\e[34m\]\w\[\e[m\] "

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
