" vim:foldmethod=marker:foldlevel=0
" zo + zc to open / close folds in case I forgot :P

" PLUGINS {{{
call plug#begin()

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'scrooloose/nerdtree'
"Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tomtom/tcomment_vim' " gc comments
Plug 'tpope/vim-surround'
Plug 'milkypostman/vim-togglelist'
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'w0rp/ale'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'brooth/far.vim'


" Language plugins
" Terraform plugins
if executable('hclfmt')
    Plug 'fatih/vim-hclfmt', { 'for': 'terraform' }
endif
Plug 'hashivim/vim-terraform', { 'for': 'terraform' }
" Go plugins
if executable('go')
  Plug 'fatih/vim-go', { 'for': 'go' }
endif
" Java plugins
if executable('javac')
  Plug 'artur-shaik/vim-javacomplete2', { 'for': 'java' }
endif
" Scala plugins
if executable('scalac')
  Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
endif
" Rust Plugins
if executable('rustc')
  Plug 'rust-lang/rust.vim', { 'for': 'rust' }
  Plug 'racer-rust/vim-racer', { 'for': 'rust' }
endif
Plug 'zchee/deoplete-zsh'

call plug#end()
" }}}
" LOOK AND SYNTAX HILIGHTING {{{
set t_Co=256
syntax on
"set background=dark
"colorscheme nnkd

" whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd Syntax * syn match ExtraWhitespace /\s\+$/ containedin=ALL

" Undefined Marks
highlight UndefinedMarks ctermfg=yellow
autocmd Syntax * syn match UndefinedMarks /???/ containedin=ALL

" Automatic syntax highlighting for files
au BufRead,BufNewFile *.conf          set filetype=dosini
au BufRead,BufNewFile *.bash*         set filetype=sh

" Better split character
" Override color scheme to make split them black
" set fillchars=vert:\|
set fillchars=vert:│

set colorcolumn=101
set cursorline
" }}}
" KEYMAPPINGS {{{
" Leader key
let mapleader = ","

" Insert date
nnoremap <leader>fd "=strftime("%m-%d-%y")<CR>p

" Edit vimrc
nnoremap <leader>ev :edit $MYVIMRC<cr>
nnoremap <leader>evs :source $MYVIMRC<cr>

" Toggle paste with F2
set pastetoggle=<F2>

" Terminal Mode
" Use escape to go back to normal mode
tnoremap <Esc> <C-\><C-n>

" }}}
" GENERAL/TOGGLEABLE SETTINGS {{{
let g:python3_host_prog = '/Users/benjamin/.pyenv/versions/neovim3/bin/python'
" horizontal split splits below
set splitbelow

" indentation
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
filetype indent off
au BufNewFile,BufRead *.py
  \ setlocal tabstop=2
  \ shiftwidth=2
  \ softtabstop=2
  \ autoindent
  \ expandtab

" line numbers
set number
"set relativenumber

" show title
set title

" mouse
set mouse-=a

" utf-8 ftw
" nvim sets utf8 by default, wrap in if because prevents reloading vimrc
if !has('nvim')
  set encoding=utf-8
endif

" Ignore case unless use a capital in search (smartcase needs ignore set)
set ignorecase
set smartcase

" Textwidth for folding
set textwidth=100

" Disable cursor styling in new neovim version
set guicursor=

" backpace through newlines etc
set bs=2

set history=1000
set hidden

" search settings
set wildignore+=node_modules,lib,target
set listchars=tab:»·,trail:_,eol:$
set hlsearch
set incsearch
"hi Search ctermfg=Black
" }}}
" PLUGINS + CUSTOM FUNCTIONS {{{

" deoplete
let g:deoplete#enable_at_startup = 1
"inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<C-i>"

" NERDTree
" Open NERDTree in the directory of the current file (or /home if no file is open)
function! NERDTreeToggleFind()
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
    execute ":NERDTreeClose"
  else
    execute ":NERDTreeFind"
  endif
endfunction

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nnoremap <leader>c :call NERDTreeToggleFind()<cr>

" airline
set laststatus=2
let g:airline_powerline_fonts = 1
" use these seperators if not using airline font
"let g:airline_left_sep=""
"let g:airline_left_alt_sep="|"
"let g:airline_right_sep=""
"let g:airline_right_alt_sep="|"

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " show tab number not number of split panes
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_buffers = 0
" let g:airline#extensions#hunks#enabled = 0
" let g:airline_section_z = ""
let g:airline_theme="molokai"

" lightline
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

" Racer
set hidden
"let g:racer_cmd = "/home/seena/.cargo/bin/racer"
let g:racer_experimental_completer = 1
au FileType rust nmap <leader>rx <Plug>(rust-doc)
au FileType rust nmap <leader>rd <Plug>(rust-def)
au FileType rust nmap <leader>rs <Plug>(rust-def-split)

" ALE
let g:airline#extensions#ale#enabled = 1
let g:ale_linters = {'go': ['golint', 'gofmt']}
let g:ale_lint_delay = 800
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" }}}
