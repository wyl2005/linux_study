" 开启语法高亮  
"
"
let mapleader=" "

syntax on
set encoding=utf-8
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
"set termencoding=utf-8
set nocompatible

set noswapfile

"set mouse=a
"set mouse=vi
set mouse=v

" updatetime also controls the delay before vim writes its swap file 500ms
set updatetime=200

set autowrite " 自动把内容写回文件: 如果文件被修改过 在每个:next"

" vim下可以这样写入tab键：ctr+v+i,会写入一个tab键
set tabstop=4 " 设置tab键的宽度
set shiftwidth=4 " 设置每层缩进空格数
set smarttab  "根据文件中其他地方的缩进空格个数来确定一个 tab 是多少个空格
set expandtab " 修改tab为4个空格 expandtab/noexpandtab：将 tab 扩展/不扩展成空格


set backspace=2 " 设置退格键可用

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

" :bufdo命令表示把后面的命令应用到所有buffer中的文件。
" :e  重新载入当前文件：
" :e! #放弃当前修改，强制重新载入
nnoremap Q :q<CR> "bd 关闭buffer"
" nnoremap <C-q> :q<CR> 
nnoremap s <nop>
nnoremap S <nop>
nnoremap D <nop>
nnoremap U <nop>
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

" INSERT 模式下使用 EMACS 键位
" inoremap <c-a> <home>
" inoremap <c-e> <end>
" inoremap <c-d> <del>
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
" 命令模式的快速移动
" cnoremap <c-h> <left>
" cnoremap <c-j> <down>
" cnoremap <c-k> <up>
" cnoremap <c-l> <right>
" cnoremap <c-a> <home>
" cnoremap <c-e> <end>
" cnoremap <c-d> <del>

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
nmap <leader>w :bd<cr>

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
nmap <Leader>D :Leaderf rg <C-R>=expand("<cword>")<CR><CR>
"查看文件列表
nmap <Leader>f :Files <CR>
" 打开最近使用的文件 MRU，进行模糊匹配
nmap <leader>m :LeaderfMru<cr>
nmap <Leader>r :Rg <CR>
" 查看当前 Buffer 
nmap <Leader>b :LeaderfBuffer<CR> 
":BTags [QUERY]	Tags in the current buffer
nmap <Leader>t :BTags<CR>
nmap <Leader>g :Tags<CR>
" nmap <Leader>g :LeaderfTag<CR>

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
let g:gutentags_project_root = ['.svn', '.git']

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

" change focus to quickfix window after search (optional).
let g:gutentags_plus_switch = 1

" You can disable the default keymaps by:
" let g:gutentags_plus_nomap = 1


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
"

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
" let g:gitgutter_show_msg_on_hunk_jumping = 1
"--------------------------vim-gitgutter-------------------------------

"-------------------skywind3000/vim-preview---------------------
nmap <M-p> j:PreviewQuickfix<cr>
nmap <M-o> k:PreviewQuickfix<cr>
nmap <M-c> :PreviewClose<cr>:cclose<cr>
autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>

autocmd FileType qf noremap <silent><buffer> <m-u> :PreviewScroll -1<cr>
autocmd FileType qf noremap <silent><buffer> <m-d> :PreviewScroll +1<cr>
"-------------------skywind3000/vim-preview---------------------

"------------------Leaderf-------------------
 " CTRL+p 打开文件模糊匹配
" let g:Lf_ShortcutF = '<c-p>'

"ALT+n 打开 buffer 模糊匹配
" let g:Lf_ShortcutB = '<m-n>'

" CTRL+n 打开最近使用的文件 MRU，进行模糊匹配
" noremap <c-n> :LeaderfMru<cr>

" ALT+p 打开函数列表，按 i 进入模糊匹配，ESC 退出
" noremap <m-p> :LeaderfFunction!<cr>

" ALT+SHIFT+p 打开 tag 列表，i 进入模糊匹配，ESC退出
" noremap <m-P> :LeaderfBufTag!<cr>

" ALT+n 打开 buffer 列表进行模糊匹配
" noremap <m-n> :LeaderfBuffer<cr>

" ALT+m 全局 tags 模糊匹配
" noremap <m-m> :LeaderfTag<cr>

" 最大历史文件保存 2048 个
let g:Lf_MruMaxFiles = 2048

" ui 定制
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }

" 如何识别项目目录，从当前文件目录向父目录递归知道碰到下面的文件/目录
let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')

" 显示绝对路径
let g:Lf_ShowRelativePath = 1

" 模糊匹配忽略扩展名
let g:Lf_WildIgnore = {
            \ 'dir': ['.svn','.git','.hg'],
            \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
            \ }

