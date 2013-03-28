" RainoXu   <tblonggang@gmail.com>
" Homepage  <http://www.rainoxu.com>

"常规检查
"========
if (v:version < 700)
    echoerr 'This _vimrc requires Vim 7 or later.'
    quit
endif

if has("gui_running")
	au GUIEnter * cd ~
	set cursorcolumn
endif

"保存 gvimrc后，自动应用最新的配置
au! bufwritepost .gvimrc source %

"自动语法检查配置
au BufWritePost,FileWritePost *.js,*.php call CheckSyntax(1)

"Markdown文件处理，添加指定的filetype
augroup markdown
	au! Bufread,BufNewFile *.mkd set filetype mkd	
	au! Bufread,BufNewFile *.mk set filetype mkd	
	au! BufRead *.mkd set ai formatoptions=tcroqn2 comments=n:&gt; filetype=markdown
	au! BufRead *.md set ai formatoptions=tcroqn2 comments=n:&gt; filetype=markdown
augroup end


"方法定义区
"==========
func! GetPWD()
    return substitute(getcwd(), "", "", "g")
endfunc

func! GetDateStamp()
    return strftime('%Y-%m-%d')
endfunc

func! SudoSave()
    :w !sudo tee %
    syn on
endfunc

func! ToggleHighLightSearch()
    if &hls
        set nohls
    else
        set hls
    endif
endfunc


"编辑器常用配置
"==============
syn on
filetype plugin on
filetype indent on

so $VIMRUNTIME/delmenu.vim
so $VIMRUNTIME/menu.vim
language message en_US.utf-8
let $LANG='en_US'

if &cp | set nocp | endif
set history=500
set nobackup
set noswapfile
set go=
set helplang=cn
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,gbk,gb18030,gb2312,cp936
set langmenu='en_US'
"set nowrap
set number
set autoindent
set smartindent
set autoread
set tabstop=4 shiftwidth=4
set bs=indent,eol,start
set ignorecase
set smartcase
set expandtab
set is
set foldmethod=marker
set magic
set noeb
set novb
set showcmd
set wildmenu
set wildmode=list:longest,full
set ruler
set rulerformat=%15(%c%V\ %p%%%)
set cursorline
set ls=2 
set shortmess=atI


"主题包配置
"==========
color molokai
nmap <leader>c1 :colorscheme molokai<cr>
nmap <leader>c2 :colorscheme dante<cr>
nmap <leader>c3 :colorscheme vanzan_color<cr>
nmap <leader>c4 :colorscheme lucius<cr>
nmap <leader>c5 :colorscheme sift<cr>
nmap <leader>c6 :colorscheme skittles_dark<cr>
nmap <leader>c7 :colorscheme molokai<cr>


"常用文件快捷打开
"================
nmap <leader>v :vsp ~/.gvimrc<cr>
nmap <leader>h :vsp /etc/hosts<cr>
nmap <leader>m :vsp /var/www/index.php<cr>


"常用快捷键配置
"==============
vnoremap <tab> >gv
vnoremap <s-tab> <gv
nmap <c-s> :w!<cr>
imap <c-s> <esc>:w!<cr>li
nmap ,w :w!<cr>
vmap ,w <esc>:w!<cr>
nmap ,sw :call SudoSave()<cr>
map H ^
map L $
map ,q :q!<cr>
nmap <c-t> :tabnew<cr>
nmap <leader>gbk :set fenc=gbk<cr>,w
nmap <leader>utf8 :set fenc=utf-8<cr>,w
nmap <silent> <F2> <ESC>:call ToggleHighLightSearch()<cr>

"让Linux也能使用ctrl+a
nmap <c-a> gg^vG$

"替换空白符
nmap <leader>ts :silent! :%s/\t/ /g<cr>

"跳转到最后的修改处
nmap sl `. 


"自动模板配置
"============
map nh :NewTemplateTab html<cr>
map np :NewTemplateTab php<cr>
map nj :NewTemplateTab javascript<cr>
map nc :NewTemplateTab css<cr>

"插件配置
"========
"日历插件
map ca :Calendar<cr>

"NerdTree插件
map nt :NERDTreeToggle<cr>
