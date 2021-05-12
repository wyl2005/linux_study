" 开启语法高亮  
let mapleader=" "

syntax on
set encoding=utf-8
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
"set termencoding=utf-8
set nocompatible

"set mouse=a
"set mouse=vi
set mouse=v

" updatetime also controls the delay before vim writes its swap file 500ms
set updatetime=300

set autowrite " 自动把内容写回文件: 如果文件被修改过 在每个:next"

set tabstop=4 " 设置tab键的宽度
set shiftwidth=4 " 设置每层缩进空格数
" set expandtab " 修改tab为4个空格

"set backspace=2 " 设置退格键可用

set nu! " 显示行号
" set relativenumber number" 显示相对行号
"set norelativenumber

" guangbiao li dixia 5 hang
set scrolloff=7

" 查找时大小写,
" set ic (ignore case)  忽略大小写
" set noic 不忽略大小写
" \CWord ： 区分大小写的查找 
" /\cword ： 不区分大小写的查找

set hlsearch " 查找高亮
set incsearch " 查找中，边输入边高亮
set ignorecase " 忽略大小写
set smartcase
"set showmatch "显示括号配对情况
set autoread "当文件在外部被改变时，vim自动更新载入

set history=1000 "设置历史记录条数   

set cmdheight=1 " 命令部分高度为1

"共享剪切板
set clipboard+=unnamed
set laststatus=2 "两行状态行+一行命令行

set foldlevelstart=99 " 每次打开文件时关闭折叠
inoremap jj <Esc> "将jj映射到Esc

set cindent " 设置自动缩进
" set autoindent " 设置自动缩进
" set smartindent " 设置自动缩进
"set completeopt=preview,menu  " 代码补全

" 高亮行
" set cursorline
" hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
" highlight CursorLine   cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE

" 高亮列
"set cursorcolumn
" hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
"highlight CursorColumn cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
set cursorline

"vim自动跳到上次打开的光标位置
if has("autocmd")  
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif  
endif  

" color scheme
" ---------------------------------
" set t_Co=256 "置终端支持的颜色是256颜色
if has("termguicolors")
    set termguicolors
endif
set background=dark
" colorscheme NeoSolarized

colorscheme gruvbox
" highlight Normal guifg=None ctermbg=None


" set background=light
" colorscheme molokai
" colorscheme torte
" colorscheme solarized

