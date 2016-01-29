" Start Vundle setup
set nocompatible              " be iMproved, required
filetype off                  " required

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" Plugin 'Shougo/unite.vim'
" Plugin 'Valloric/YouCompleteMe'
" Plugin 'altercation/vim-colors-solarized'
Plugin 'mhinz/vim-startify'
" Plugin 'myusuf3/numbers.vim'
" Plugin 'scrooloose/syntastic'
" Plugin 'vim-scripts/AfterColors.vim'
Plugin 'bling/vim-airline'
Plugin 'gmarik/Vundle.vim'
Plugin 'godlygeek/tabular'
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'rhysd/clever-f.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tomasr/molokai'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
call vundle#end()            " required

"""" General settings
set expandtab
set autoindent
set shiftwidth=4
set ruler
set cursorline
set number
set relativenumber
set showcmd

set backspace=indent,eol,start

" Autowrap commands
set formatoptions=tcrq 

" Search options
set hlsearch
set incsearch
set ignorecase

" Turn off cursor blink
set guicursor+=a:blinkon0

" Open new splits below and to the right
set splitbelow
set splitright

set guifont=Monospace\ 16
set background=dark

set tabpagemax=100
set mouse=a

" Fix backspace
set t_kb=

" Move all swp files to ~/.vim
set backupdir=~/.vim/backup//
set directory=~/.vim/swp//

" Set colors
colorscheme molokai

" Custom ignores for command mode
set wildignore+=*.so,*.o,*.d,*.dd,*.swp,*.zip,*.gzip,*.pyc

" Load plugin and indent files for specific filetypes
filetype plugin indent on
"""" End General Settings

"""" Autocommands
" Use cpp syntax for .gob files
au BufNewFile,BufRead *.gob set filetype=cpp

" Automatically source any time a vimrc-like file is saved
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

" Change cursor to red after loading a color scheme
au ColorScheme * highlight Cursor guibg=red guifg=black
"""" End Autocommands

"""" Key Remappings
"Always search to center of the screen
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
nnoremap G Gzz

"Space inserts a space in normal mode
nnoremap <Space> i<Space><Esc> 

"enter to insert space below, shift-enter to insert space above
nnoremap <S-Enter> O<Esc>
nnoremap <CR> o<Esc>

"Tab indents, Shift tab unindent in normal/visual modes
nnoremap <Tab> >>
nnoremap <S-Tab> <<
vnoremap <Tab> >
vnoremap <S-Tab> <

"Easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> :call MoveRight()<cr>
nnoremap <C-H> :call MoveLeft()<cr>

"turn off hlsearch on enter
nnoremap <Esc> :noh<CR><Esc>
"""" End Key Remappings

"""" ag grep 
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    let g:ctrlp_user_caching = 0
endif
"""" end ag grep

"""" Ctrlp settings
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(so|o|d|dd|swp|zip|gzip|pyc)$',
  \ }
"""" End Ctrlp settings

""" Nav functions
" These will move to left/right split if exists. Otherwise, left/right tab
function! MoveLeft()
    let curNr = winnr()
    wincmd h
    if winnr() == curNr
        tabp
    endif
endfunction

function! MoveRight()
    let curNr = winnr()
    wincmd l
    if winnr() == curNr
        tabn
    endif
endfunction
""" End Nav functions
