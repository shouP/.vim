"-------------------------------------------------------------------------------
" 行末の空白を削除する。
"-------------------------------------------------------------------------------
" Comment or uncomment lines from mark a to mark b.
function! RemoveSpace(a, b)
	exe "'".a:a.",'".a:b . 's/\v(.+\S)\s+$/\1/e'
endfunction

" Comment lines in marks set by g@ operator.
function! DoRemoveSpace(type)
	call RemoveSpace( '[', ']')
endfunction

nnoremap <Leader>d :set opfunc=DoRemoveSpace<CR>g@
vnoremap <Leader>d :call RemoveSpace('<','>')<CR>

