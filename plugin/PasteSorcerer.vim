" Paste regardless of how it is Yanked
" Last Change: 2022 May 03
" Maintainer: svban

if exists("g:loaded_pastesorcerer")
  finish
endif
let g:loaded_pastesorcerer = 1

let s:save_cpo = &cpo
set cpo&vim

" Paste yanked line without line breaks, after/before cursor position
    " Doesn't work with count, but theres no need for it
    function! s:PasteInLine(afterOrBefore)
        exe 'let s:myContent = @' . v:register
        let s:myContent = s:myContent->substitute('\_s\+', ' ', 'g')->trim()

        " Paste new content
        let s:reg_save = getreg('k')
        let s:regtype_save = getregtype('k')
        call setreg('k', s:myContent, 'c')
        execute 'norm! "k' . a:afterOrBefore
        call setreg('k', s:reg_save, s:regtype_save)
    endfunction
    nnoremap <silent> <Plug>PSInLinep :call <SID>PasteInLine("p")<CR>
    nnoremap <silent> <Plug>PSInLineP :call <SID>PasteInLine("P")<CR>

" Paste yanked words on a new line
    function! s:PasteNewLine(how) abort
        let [body, type] = [getreg(v:register), getregtype(v:register)]
        if type ==# 'V'
            exe 'normal! "' . v:register . a:how
        else
            call setreg(v:register, body, 'l')
            exe 'normal! "' . v:register . a:how
            call setreg(v:register, body, type)
        endif
    endfunction
    nnoremap <silent> <Plug>PSNewLinep :call <SID>PasteNewLine(']p')<CR>
    nnoremap <silent> <Plug>PSNewLineP :call <SID>PasteNewLine('[p')<CR>

" Paste without Leading/Trailing Whitespace
    function! s:NoWSPaste(afterOrBefore)
        exe 'let s:myContent = @' . v:register
        let s:myContent = substitute(s:myContent, '^\s*', '', 'g')
        let s:myContent = substitute(s:myContent, '\s*\n', '\n', 'g')
        let s:myContent = substitute(s:myContent, '\n\s*', '\n', 'g')
        " Paste new content
        let s:reg_save = getreg('k')
        let s:regtype_save = getregtype('k')
        call setreg('k', s:myContent)
        execute 'norm! "k' . a:afterOrBefore
        call setreg('k', s:reg_save, s:regtype_save)
    endfunction
    nnoremap <silent> <Plug>PSNoWSp :call <SID>NoWSPaste('p')<CR>
    nnoremap <silent> <Plug>PSNoWSP :call <SID>NoWSPaste('P')<CR>

let &cpo = s:save_cpo
unlet s:save_cpo
