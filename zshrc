ZSH=$HOME/.oh-my-zsh

ZSH_THEME="blinks"

plugins=(git)

source $ZSH/oh-my-zsh.sh

DISABLE_AUTO_TITLE=true
autoload -U promptinit && promptinit
ulimit -n 4096

PATH=/usr/bin
PATH=$PATH:/usr/local/bin
PATH=$PATH:/bin
PATH=$PATH:/opt/pkg/bin
PATH=$PATH:/usr/sbin
PATH=$PATH:/usr/local/sbin
PATH=$PATH:/sbin
PATH=$PATH:/opt/pkg/sbin

export PATH
export NODE_PATH="/usr/local/lib/node_modules"