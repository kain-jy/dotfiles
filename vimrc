" kain <me@kain-jy.com>

set runtimepath+=~/.vim/

" === general ===
set autoindent
set clipboard=unnamed,autoselect
set backspace=2
vnoremap <silent> > >gv
vnoremap <silent> < <gv
set wildmode=list:longest

" === charset ===
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8

" === search ===
set ignorecase 
set smartcase
set wrapscan
set incsearch

" === tab ===
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" === folding ===
set foldmethod=indent
set foldlevel=1
set foldnestmax=3

" === appearance ===
set number
set ruler
set cursorline
syntax on
set hlsearch
set laststatus=2
set antialias
set listchars=tab:»-
set list
set splitright
set splitbelow
hi CursorLine ctermbg=0 guibg=darkred guifg=white
hi Pmenu ctermfg=254 ctermbg=232 guibg=#000000
hi PmenuSel ctermfg=7 ctermbg=4 guibg=#555555 guifg=#ffffff
hi ZenkakuSpace cterm=underline ctermfg=lightgray guifg=rightgray
hi SpecialKey cterm=None ctermfg=darkgrey guifg=darkgrey
hi Folded term=standout ctermfg=246 ctermbg=234
au BufRead,BufNew * match ZenkakuSpace /　/

" === plugins ===
if !1 | finish | endif

if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle'))

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'

NeoBundle 'itchyny/lightline.vim'  " https://github.com/itchyny/lightline.vim
let g:Powerline_symbols = 'fancy'
let g:lightline = {
            \ 'colorscheme': 'wombat',
            \ 'active': {
            \   'left': [['mode'], ['fugitive','readonly','filename','modified']]
            \ },
            \ 'component': {
            \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
            \ },
            \ 'component_visible_condition': {
            \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
            \ }
            \ }

runtime! rc.d/*.vim

call neobundle#end()

filetype plugin indent on

NeoBundleCheck
