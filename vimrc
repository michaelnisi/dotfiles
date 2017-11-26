set nocompatible
filetype off

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized.git'
Plugin 'apple/swift', {'rtp': 'utils/vim/', 'name': 'Swift-Syntax'}
Plugin 'benmills/vimux.git'
Plugin 'elixir-lang/vim-elixir'
Plugin 'kien/ctrlp.vim.git'
Plugin 'rust-lang/rust.vim'
call vundle#end()
filetype plugin indent on

syntax on

" UI
set laststatus=2
set guifont=Menlo\ Regular:h15
set ruler
set nofoldenable
let &guicursor=substitute(&guicursor, 'n-v-c:', '&blinkon0-', '')
set title
set guioptions-=T

" Colors
set background=dark
colorscheme solarized

" Search
set ignorecase
set smartcase
set hlsearch
set incsearch "dynamically as they are typed
nmap <silent> ,/ :nohlsearch<CR>

" Window
set scrolloff=3

" Intuitive backspacing in insert mode
set backspace=indent,eol,start

" Ignore
set wildignore+=*.o,*.obj,.git,*.xc*,node_modules,ebin,build,deps,logs

" File-type highlighting and configuration
syntax on
filetype on
filetype plugin on
filetype indent on

" Bells
set noerrorbells
set visualbell

" History
set history=1000

" Buffers
set hidden

" Keys
let mapleader = ","
nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>
nmap <leader>n :bn<CR>
nmap <leader>l :set list!<CR>
nmap <leader>r :source $MYVIMRC<CR>

" Temporary files
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Tabs and spaces
set ts=2 sts=2 sw=2 expandtab

if has("autocmd")
  " Enable file type detection
  filetype on

  " Filetypes
  au BufRead,BufNewFile *.app set ft=erlang
  au BufRead,BufNewFile *.app.src set ft=erlang
  au BufRead,BufNewFile *.atom set ft=xml
  au BufRead,BufNewFile *.conf set ft=nginx
  au BufRead,BufNewFile *.json set ft=javascript
  au BufRead,BufNewFile *.ll set ft=llvm
  au BufRead,BufNewFile *.mm set ft=objc
  au BufRead,BufNewFile *.podspec set ft=ruby
  au BufRead,BufNewFile *.rs set ft=rust
  au BufRead,BufNewFile *.rss set ft=xml
  au BufRead,BufNewFile *.scss set ft=css
  au BufRead,BufNewFile *.swift set ft=swift
  au BufRead,BufNewFile *.t set ft=erlang
  au BufRead,BufNewFile *.td set ft=tablegen
  au BufRead,BufNewFile Podfile set ft=ruby
  au BufRead,BufNewFile Rakefile set ft=ruby
  au BufRead,BufNewFile rebar.config set ft=erlang

  " Specific tabs and spaces
  autocmd FileType make setlocal ts=2 sts=2 sw=2 noexpandtab
  autocmd FileType markdown setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType rust setlocal ts=2 sts=2 sw=2 expandtab

  " Strip trailing whitespace
  autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
endif

" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
  let _s=@/
  let l=line(".")
  let c=col(".")
  %s/\s\+$//e
  let @/=_s
  call cursor(l, c)
endfunction

" Map <Tab> to either actually insert a <Tab> if the current line is only
" whitespace, or start/continue a CTRL-N completion operation.
function! CleverTab()
   if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
      return "\<Tab>"
   else
      return "\<C-N>"
   endif
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>

" Vimux
map rp :VimuxPromptCommand
map rl :VimuxRunLastCommand
map ri :VimuxInspectRunner
map rx :VimuxClosePanes
map rs :VimuxInterruptRunner
let VimuxUseNearestPane=1

" CtrlP
let g:ctrlp_working_path_mode = 'c'
