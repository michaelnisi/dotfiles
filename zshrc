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
PATH=$PATH:~/.npm-global/bin

test -s "$HOME/.fastlane/bin" && source "$HOME/.fastlane/bin"
test -s "$HOME/.kiex/scripts/kiex" && source "$HOME/.kiex/scripts/kiex"

export PATH
