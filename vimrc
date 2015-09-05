" Use Vim settings
set nocompatible

" Manage runtimepath
call pathogen#infect()
syntax on
filetype plugin indent on

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
set wildignore+=*.o,*.obj,.git,*.xc*,node_modules,ebin,build,*.xcodeproj,deps,logs

" File-type highlighting and configuration.
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
nmap <silent><leader>j :CommandTJump<CR>
nmap <silent><leader>f :CommandTFlush<CR>

" Temporary files
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Erlang
let g:erlangWranglerPath='/usr/local/lib/erlang/lib/wrangler-1.0'
let g:erlangManPath='/usr/local/Cellar/erlang/R14B04/share/man'
let g:erlangCompletionDisplayDoc=1
let g:erlangHighlightBif=1

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

" Command-T
set ttimeoutlen=50

if &term =~ "xterm" || &term =~ "screen"
  let g:CommandTCancelMap=['<ESC>', '<C-c>']
  let g:CommandTSelectNextMap=['<C-n>', '<C-j>', '<ESC>OB']
  let g:CommandTSelectPrevMap=['<C-p>', '<C-k>', '<ESC>OA']
endif

" SuperTab option for context aware completion
let g:SuperTabDefaultCompletionType="context"

" Vimux
"Prompt for command to run
map rp :VimuxPromptCommand
" Run last command executed by RunVimTmuxCommand
map rl :VimuxRunLastCommand
" Inspect runner pane
map ri :VimuxInspectRunner
" Close all other tmux panes in current window
map rx :VimuxClosePanes
" Interrupt any command running in the runner pane
map rs :VimuxInterruptRunner
" Use nearest pane (not used by vim) if found instead of running split-window
let VimuxUseNearestPane=1
