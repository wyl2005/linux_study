" 开启语法高亮  
let mapleader=" "

syntax on
set encoding=utf-8
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
"set termencoding=utf-8
set nocompatible

"set mouse=a

set tabstop=4 " 设置tab键的宽度
set shiftwidth=4 " 设置每层缩进空格数
" set expandtab " 修改tab为4个空格

"set backspace=2 " 设置退格键可用

set nu! " 显示行号
" set relativenumber number" 显示相对行号
"set norelativenumber

" guangbiao li dixia 5 hang
set scrolloff=5

set hlsearch " 查找高亮
set incsearch " 查找中，边输入边高亮
set ignorecase
set smartcase
"set showmatch "显示括号配对情况
set autoread "当文件在外部被改变时，vim自动更新载入

set cmdheight=1 " 命令部分高度为1


set cindent " 设置自动缩进
" set autoindent " 设置自动缩进
" set smartindent " 设置自动缩进
"set completeopt=preview,menu  " 代码补全

" 高亮行
set cursorline
" hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
highlight CursorLine   cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE

" 高亮列
set cursorcolumn
" hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
highlight CursorColumn cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE

set showcmd
set wildmenu " 命令模式，tab选命令



nnoremap R :source ~/.vimrc<CR>
nnoremap Q :q<CR>
nnoremap s <nop>

map <LEADER>j <C-w>j
map <LEADER>l <C-w>l
map <LEADER>k <C-w>k
map <LEADER>h <C-w>h

noremap <LEADER><CR> :nohlsearch<CR> " LEADER = \ , like win key
noremap J 5j  " origin J= merge with next line
noremap K 5k
noremap H 7h
noremap L 7l


" === nerdtree
map tt :NERDTreeToggle<CR>

" === undotree
nnoremap <F4> :UndotreeToggle<cr>

" === Tagbar
map tg :TagbarToggle<CR>
let g:tagbar_width=25
" autocmd BufReadPost *.cpp,*.c,*.h,*.cc,*.cxx call tagbar#autoopen()

" === ale
let g:ale_sign_column_always = 1
"自定义error和warning图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = 'w'
"在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', 'w %d', '✔ OK']
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %code %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''
"打开文件时不进行检查
let g:ale_lint_on_enter = 0

"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
"<Leader>s触发/关闭语法检查
nmap <Leader>s :ALEToggle<CR>
"<Leader>d查看错误或警告的详细信息
nmap <Leader>d :ALEDetail<CR>

"使用clang对c和c++进行语法检查，对python使用pylint进行语法检查
"let g:ale_linters = {
"\   'c++': ['clang'],
"\   'c': ['clang'],
"\   'python': ['pylint'],
"\}


" ctags 设置
set tags=./tags;,tags
"  自动加载ctags: ctags -R
"if filereadable("tags")
"      set tags=tags
"endif


"--------------------------------------------------------------------------------
" cscope:建立数据库：cscope -Rbq；  F5 查找c符号； F6 查找字符串；   F7 查找函数谁调用了，
"--------------------------------------------------------------------------------
if has("cscope")
  set csprg=/usr/bin/cscope
  set csto=1 " set cscopetagorder=1: use tags for definition search first
  set cst  " set cscopetag : use both cscope and ctag
  set nocsverb
  " add any database in current directory
  if filereadable("cscope.out")
      cs add cscope.out
  endif
  set csverb
endif

:set cscopequickfix=s-,c-,d-,i-,t-,e-

nmap <C-/>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-/>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-/>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-/>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-/>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-/>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-/>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
nmap <C-/>d :cs find d <C-R>=expand("<cword>")<CR><CR>

"nmap <C-/>s :cs find s <C-R>=expand("<cword>")<CR><CR>
"F5 查找c语言符号，函数名，宏、枚举等出现的地方
"F6 查找字符串； F7 查找函数被谁调用了， F8 查找函数定义； 
nmap <silent> <F5> :cs find s <C-R>=expand("<cword>")<CR><CR> :botright copen<CR><CR> 
nmap <silent> <F6> :cs find t <C-R>=expand("<cword>")<CR><CR> :botright copen<CR><CR>
nmap <silent> <F7> :cs find c <C-R>=expand("<cword>")<CR><CR> :botright copen<CR><CR>
"nmap <silent> <F8> :cs find g <C-R>=expand("<cword>")<CR><CR> 

 "--------------------------------------------------------------------------------
 " QuickFix
 "--------------------------------------------------------------------------------
 nmap <F1> :cp<cr>   " 切换到上一个结果
 nmap <F2> :cn<cr>   " 切换到下一个结果


call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'

" File navigation
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'

" Taglist function var
Plug 'majutsushi/tagbar'

" Auto Complete
"Plug 'Valloric/YouCompleteMe'

" Undo Tree
Plug 'mbbill/undotree/'

" Error checking
"Plug 'w0rp/ale'

" 显示marks - 方便自己进行标记和跳转
" m[a-zA-Z] add mark
" '[a-zA-Z] go to mark
" m<Space>  del all marks
Plug 'https://github.com/kshenoy/vim-signature'

" 自动括号 引号
Plug 'jiangmiao/auto-pairs'

call plug#end()