" MRU 文件忽略扩展名
let g:Lf_MruFileExclude = ['*.so', '*.exe', '*.py[co]', '*.sw?', '~$*', '*.bak', '*.tmp', '*.dll']
let g:Lf_StlColorscheme = 'powerline'

" 禁用 function/buftag 的预览功能，可以手动用 p 预览
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}

" 使用 ESC 键可以直接退出 leaderf 的 normal 模式
let g:Lf_NormalMap = {
        \ "File":   [["<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>']],
        \ "Buffer": [["<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<cr>']],
        \ "Mru": [["<ESC>", ':exec g:Lf_py "mruExplManager.quit()"<cr>']],
        \ "Tag": [["<ESC>", ':exec g:Lf_py "tagExplManager.quit()"<cr>']],
        \ "BufTag": [["<ESC>", ':exec g:Lf_py "bufTagExplManager.quit()"<cr>']],
        \ "Function": [["<ESC>", ':exec g:Lf_py "functionExplManager.quit()"<cr>']],
        \ }
"-----------------------LeaderF--------------------------------

"-----------------------YCM--------------------------------
" let g:ycm_server_python_interpreter='/usr/bin/python'
" let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
" set completeopt=0
set completeopt=menu,menuone
let g:ycm_add_preview_to_completeopt = 0           "关闭原型预览
let g:ycm_complete_in_strings=1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_disable_signature_help = 1


let g:ycm_show_diagnostics_ui = 0                  "关闭语法提示
let g:ycm_complete_in_comments=1                   " 补全功能在注释中同样有效
let g:ycm_confirm_extra_conf=0                     " 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_collect_identifiers_from_tags_files=1    " 开启 YCM 标签补全引擎
let g:ycm_min_num_of_chars_for_completion=2        " 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0                         " 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1           " 语法关键字补全
let g:ycm_goto_buffer_command = 'horizontal-split' " 跳转打开上下分屏

"let g:ycm_filetype_whitelist = {
" "c":1,
" "cpp":1,
" "python":1,
" "objc":1,
" "sh":1,
" "zsh":1,
" "zimbu":1,
" "Makefile":1,
" "mk":1,
" }

"-----------------------YCM--------------------------------

nmap <leader>n /<C-R>=expand("<cword>")<CR><CR>
nmap <leader>N ?<C-R>=expand("<cword>")<CR><CR>

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
Plug 'Valloric/YouCompleteMe'
" Plug 'neoclide/coc.nvim'


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


" 平滑滚动，防止丢失失去视觉上下文
Plug 'terryma/vim-smooth-scroll'

" Plug 'psliwka/vim-smoothie'

" Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
" Plug 'kien/ctrlp.vim'

" 在侧边栏显示一个git修改状态,
" Plug 'airblade/vim-gitgutter'

"Fugitive is the premier Vim plugin for Git. Git blame, Git diff
" :Git diff
" :Git blame
Plug 'tpope/vim-fugitive'

" Plug 'octol/vim-cpp-enhanced-highlight'

" colorscheme:
Plug 'altercation/vim-colors-solarized'
Plug 'lifepillar/vim-solarized8'
Plug 'morhetz/gruvbox'

Plug 'ludovicchabant/vim-gutentags'

" 提供 GscopeFind 命令并自动处理好 gtags 数据库切换
" 支持光标移动到符号名上：<leader>cg 查看定义，<leader>cs 查看引用
Plug 'skywind3000/gutentags_plus'

Plug 'skywind3000/vim-preview'
" Plug 'ervandew/supertab'
"
Plug 'liuchengxu/vim-which-key'

" LeaderF：CtrlP / FZF 的超级代替者，文件模糊匹配，tags/函数名 选择
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }

" if/end/endif/endfunction补全
Plug 'tpope/vim-endwise'

" provides a start screen
" Plug 'mhinz/vim-startify'

" Plug 'tpope/vim-unimpaired'

" 在侧边栏显示一个git修改状态,
Plug 'mhinz/vim-signify'

" 异步模式
" Plug 'skywind3000/asyncrun.vim'

" Plug 'rhysd/clever-f.vim'

" 注释
Plug 'tpope/vim-commentary'

call plug#end()


" set timeoutlen=500
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


" vim-signify
" SignifyHunkDiff
" SignifyDiff
" SignifyHunkUndo
" ]c   Jump to the next hunk.
" [c   Jump to the previous hunk.

" ]C   Jump to the last hunk.
" [C   Jump to the first hunk.
"
" 自动打开 quickfix window ，高度为 6
" let g:asyncrun_open = 6

" " 任务结束时候响铃提醒
" let g:asyncrun_bell = 1
"
"
" set tw=140                       " 140字符自动换行
" set et                           " expandtab，用空格代替Tab键
" retab                            " 打开vim时把已有的Tab全部转换成空格
" au InsertLeave *.eml write       " 每次退出插入模式时自动保存
"

