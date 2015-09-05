#!/usr/bin/env bash

set -o xtrace

mkdir -p ${AUTOLOAD:=${HOME}/.vim/autoload} ${BUNDLE:=${HOME}/.vim/bundle}

copy() {
  cp -i gitconfig ${HOME}/.gitconfig
  cp -i vimrc ${HOME}/.vimrc
  cp -i zshrc ${HOME}/.zshrc
  cp -i tmux.conf ${HOME}/.tmux.conf
  cp -i gitignore_global ${HOME}/.gitignore_global
}

config_git() {
  git config --global core.excludesfile ${HOME}/.gitignore_global
}

pathogen() {
  curl -LSso ${AUTOLOAD}/pathogen.vim https://tpo.pe/pathogen.vim
}

clone() {
  local repos=(
  https://github.com/altercation/vim-colors-solarized.git
  https://github.com/benmills/vimux.git
  https://github.com/elixir-lang/vim-elixir.git
  https://github.com/ervandew/supertab.git
  https://github.com/kelan/gyp.vim.git
  https://github.com/markcornick/vim-vagrant.git
  https://github.com/michaelnisi/swift.vim.git
  https://github.com/michaelnisi/vim-erlang-skeletons.git
  https://github.com/oscarh/vimerl.git
  https://github.com/vim-scripts/dtrace-syntax-file.git
  https://github.com/vim-scripts/jade.vim.git
  https://github.com/vim-scripts/nginx.vim.git
  https://github.com/wincent/Command-T.git
  )
  cd ${BUNDLE} || exit 1
  for repo in ${repos[@]}; do
    git clone ${repo}
  done
}

compile() {
  local COMMAND_T=${BUNDLE}/Command-T
  cd ${COMMAND_T}/ruby/command-t || exit 1
  ruby extconf.rb
  make
}

echo "Copying dotfiles"
copy

echo "Setting global gitignore"
config_git

echo "Downloading Pathogen"
pathogen

echo "Cloning"
clone

echo "Compiling Command-T"
compile

exit
