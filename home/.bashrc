alias config='$HOME/dotfiles/config.sh'
alias music='yt-dlp --extract-audio --embed-metadata https://youtu.be/VLtSCBSaCIQ?si=RxCyaijpXklBFLlu'
alias vim='nvim'
alias leetcode='source $HOME/.config/my-scripts/leetcode/leetcode-time.sh'
alias draw='$HOME/.config/my-scripts/draw/lets-draw.sh'
alias startx='startx ~/.config/X11/xinitrc'
alias mvatt='$HOME/.config/my-scripts/mv-to-att.sh'
alias pushnotes='cd ~/5head && git add . && git commit && git push && cd -'

#ill go to hell for this probably
#some other change

HISTSIZE=HISTFILESIZE=
set -o vi
export VISUAL=nvim
export EDITOR=nvim
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash

export FZF_DEFAULT_OPTS='--color=fg:#f8f8f2,hl:#bd93f9 --color=fg+:#f8f8f2,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'

export PS1="\[\e[35m\][\[\e[m\]\[\e[36m\]\A\[\e[m\]\[\e[35m\]]\[\e[m\]\[\e[32m\]\`parse_git_branch\`\[\e[m\]\[\e[35m\]*\[\e[m\]\[\e[34m\]\w\[\e[m\] "


#case insensitive autocompletion
if [ ! -a ~/.inputrc ]; then echo '$include /etc/inputrc' > ~/.inputrc; fi
echo 'set completion-ignore-case On' >> ~/.inputrc

#lscolors
export LS_OPTIONS='--color=auto'
eval "$(dircolors -b)"
alias ls='ls $LS_OPTIONS'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


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

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH
