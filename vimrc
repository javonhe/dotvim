set nocompatible
set number

" detect file type
filetype on
filetype plugin on

" 自动把内容写回文件
set autowrite

"历史记录1000条
set history=1000

"显示tab和空格
set list
set listchars=tab:>-,trail:-

set background=dark
syntax on
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set showmatch
set guioptions-=T
set vb t_vb=

"设置文本格式
set fileformat=unix

"高亮当前行
set cursorline

" 标尺
set ruler

set nohls
set incsearch
set ignorecase smartcase
set mouse=a
set ruler
set tabstop=4
set softtabstop=4
set autoindent
set expandtab
set cindent

"设置底部状态栏
set laststatus=2

filetype plugin indent on


map ft :call Search_Word()<CR>:copen<CR>
function Search_Word()
    let w = expand("<cword>") " 在当前光标位置抓词
    execute "vimgrep " w " *"
endfunction

"不产生备份文件
set nobackup
set nowritebackup

"开始使用vundle
set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" " required!
Bundle 'gmarik/vundle'

"supertab
Bundle 'ervandew/supertab'

"tagbar
Bundle 'majutsushi/tagbar'
let g:tagbar_width=30
let g:tagbar_left=1
noremap <C-f> :TagbarToggle<CR>

"NERDTree
nmap <F8> :TrinityToggleAll<CR>
nmap <F9> :TrinityToggleSourceExplorer<CR>
nmap <F10> :TrinityToggleTagList<CR>
nmap <F11> :TrinityToggleNERDTree<CR>

filetype indent plugin on
