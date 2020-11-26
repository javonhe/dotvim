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

"设置tag文件搜索路径
set tags=./.tags;,.tags


"tmux使用鼠标
if exists('$TMUX')
    set ttymouse=xterm2
end

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

"设置持久化撤销
set undofile

"设置持久化撤销文件的目录
set undodir=$HOME/.vim/undodir

filetype plugin indent on


map ft :call Search_Word()<CR>:copen<CR>
function Search_Word()
    let w = expand("<cword>") " 在当前光标位置抓词
    execute 'vimgrep' w  '**'
endfunction

"不产生备份文件
set nobackup
set nowritebackup

"开始使用vundle
set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.fzf/
call vundle#begin()

" let Vundle manage Vundle
" " required!
Plugin 'VundleVim/Vundle.vim'

"supertab
Plugin 'ervandew/supertab'

"molokai scheme
Plugin 'tomasr/molokai'

"fzf
Plugin 'junegunn/fzf.vim'

"ctags管理
Plugin 'ludovicchabant/vim-gutentags'
" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
 let g:gutentags_project_root = ['.root','.git']

 " 所生成的数据文件的名称
 let g:gutentags_ctags_tagfile = '.tags'

 " 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
 let s:vim_tags = expand('~/.cache/tags')
 let g:gutentags_cache_dir = s:vim_tags

 " 配置 ctags 的参数
 let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
 let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
 let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

"coc插件用于自动补全，适用于vim8
Plugin 'neoclide/coc.nvim'

"NERDTree
nmap <F8> :TrinityToggleAll<CR>
nmap <F9> :TrinityToggleSourceExplorer<CR>
nmap <F10> :TrinityToggleTagList<CR>
nmap <F12> :TrinityToggleNERDTree<CR>


"括号自动补全
inoremap ( ()<ESC>i
inoremap { {<CR>}<ESC>O
inoremap [ []<ESC>i
inoremap " ""<ESC>i
inoremap ' ''<ESC>i

call vundle#end()
let g:molokai_original = 1
"colorscheme molokai
filetype indent plugin on
