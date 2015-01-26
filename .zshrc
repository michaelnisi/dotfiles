ZSH=$HOME/.oh-my-zsh

ZSH_THEME="blinks"

plugins=(git)

source $ZSH/oh-my-zsh.sh

DISABLE_AUTO_TITLE=true
autoload -U promptinit && promptinit
bindkey -v

PATH=/usr/local/bin
PATH=$PATH:/usr/bin
PATH=$PATH:/bin
PATH=$PATH:/usr/sbin
PATH=$PATH:/usr/local/sbin
PATH=$PATH:/sbin

export PATH
export NODE_PATH="/usr/local/lib/node_modules"

# alias tmux="TERM=screen-256color-bce tmux"

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

ulimit -n 4096
