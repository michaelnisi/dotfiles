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

GEM_HOME=$HOME/.gem

PATH=$PATH:$HOME/.npm-global/bin
PATH=$PATH:$GEM_HOME/ruby/2.3.0/bin

test -s "$HOME/.fastlane/bin" && source "$HOME/.fastlane/bin"
test -s "$HOME/.kiex/scripts/kiex" && source "$HOME/.kiex/scripts/kiex"

export NVM_DIR="$HOME/.nvm"
alias install_nvm="[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh""
alias install_nvm_bash_completion="[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion""

export PATH
export GEM_HOME
