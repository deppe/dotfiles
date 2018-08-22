" Start Vundle setup
set nocompatible              " be iMproved, required
filetype off                  " required

" Set the runtime path to include Vundle and initialize
" To install vundle git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" To update plugins :PluginInstall
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" Plugin 'Shougo/unite.vim'
" Plugin 'Valloric/YouCompleteMe'
" Plugin 'altercation/vim-colors-solarized'
Plugin 'mhinz/vim-startify'
" Plugin 'myusuf3/numbers.vim'
" Plugin 'scrooloose/syntastic'
" Plugin 'vim-scripts/AfterColors.vim'
Plugin 'vim-scripts/a.vim'
" Plugin 'bling/vim-airline'
Plugin 'gmarik/Vundle.vim'
Plugin 'godlygeek/tabular'
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'rhysd/clever-f.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tomasr/molokai'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-abolish'
Plugin 'vim-scripts/IndexedSearch'
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


" Open new splits below and to the right

set splitbelow
set splitright


set tabpagemax=100
set mouse=a

" Fix backspace
set t_kb=

" Move all swp files to ~/.vim
set backupdir=~/.vim/backup//
set directory=~/.vim/swp//

" Custom ignores for command mode
set wildignore+=*.so,*.o,*.d,*.dd,*.swp,*.zip,*.gzip,*.pyc

" Load plugin and indent files for specific filetypes
filetype plugin indent on
"""" End General Settings

"""" Autocommands
" Use cpp syntax for .gob files
au BufNewFile,BufRead *.gob set filetype=cpp

" If cursor is idle, check for new version of file
"au CursorHold * checktime

" Automatically source any time a vimrc-like file is saved
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

" Change cursor to red after loading a color scheme
"au ColorScheme * highlight Cursor guibg=red guifg=black
"""" End Autocommands

colorscheme molokai

if has("gui_running")
    " Turn off cursor blink
    set guicursor+=a:blinkon0
    set guifont=Monospace\ 13
    set background=dark
else
"    silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_blink_mode off"
"    "Hack for cursor in gnome-terminal
"    "These change gnome-terminal settings globally
"    au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
"    au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
"    au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
"    au VimEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
"
"    "Turn off character background color
"    hi Normal ctermbg=None
"
"    hi Visual ctermbg=124 ctermfg=White
"    "hi CursorLine ctermbg=darkgrey ctermfg=white
"
    "Make cursor red. This will affect terminal globally
    "silent !echo -ne "\033]12;red\007"
endif

"""" Key Remappings
"Always search to center of the screen
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
nnoremap G Gzz
nnoremap % %zz

" TODO: look into how to get this to work. Probably need a custom function on '{' and '}' presses
"nnoremap {{ {{zz
"nnoremap {} {}zz
"nnoremap }} }}zz
"nnoremap }{ }{zz

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
nnoremap <C-J> :call MoveDown()<cr>
nnoremap <C-K> :call MoveUp()<cr>
nnoremap <C-L> :call MoveRight()<cr>
nnoremap <C-H> :call MoveLeft()<cr>

"Make Y act like C and D
nnoremap Y y$

"Make ctrl-c, ctrl-v work for copy paste
vnoremap <C-c> "+ygv"*ygv
inoremap <C-v> <C-r>"

"Exit insert mode with jk
inoremap jk <Esc>l
inoremap <Esc> <Esc>l

"gf to open new tab always
nnoremap gf <C-W>gf
vnoremap gf <C-W>gf

" map leader-h to add a #include for the current file's header
nnoremap <Leader>h cc#include <<C-R>=expand("%:t")<CR>><Esc>T.ct>h<Esc>
nnoremap <Leader>v :tabnew $MYVIMRC<CR>
nnoremap <Leader>e :NERDTree<CR>
nnoremap <Leader>p :set paste<CR>"*p:set nopaste<CR>
nnoremap <Leader>P :set paste<CR>"*P:set nopaste<CR>
nnoremap <Leader>m :call ToggleCopyMode()<CR>

" for wrapped lines, make up/down behave more sanely
nnoremap j gj
nnoremap k gk

"A nicer way to replace a word. 'S' is a pretty pointless command (but maybe
"less dumb than 's'), so this is a good sub-in.
"TODO: ReplaceWithRegister plugin looks nice. It replaces based on a movement
"instead of just doing an iw. http://www.vim.org/scripts/script.php?script_id=2703
nnoremap S "_diwP
vnoremap S "_dP

"""" ag grep 
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    let g:ctrlp_use_caching = 1
endif
"""" end ag grep

"""" Ctrlp settings
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(so|o|d|dd|swp|zip|gzip|pyc)$',
  \ }

"don't change working path when opening new files
let g:ctrlp_working_path_mode = 0
"""" End Ctrlp settings

""" Nav functions
"Move to left split or left tab
function! MoveLeft()
    let curNr = winnr()
    wincmd h
    if winnr() == curNr
        tabp
    endif
endfunction

"Move to right split or right tab
function! MoveRight()
    let curNr = winnr()
    wincmd l
    if winnr() == curNr
        tabn
    endif
endfunction

"Move to upper split or move cursor up
function! MoveUp()
    let curNr = winnr()
    wincmd k
    if winnr() == curNr
        normal 10k
    endif
endfunction

"Move to lower split or move cursor down
function! MoveDown()
    let curNr = winnr()
    wincmd j
    if winnr() == curNr
        normal 10j
    endif
endfunction

function! ToggleCopyMode()
    if &mouse == 'a'
        set mouse=
        set nonumber
        set norelativenumber
    else
        set mouse=a
        set number
        set relativenumber
    endif
endfunc

""" End Nav functions
