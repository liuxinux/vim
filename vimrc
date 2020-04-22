"**********一般设置**************
""设置行号
set nu			"显示行号
set relativenumber	"相对行号

""外观
set cursorcolumn	"高亮当前列
set cursorline		"高亮当前行
"set textwidth=80	"行宽

set laststatus=2
"set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%] "显示文件名：总行数，总的字符数
set ruler		"enable ruler
set magic		"set magic
set showmode
set showcmd

set nocompatible	"不与vi兼容
" indent: 如果用了:set indent,:set ai 等自动缩进，想用退格键将字段缩进的删掉，必须设置这个选项。否则不响应。
"eol:如果插入模式下在行开头，想通过退格键合并两行，需要设置eol。
"start：要想删除此次插入前的输入，需设置这个。"
set backspace=indent,eol,start	
set encoding=utf-8	"使用 utf-8 编码
set t_Co=256		"启用256色

""缩进
set autoindent		"按下回车键后，下一行的缩进会自动跟上一行的缩进保持一致。
set ts=4			"Tab缩进为4个空格"
set tabstop=4		"Tab缩进为4个空格"
set shiftwidth=4

set showmatch		"高亮配对括号
set hlsearch		"高亮搜索内容
set ignorecase		"忽略大小写

set autochdir		"自动切换工作目录
set wildmenu
set wildmode=longest:list,full


"" 开启文件类型侦测
filetype on
"" 根据侦测到的不同类型加载对应的插件
filetype plugin on
"" 自适应不同语言的智能缩进
filetype indent on

""语法高亮
syntax enable
syntax on

"**********NERDTree设置**********
""1.消除“^G”符号
"let g:NERDTreeNodeDelimiter = "\u00a0"

""2.当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

""3. 显示行号
let NERDTreeShowLineNumbers=1

""4. 忽略以下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']

""5. 是否显示隐藏文件
"let NERDTreeShowHidden=1

""6. 打开文件自动打开
"autocmd vimenter * NERDTree

""7. 设置NerdTree打开的快捷键,可自行更改
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>

""8. 位置
"""左边
let g:NERDTreeWinPos="left"
"""右边
"let g:NERDTreeWinPos="right"

"**********nerdtree-git-plugin**********
""1. git标识设置
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

"**********Tagbar*********
let g:tagbar_width=40
map <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1   " 打开列表后自动跳转到列表

"**********Air-line**********
""1. 显示顶部标签
let g:airline#extensions#tabline#enabled = 1
""2. 
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
"这个是安装字体后 必须设置此项 
let g:airline_powerline_fonts = 1
 "设置切换Buffer快捷键"
nnoremap <C-N> :bn<CR>
nnoremap <C-P> :bp<CR>

"********** "ChangesPlugin 文件显示修改痕迹" **********
let g:changes_autocmd=1
let g:changes_use_icons = 0
"let g:changes_respect_SignColumn = 1
let g:changes_sign_text_utf8 = 1

"let g:changes_linehi_diff = 1
" hi ChangesSignTextAdd ctermbg=yellow ctermfg=black guibg=green
" hi ChangesSignTextDel ctermbg=white  ctermfg=black guibg=red
" hi ChangesSignTextCh  ctermbg=black  ctermfg=white guibg=blue

" ********** "YCM" **********
  let g:ycm_warning_symbol = '✹'                          " 设置语法警告图案
  let g:ycm_show_diagnostics_ui = 1                       " 1:开启语法提示
  let g:ycm_min_num_of_chars_for_completion=1             " 从第1个键入字符就开始罗列匹配项
  let g:ycm_cache_omnifunc=0                              " 0:禁止缓存匹配项，每次都重新生成匹配项
  " let g:ycm_goto_buffer_command = 'horizontal-split'    " 跳转打开上下分屏
  let g:ycm_goto_buffer_command = 'vertical-split'        " 跳转打开左右分屏
  let g:ycm_key_list_stop_completion = ['<C-y>']
  let g:ycm_key_list_select_completion = ['<Down>']
  let g:ycm_key_list_previous_completion = ['<Up>']
  " let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
  " let g:ycm_python_binary_path = 'python'               " 不用
  " 设置YCM检错快捷键
  " nmap <F4> :YcmDiags<cr>

"********** rainbow*********
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cscope 自动加载cscope.out文件
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("cscope")  
    set csprg=/usr/bin/cscope  
    set csto=0 
    set cst  
    set csverb  
    set cspc=3 
    "add any database in current dir  
    if filereadable("cscope.out")  
        cs add cscope.out  
    "else search cscope.out elsewhere  
    else 
        let cscope_file=findfile("cscope.out",".;")  
        let cscope_pre=matchstr(cscope_file,".*/")  
        if !empty(cscope_file) && filereadable(cscope_file)  
            set nocsverb
            exe "cs add" cscope_file cscope_pre
            set csverb
        endif        
    endif  
endif