"hilight function name 匹配函数名
"autocmd BufNewFile,BufRead * :syntax match cfunctions "\<[a-zA-Z_][a-zA-Z_0-9]*\>[^()]*)("me=e-2
"autocmd BufNewFile,BufRead * :syntax match cfunctions "\<[a-zA-Z_][a-zA-Z_0-9]*\>\s*("me=e-1

syn match cFunctions "\<[a-zA-Z_][a-zA-Z_0-9]*\>[^()]*)("me=e-2
syn match cFunctions "\<[a-zA-Z_][a-zA-Z_0-9]*\>\s*("me=e-1
"hi cfunctions ctermfg=81 "这一行就是给函数名加颜色的
" hi cFunctions guifg=#e5786d  cterm=bold ctermfg=252
hi cFunctions gui=bold cterm=bold ctermfg=252 guifg=DarkSlateGray2

" hi cFunctions guifg=#7fd02e cterm=bold ctermfg=251
" hi Type ctermfg=118 cterm=none
" hi Structure ctermfg=118 cterm=none
" hi Macro ctermfg=161 cterm=bold
" hi PreCondit ctermfg=161 cterm=bold
" set cursorline

"hi CursorLine cterm=underline

" ---------------------------------

  
set showcmd
set wildmenu " 命令模式，tab选命令



" nnoremap R :source ~/.vimrc<CR>
nnoremap R :source ~/.vim/init.vim<CR>

nnoremap Q :q<CR> "bd 关闭buffer"
" nnoremap <C-q> :q<CR> 
nnoremap s <nop>
nnoremap ; :
" 打开命令行窗口
nnoremap <Leader>q q:

map <LEADER>j <C-w>j
map <LEADER>l <C-w>l
map <LEADER>k <C-w>k
map <LEADER>h <C-w>h

" 清除搜索高亮
noremap <LEADER><CR> :nohlsearch<CR> " LEADER = \ , like win key
noremap J 5j  " origin J= merge with next line
noremap K 5k
noremap H 7h
noremap L 7l

inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
"map <C-e> 5<C-e>


" Treat long lines as break lines (useful when moving around in them)
nmap j gj
nmap k gk


" use ctrl+h/j/k/l switch window
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" command 模式选取文件
cmap <c-j> <c-n>
cmap <c-k> <c-p>

" 切换 buffer
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> [n :bnext<CR>

"--------------scrolling--------------------
set mouse=v
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>
"--------------scrolling--------------------



" === nerdtree
map tg :NERDTreeToggle<CR>

" === undotree
nnoremap <F4> :UndotreeToggle<cr>

" === Tagbar
" map tg :TagbarToggle<CR>
nnoremap tt :TagbarToggle<CR>
let g:tagbar_width=40
let g:tagbar_zoomwidth=90
let g:tagbar_sort = 0
let g:tagbar_autofocus = 1  "这是tagbar一打开，光标即在tagbar页面内，默认在vim打开的文件内
"开启自动预览(随着光标在标签上的移动，顶部会出现一个实时的预览窗口)
" let g:tagbar_autopreview = 1
" 打开cpp 文件自动 打开tagbar
" autocmd BufReadPost *.cpp,*.c,*.h,*.cc,*.cxx call tagbar#autoopen()

" === ale
"let g:ale_sign_column_always = 1
""自定义error和warning图标
"let g:ale_sign_error = '✗'
"let g:ale_sign_warning = 'w'
""在vim自带的状态栏中整合ale
"let g:ale_statusline_format = ['✗ %d', 'w %d', '✔ OK']
""显示Linter名称,出错或警告等相关信息
"let g:ale_echo_msg_error_str = 'E'
"let g:ale_echo_msg_warning_str = 'W'
"let g:ale_echo_msg_format = '[%linter%] %code %%s'
"let g:ale_lint_on_text_changed = 'normal'
"let g:ale_lint_on_insert_leave = 1
"let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
"let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
"let g:ale_c_cppcheck_options = ''
"let g:ale_cpp_cppcheck_options = ''
""打开文件时不进行检查
"let g:ale_lint_on_enter = 0

" === airline ============================================
"" airline settings.
let g:airline_theme = 'bubblegum'
let g:airline_powerline_fonts = 1
" 关闭状态显示空白符号计数,这个对我用处不大"
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'

"打开tabline功能,方便查看Buffer和切换，这个功能比较不错"
"我还省去了minibufexpl插件，因为我习惯在1个Tab下用多个buffer"
"顶部tab显示
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" 设置切换tab的快捷键 <\> + <-> 切换到前一个 tab
nmap <leader>- <Plug>AirlineSelectPrevTab
" 设置切换tab的快捷键 <\> + <+> 切换到后一个 tab
nmap <leader>+ <Plug>AirlineSelectNextTab
" 设置切换tab的快捷键 <\> + <w> 退出当前的 tab
nmap <leader>w :bp<cr>:bd<cr>

let g:airline#extensions#tabline#buffer_idx_format = {
       \ '0': '0 ',
       \ '1': '1 ',
       \ '2': '2 ',
       \ '3': '3 ',
       \ '4': '4 ',
       \ '5': '5 ',
       \ '6': '6 ',
       \ '7': '7 ',
       \ '8': '8 ',
       \ '9': '9 '
       \}
" 设置切换tab的快捷键 <\> + <i> 切换到第i个 tab
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
" === airline ============================================

" let g:Powerline_symbols = 'fancy'
" set fillchars+=stl:\ ,stlnc:\
" let g:Powerline_mode_V="V·LINE"
" let g:Powerline_mode_cv="V·BLOCK"
" let g:Powerline_mode_S="S·LINE"
" let g:Powerline_mode_cs="S·BLOCK"

"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告

"nmap sn <Plug>(ale_next_wrap)
""<Leader>s触发/关闭语法检查
"nmap <Leader>s :ALEToggle<CR>
""<Leader>d查看错误或警告的详细信息
"nmap <Leader>d :ALEDetail<CR>

"使用clang对c和c++进行语法检查，对python使用pylint进行语法检查
"let g:ale_linters = {
"\   'c++': ['clang'],
"\   'c': ['clang'],
"\   'python': ['pylint'],
"\}


" nmap <C-/>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>d :Rgw <C-R>=expand("<cword>")<CR><CR>
"查看文件列表
nmap <Leader>f :Files <CR>
" 查看当前 Buffer 
nmap <Leader>r :Rg <CR>
nmap <Leader>b :Buffers<CR> 
":BTags [QUERY]	Tags in the current buffer
nmap <Leader>t :BTags<CR>
nmap <Leader>g :Tags<CR>

":Tags [QUERY]	Tags in the project (ctags -R)

nnoremap <M-b> :bprevious<CR>
nnoremap <M-n> :bnext<CR>
" let g:fzf_action = { '<Leader>b': 'edit' }

" ctags 设置
" set autochdir set tags=tags
set tags=./tags;,tags
nnoremap <c-;> <c-]>
nmap <F1> :tselect  <C-R>=expand("<cword>")<CR>
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
  " else search cscope.out elsewhere
  else
      let cscope_file=findfile("cscope.out", ".;")
      let cscope_pre=matchstr(cscope_file, ".*/")
      if !empty(cscope_file) && filereadable(cscope_file)
          exe "cs add" cscope_file cscope_pre
      endif
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

" <C-R>后再输入<C-W>就是当前光标下单词的意思，<C-R><C-W>与<C-R>=expand("<cword>")应该是等效的
"nmap <C-/>s :cs find s <C-R>=expand("<cword>")<CR><CR>
"F5 查找c语言符号，函数名，宏、枚举等出现的地方
"F6 查找字符串； F7 查找函数被谁调用了， F8 查找函数定义； 
nmap <silent> <F5> :cs find s <C-R>=expand("<cword>")<CR><CR> :botright copen<CR><CR> 
nmap <silent> <F6> :cs find t <C-R>=expand("<cword>")<CR><CR> :botright copen<CR><CR>
nmap <silent> <F7> :cs find c <C-R>=expand("<cword>")<CR><CR> :botright copen<CR><CR>
nmap <silent> <F8> :cs find g <C-R>=expand("<cword>")<CR><CR> 
"---------------cscope------------------ 

"--------------------------------------------------------------------------------
" QuickFix
"--------------------------------------------------------------------------------
nmap <F1> :cp<cr>   " 切换到上一个结果
nmap <F2> :cn<cr>   " 切换到下一个结果
" :cclose  关闭 quickfix 窗口




"-------------ultisnips -----------------------
" ultisnips 代码片段补全
" "插入模式下直接通过ii键来触发UltiSnips的代码块补全
" let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsExpandTrigger="<c-b>"
"iI弹出UltiSnips的可用列表,不常用的, 所以这里设置成了特殊的iI映射
" let g:UltiSnipsListSnippets="iI"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
"--------------ultisnips ----------------------

"-------------vim-commentary-----------------------
" gc: 可视模式下，注释当前选中的部分
" gcc: 注释当前行（普通模式）
autocmd FileType java,c,cpp set commentstring=//\ %s
"-------------vim-commentary-----------------------


"-------------------------smooth scroll-----------------------------
" nmap <a-u> <c-u>
" nmap <a-s> <c-d>
" nmap <a-d> <c-d>
nmap <c-s> <c-u>
noremap <silent> <c-u> :call smooth_scroll#up(20, 10, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(20, 10, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 4, 2)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 4, 2)<CR>
" noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 2)<CR>
" noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 2)<CR>

"If you like the scrolling to go a bit smoother, you can use these mappings:
" map <C-U> <C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y>
" map <C-D> <C-E><C-E><C-E><C-E><C-E><C-E><C-E>
"-------------------------smooth scroll-----------------------------

"------------------------vim-gutentags-------------------------
" gutentags搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归 "
let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']

" 所生成的数据文件的名称 "
let g:gutentags_ctags_tagfile = '.tags'

" 同时开启 ctags 和 gtags 支持：
let g:gutentags_modules = []
if executable('ctags')
    let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
    let g:gutentags_modules += ['gtags_cscope']
endif

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录 "
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" 检测 ~/.cache/tags 不存在就新建 "
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

" 配置 ctags 的参数 "
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+x']
let g:gutentags_ctags_extra_args += ['--c-kinds=+x']
" let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
" let g:gutentags_ctags_extra_args += ['--c-kinds=+px']


" 如果使用 universal ctags 需要增加下面一行，老的 Exuberant-ctags 不能加下一行
" let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']
" 禁用 gutentags 自动加载 gtags 数据库的行为
" let g:gutentags_auto_add_gtags_cscope = 0
"
" <leader>cg - 查看光标下符号的定义
" <leader>cs - 查看光标下符号的引用
" <leader>cc - 查看有哪些函数调用了该函数
" <leader>cf - 查找光标下的文件
" <leader>ci - 查找哪些文件 include 了本文件

"------------------------vim-gutentags-------------------------
"-------------------------vim-interestingwords---------------------
" let g:interestingWordsDefaultMappings = 0 if to disable default mapping
let g:interestingWordsGUIColors = ['#8CCBEA', '#A4E57E', '#FFDB72', '#FF7272', '#FFB3FF', '#9999FF']


"-------------------------vim-interestingwords---------------------


"--------------------------vim-gitgutter-------------------------------

" turn line number highlighting on 
" :GitGutterLineNrHighlightsEnable

" jump to next hunk (change): ]c
" jump to previous hunk (change): [c.

" stage the hunk with <Leader>hs or
" undo it with <Leader>hu.
let g:gitgutter_show_msg_on_hunk_jumping = 1
"--------------------------vim-gitgutter-------------------------------

nmap <M-p> j:PreviewQuickfix<cr>
nmap <M-o> k:PreviewQuickfix<cr>
nmap <M-c> :PreviewClose<cr>:cclose<cr>
autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>

noremap <m-u> :PreviewScroll -1<cr>
noremap <m-d> :PreviewScroll +1<cr>

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Plug 'bling/vim-bufferline'
" Plug 'itchyny/lightline.vim'
" Plug 'Lokaltog/vim-powerline'

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

" Underlines the word under the cursor_
Plug 'https://github.com/itchyny/vim-cursorword'

" Word highlighting and navigation throught out the buffer.
Plug 'https://github.com/lfv89/vim-interestingwords' "<Leader>k

" 强化版检索式移动
Plug 'easymotion/vim-easymotion'

" 模糊搜索
" Plug '/home/wyl/.fzf/bin/fzf'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" 代码片段补全
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" 注释
Plug 'tpope/vim-commentary'

" 平滑滚动，防止丢失失去视觉上下文
Plug 'terryma/vim-smooth-scroll'

" Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
" Plug 'kien/ctrlp.vim'

Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-fugitive'

" Plug 'octol/vim-cpp-enhanced-highlight'

" colorscheme:
Plug 'altercation/vim-colors-solarized'
Plug 'lifepillar/vim-solarized8'
Plug 'morhetz/gruvbox'

Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'

Plug 'skywind3000/vim-preview'
" Plug 'ervandew/supertab'
"
Plug 'liuchengxu/vim-which-key'

call plug#end()

" 使用 ss 启用, 快速移动光标到某个位置
nmap ss <Plug>(easymotion-s2)

" vi的编辑模式下实现自动补全功能命令默认是：Ctrl+n、Ctrl+p
" tab自动补全配置
function! CleverTab()
        if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
                return "\<Tab>"
        else
                return "\<C-N>"
        endif
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>
"-----------------------------------------------------------------------

