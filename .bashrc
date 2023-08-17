alias config='$HOME/dotfiles/add.sh'
alias scrape='$HOME/Music/papa/.scrape.sh'
alias vim='nvim'
HISTSIZE=HISTFILESIZE=
shopt -s autocd
set -o vi
export PS1="\[\e[34m\]\w\[\e[m\]\[\e[35m\]>\[\e[m\] "
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
. "$HOME/.cargo/env"

export VISUAL=nvim
export EDITOR=nvim

# Created by `pipx` on 2023-07-28 15:17:56
export PATH="$PATH:/home/productiveuser/.local/bin"
