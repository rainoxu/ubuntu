" 注释用vim插件 
" 基于网络的某个方法
" @link http://youjf.com/2008/11/06/vim-%E5%A4%9A%E8%A1%8C%E6%B3%A8%E9%87%8A%E7%9A%84%E9%85%8D%E7%BD%AE%E4%BB%A3%E7%A0%81/
" @author qiaofu<amdgigabyte#gmail.com>
"
"功能说明:加入或删除注释//
"映射和绑定
nmap cm <Esc>:Setcomment<CR>
"imap <C-m> <Esc>:Setcomment<CR>
vmap cm <Esc>:SetcommentV<CR>
command! -nargs=0 Setcomment call s:SET_COMMENT()
command! -nargs=0 SetcommentV call s:SET_COMMENTV()

"非视图模式下所调用的函数
function! s:SET_COMMENT()
    let lindex=line(".")
    let str=getline(lindex)

    "查看当前是否为注释行
    let CommentMsg=s:IsComment(str)
    call s:SET_COMMENTV_LINE(lindex,CommentMsg[1],CommentMsg[0])
endfunction

"视图模式下所调用的函数
function! s:SET_COMMENTV()
    let lbeginindex=line("'<") "得到视图中的第一行的行数
    let lendindex=line("'>") "得到视图中的最后一行的行数
    let str=getline(lbeginindex)

    "查看当前是否为注释行
    let CommentMsg=s:IsComment(str)
    "为各行设置
    let i=lbeginindex
    while i<=lendindex
        call s:SET_COMMENTV_LINE(i,CommentMsg[1],CommentMsg[0])
        let i=i+1
    endwhile
endfunction

"设置注释
"index:在第几行
"pos:在第几列
"comment_flag: 0:添加注释符 1:删除注释符
function! s:SET_COMMENTV_LINE( index,pos, comment_flag )
    let poscur = [0, 0, 0, 0]
    let poscur[1]=a:index
    let poscur[2]=a:pos+1
    call setpos(".",poscur) "设置光标的位置

    if a:comment_flag==0
        "插入//
        exec "normal! i//"
    else
        "删除//
        exec "normal! xx"
    endif
endfunction

"查看当前是否为注释行并返回相关信息
"str:一行代码
function! s:IsComment(str)
    let ret= [0, 0] "第一项为是否为注释行（0,1）,第二项为要处理的列，
    let i=0
    let strlen=len(a:str)

        while i<strlen
        "空格和tab允许为"//"的前缀
        if !(a:str[i]==' ' ||    a:str[i] == '  ' )
            let ret[1]=i
            if a:str[i]=='/' && a:str[i+1]=='/'
                let ret[0]=1
            else
                let ret[0]=0
            endif
            return ret
        endif

        let i=i+1
    endwhile

    return [0,0]  "空串处理
endfunction
