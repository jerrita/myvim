set nocompatible
set number
set guioptions-=r 
set guioptions-=L
set guioptions-=b
set showtabline=0
set guifont=Monaco:h13         
syntax on    "开启语法高亮"
set background=dark        "设置背景色"
set nowrap    "设置不折行"
set fileformat=unix    "设置以unix的格式保存文件"
set cindent        "设置C样式的缩进格式"
set tabstop=4    "设置table长度"
set shiftwidth=4        "同上"
set showmatch    "显示匹配的括号"
set scrolloff=5        "距离顶部和底部5行"
set laststatus=2    "命令行为两行"
set fenc=utf-8      "文件编码"
set backspace=2
set mouse=a        "启用鼠标"
set selection=exclusive
set selectmode=mouse,key
set matchtime=5
set ignorecase        "忽略大小写"
set incsearch
set hlsearch        "高亮搜索项"
set noexpandtab        "不允许扩展table"
set whichwrap+=<,>,h,l
set autoread
set cursorline        "突出显示当前行"
set cursorcolumn        "突出显示当前列"
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
call vundle#end()
filetype plugin indent on
Plugin 'Lokaltog/vim-powerline'
Plugin 'scrooloose/nerdtree'
Plugin 'Yggdroot/indentLine'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tell-k/vim-autopep8'
Plugin 'scrooloose/nerdcommenter'

"F2开启和关闭树"
map <F2> :NERDTreeToggle<CR>
let NERDTreeChDirMode=1
"显示书签"
let NERDTreeShowBookmarks=1
"设置忽略文件类型"
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
"窗口大小"
let NERDTreeWinSize=25

"缩进指示线"
let g:indentLine_char='┆'
let g:indentLine_enabled = 1

"autopep8设置"
let g:autopep8_disable_show_diff=1

map <F4> <leader>ci <CR>

"按F5运行python"
map <F5> :Autopep8<CR> :w<CR> :call RunPython()<CR>
function RunPython()
  let mp = &makeprg
  let ef = &errorformat
  let exeFile = expand("%:t")
  setlocal makeprg=python\ -u
  set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
  silent make %
  copen
  let &makeprg = mp
  let &errorformat = ef
endfunction
