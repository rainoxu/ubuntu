" RainoXu   <tblonggang@gmail.com>
" Homepage  <http://www.rainoxu.com>

"General
if (v:version < 700)
    echoerr 'This _vimrc requires Vim 7 or later.'
    quit
endif

func! GetPWD()
    retur substitute(getcwd(), "", "", "g")
endfunc

func! GetDateStamp()
    return strftime('%Y-%m-%d')
endfunc


"Editor Config
if &cp | set nocp | endif
set history=500
set cmdheight=2
set nobackup
set noswapfile
set go=
set helplang=cn
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,gbk,gb18030,gb2312,cp936
set langmenu='en_US'
let $LANG='en_US'
language message en_US.utf-8

so $VIMRUNTIME/delmenu.vim
so $VIMRUNTIME/menu.vim

set showcmd
set wildmenu
set wildmode=list:longest,full
set ruler
set rulerformat=%15(%c%V\ %p%%%)
set cursorline

set ls=2 

"color watermark
color lucius

set shortmess=atI

if has("gui_running")
	au GUIEnter * cd ~
	
	"‘› ±◊¢ ÕµÙ––”Î¡–µƒπ‚±Í÷∏ æπ¶ƒ‹
	set cursorcolumn
endif


au! bufwritepost _vimrc source %    "±£¥Ê_vimrc∫Û£¨◊‘∂Ø”¶”√◊Ó–¬µƒ≈‰÷√

if has("win32")
	"au! bufwritepost hosts call RefreshSystemDNS()
	"set guifont="Microsoft Yahei":h12:cANSI
	"set guifontwide=NSimSun:h12
	au GUIEnter * simalt ~x

	nmap <leader><leader> :simalt ~x<cr>
	nmap <leader>v :vsp $VIM./_vimrc<cr>
	nmap <leader>h :vsp C:\windows\system32\drivers\etc\hosts<cr>
endif


"File Config
filetype plugin on
filetype indent on

augroup markdown
	au! Bufread,BufNewFile *.mkd set filetype mkd	
	au! Bufread,BufNewFile *.mk set filetype mkd	

	au! BufRead *.mkd set ai formatoptions=tcroqn2 comments=n:&gt; filetype=mkd
	au! BufRead *.md set ai formatoptions=tcroqn2 comments=n:&gt; filetype=mkd
augroup end

"Code Config
set nowrap
set number
set autoindent
set smartindent
set autoread
syn on
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


"Key Map Config
vnoremap <tab> >gv
vnoremap <s-tab> <gv
nmap ,w :w!<cr>li
nmap ,sw :call SudoSave()<cr>
vmap ,w <ESC>:w!<cr>
map H ^
map L $
nmap <c-s> :w<cr>
map ,q :q!<cr>
imap <c-j> <c-n>
imap <c-k> <c-p>
nmap <c-t> :tabnew<cr>
inoremap <s-tab> <esc>V<s-tab>  "“…Œ 
vmap <c-y>                      "“…Œ 
vmap x                          "“…Œ 
nmap <tab> <C-W>                "“…Œ 

imap <c-s> <esc>:w<cr>
nmap <c-a> ggvG "Œ™¡À»√Linux“≤ƒ‹ π”√ctrl+a
nmap <silent> <F2> <ESC>:call ToggleHighLightSearch()<cr>

nmap <leader>ts :silent! :%s/\t/ /g<cr>
nmap <leader>gbk :set fenc=gbk<cr>,w
nmap <leader>utf8 :set fenc=utf-8<cr>,w

" Ë∑≥ËΩ¨Âà∞ÊúÄÂêéÁöÑ‰øÆÊîπÂ§Ñ
nmap sl `. 

" Vim Wiki
if has("win32")
    let $VIMFILES=$VIM.'/vimfiles'
else
    let $VIMFILES=$VIM.'/.vim'
endif

let g:vimwiki_menu=''
let g:vimwiki_hl_cb_checked=1
let g:vimwiki_camel_case=0
let g:vimwiki_valid_html_tags='b,i,s,u,sub,sup,kbd,del,br,hr,div,code,h1'


"Function Definitions
func! ToggleHighLightSearch()
    if &hlsd
        set nohls
    else
        set hls
    endif
endfunc

func! RefreshFirefox()
    !echo '' > /tmp/refresh.firefox
    syn on
endfunc

func! ReloadCSSFirefox()
    !echo '' > /tmp/reloadCSS.firefox
    syn on
endfunc

func! RefreshSystemDNS()
    !start cmd /C ipconfig /flushdns
    syn on
endfunc

func! SudoSave()
    :w !sudo tee %
    syn on
endfunc

" =============
" Plugin Config
" =============

" ◊‘∂Ø”Ô∑®ºÏ≤È≈‰÷√
"au BufWritePost,FileWritePost *.js,*.php call CheckSyntax(1)
let g:checksyntax_auto=0 " ≤ª◊‘∂ØºÏ≤È

" TagList ≈‰÷√
if has("win32")
    let Tlist_Ctags_Cmd='ctags'
endif

let Tlist_Use_Right_Window=1
let Tlist_File_Fold_Auto_Close=1
let Tlist_Exit_OnlyWindow=1
nmap tl :TlistToggle<cr>

" ◊‘∂Øƒ£∞Â≈‰÷√
map nh :NewTemplateTab html<cr>
map np :NewTemplateTab php<cr>
map nj :NewTemplateTab javascript<cr>
map nc :NewTemplateTab css<cr>

" »’¿˙≈‰÷√
map ca :Calendar<cr>            "–Ë“™∞≤◊∞Calender≤Âº˛

" NerdTree≈‰÷√
map nt :NERDTreeToggle<cr>

