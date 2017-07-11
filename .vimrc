"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Font related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256
syntax enable
set shell=/bin/bash
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif
" let python_highlight_all = 1
colorscheme molokai

augroup colorschemeChanges
    autocmd!
        autocmd ColorScheme * highlight Pmenu ctermfg=1 ctermbg=15 guifg=#ff0000 guibg=#0000ff
        autocmd ColorScheme * highlight PmenuSel ctermfg=15 ctermbg=1 guifg=#0000ff guibg=#ff0000
augroup END

set nocompatible              " be iMproved, required
filetype off                  " required
set encoding=utf8
try
    lang en_US
catch
endtry
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'walm/jshint.vim'
Plugin 'bling/vim-airline'
Plugin 'Valloric/YouCompleteMe'
Bundle 'rstacruz/sparkup'
Plugin 'xolox/vim-misc'
Plugin 'Shougo/vimproc.vim'
Plugin 'Quramy/tsuquyomi'
Plugin 'powerline/powerline'
Plugin 'davidhalter/jedi-vim'
Plugin 'tpope/vim-surround'
Plugin 'ajh17/VimCompletesMe'
Plugin 'posva/vim-vue'
Plugin 'nvie/vim-flake8'

call vundle#end()
filetype indent plugin on
" Because you're a fucking idiot and can't every remember this command:
" vim +PluginInstall +qall 
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Powerline
set laststatus=2
let g:Powerline_symbols = 'fancy'
set guifont=Terminuss\ Powerline 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline customization

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme='dark'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autowrite
autocmd! bufwritepost vimrc source ~/.vimrc
set tabstop=8 
set softtabstop=4
set expandtab 
set shiftwidth=4 
set smartindent
set lbr
set tw=119
set ai
set si
set wrap
autocmd FileType html :setlocal sw=2 ts=2 sts=2
autocmd FileType javascript :setlocal sw=2 ts=2 sts=2
autocmd FileType vue :setlocal sw=2 ts=2 sts=2
" set smarttab
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => UI related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-n> :NERDTreeToggle<CR>
set nu
se mouse+=a
syntax on
set list
set listchars=tab:▸\ ,eol:¬
nmap <leader>l :set list!<CR>
" highlight NonText guifg=#333333
" highlight SpecialKey guifg=#333333
set showmatch
set noerrorbells
set novisualbell
set magic 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup
set nowb
set noswapfile
set undodir=~/.vim/undodir
set undofile
set undolevels=1000
set undoreload=10000
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around tabs and buffers 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map j gj
map k gk
map <silent> <leader><cr> :nohlsearch<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => my custom
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = " "
set cmdheight=1
set relativenumber
set numberwidth=1
set title
set colorcolumn=120
" Some syntax files suck
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=#ffd9d9
hi Search ctermfg=15 ctermbg=204 guifg=#ffffff guibg=#ff5f87

" Taken From http://stackoverflow.com/questions/235439/vim-80-column-layout-concerns
autocmd FileType python highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
autocmd FileType python match OverLength /\%121v.\+/
" long JS files break syntax highlighting all the time for me. So F12 to resync
nnoremap <F12> :syntax sync fromstart<CR>
nnoremap <F2> :set invpaste paste?<CR>
" comma to move to a split 
nnoremap , <C-w><C-w>
set pastetoggle=<F2>
set showmode
" Taken from https://stackoverflow.com/questions/8793489/nerdtree-reload-new-files#8794468
nmap <Leader>r :NERDTreeFocus<cr>R<c-w><c-p>
nnoremap a A
au BufRead,BufNewFile *.ts    setlocal filetype=typescript
set rtp+=/usr/local/lib/node_modules/typescript-tools/ftplugin/typescript_tss.vim

if !exists("g:ycm_semantic_triggers")
    let g:ycm_semantic_triggers = {}
endif
    let g:ycm_semantic_triggers['typescript'] = ['.']
let g:ycm_python_binary_path = 'python'
left g:ycm_collect_identifiers_from_tags_files = 1
set tags=tags
let g:jedi#completions_enabled=1
" Make vim use normal regex 
nnoremap / /\v
vnoremap / /\v
" lowercase search is insensitive. someUpperCase is case sensitive. 
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
" space space to remove search highlight
nnoremap <leader><space> :noh<cr>
" who does a string replace with percent? Are you insane?
nnoremap <tab> %
vnoremap <tab> %
" fuck F1 thats all I gotta say
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
" Let's just be honest. I can't type
nnoremap ; :
" no more pounding esc like a pleb
inoremap jj <ESC>
" space+W remove trailing white space
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
" space+ev open vimrc file
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

function! DoPrettyXML()
    " save the filetype so we can restore it later
    let l:origft = &ft
    set ft=
    " delete the xml header if it exists. This will
    " permit us to surround the document with fake tags
    " without creating invalid xml.
    1s/<?xml .*?>//e
    " insert fake tags around the entire document.
    " This will permit us to pretty-format excerpts of
    " XML that may contain multiple top-level elements.
    0put ='<PrettyXML>'
    $put ='</PrettyXML>'
    silent %!xmllint --format -
    " xmllint will insert an <?xml?> header. it's easy enough to delete
    " if you don't want it.
    " delete the fake tags
    2d
    $d
    " restore the 'normal' indentation, which is one extra level
    " too deep due to the extra tags we wrapped around the document.
    silent %<
    " back to home
    1
    " restore the filetype
    exe "set ft=" . l:origft
endfunction
command! PrettyXML call DoPrettyXML()
