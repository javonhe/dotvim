" 关闭对vi的兼容，方便使用vim的强大功能
set nocompatible

" 显示行数
set number

" 自动把内容写回文件
set autowrite

"历史记录1000条
set history=1000

" 显示不可见字符
set list

"显示tab为>-,显示行尾空格为-
set listchars=tab:>-,trail:-

set background=dark

" 设置语法自动高亮
syntax on

" 设置自动缩进
"set autoindent


" 设置智能缩进
set smartindent

" 设置c语言格式缩进
"set cindent

" 设置缩进为4个
set tabstop=4
set shiftwidth=4
set softtabstop=4

" tab键转为空格
set expandtab

" 输入)}符号的时候，自动匹配到相应的位置
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

" 使用鼠标
set mouse=a



"设置底部状态栏
set laststatus=2

"设置持久化撤销
set undofile

"设置持久化撤销文件的目录
set undodir=$HOME/.vim/undodir


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
Plugin 'junegunn/fzf', { 'dir': '/usr/local/bin/fzf' }
Plugin 'junegunn/fzf.vim'

"gtags管理
Plugin 'ludovicchabant/vim-gutentags'
" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
 let g:gutentags_project_root = ['.root','.git']

 " 所生成的数据文件的名称
 let g:gutentags_ctags_tagfile = '.tags'

 " 支持gtags
 let g:gutentags_modules = []
 if executable('gtags-cscope') && executable('gtags')
     let g:gutentags_modules += ['gtags_cscope']
 endif

 " 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
 let s:vim_tags = expand('~/.cache/tags')
 let g:gutentags_cache_dir = s:vim_tags


"coc插件用于自动补全，适用于vim8
Plugin 'neoclide/coc.nvim'

"添加ack插件
Plugin 'mileszs/ack.vim'
"<Leader>c进行搜索，同时不自动打开第一个匹配的文件"
map <Leader>ac :Ack!<Space>

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

" 打开文件类型自动检测，自动缩进，不同文件类型的插件自动加载。具体含义见有道笔记
filetype indent plugin on
