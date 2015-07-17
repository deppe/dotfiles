 Start Vundle setup
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-sensible'
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-surround'
" Plugin 'scrooloose/syntastic'

Bundle 'tomasr/molokai'
call vundle#end()            " required

set expandtab
set autoindent
set shiftwidth=4
" set cindent

set ruler
set number

set showcmd

set backspace=indent,eol,start

"autowrap commands
set formatoptions=tcrq 

set hlsearch
set incsearch
set ignorecase

"turn off hlsearch on enter
nnoremap <CR> :noh<CR><CR>

set guifont=Monospace\ 16
set background=dark

set tabpagemax=100
set mouse=a

"fix backspace
set t_kb=

filetype plugin indent on

"use c syntax for .gob files
au BufNewFile,BufRead *.gob set filetype=c


if has('gui_running')
    "colorscheme solarized
    colorscheme molokai
else
    colors koehler
    set term=dtterm
endif

" Automatically source any time a vimrc-like file is saved
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

"custom ignores
set wildignore+=*.so,*.o,*.d,*.dd,*.swp,*.zip,*.gzip,*.pyc

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(so|o|d|dd|swp|zip|gzip|pyc)$',
  \ }

set backupdir=~/.vim/backup//
set directory=~/.vim/swp//

" set grepprg=ack\ -k

" start syntastic settings
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" 
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" end syntastic settings

" start ctrlp settings
" let g:ctrlp_user_command = '/opt/swt/bin/ack %s -i --nocolor --nogroup -g --ignore-file=ext:dd,d,o'
" let g:ctrlp_use_caching = 0
" let g:ctrlp_working_path_mode = 0
" let g:ctrlp_switch_buffer = 0
" let g:ctrlp_max_files=0
" let g:ctrlp_max_depth=40
" let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']
" let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }
" end ctrlp settings
