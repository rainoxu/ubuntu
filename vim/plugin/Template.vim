" Version: $Id: Template.vim 199 2008-10-08 07:12:49Z i.feelinglucky $
" File: Template.vim
" Maintainer: feelinglucky<i.feeilnglucky#gmail.com>
" Last Change: 2008/10/08
" Desption: create new file form template

let g:TemplatePath=$VIM.'/vimfiles/template/'
let g:TemplateCursorFlag='#cursor#'

" {{{ Source
function! NewTemplate(name, mode)
    let Template=g:TemplatePath.a:name.'.tpl'

    if !filereadable(Template)
        echo "Template ".a:name.": not exists!"
        return
    endif

    if a:mode == 'tab'
        tabnew
    else
        new
    endif

    execute 'setlocal filetype='.a:name
    let $Template=Template
    0r $Template
    unlet Template

    normal G
    delete G

    let hasfind=search(g:TemplateCursorFlag)
    if hasfind
        let line = getline('.')
        let repl = substitute(line, g:TemplateCursorFlag, '', '')
        call setline('.', repl)
    endif
endfunction

com! -nargs=1 -range=% NewTemplate call NewTemplate(<f-args>, 'window')
if v:version > 700
    com! -nargs=1 -range=% NewTemplateTab call NewTemplate(<f-args>, 'tab')
endif
