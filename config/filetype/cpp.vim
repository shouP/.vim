augroup SourceCodeSettings " {{{
	autocmd!
	autocmd FileType c  	setlocal syntax=c.doxygen
	autocmd FileType cpp  	setlocal syntax=cpp.doxygen
	autocmd FileType c,cpp  setlocal foldmethod=syntax
	autocmd FileType c,cpp  setlocal fdn=5
	" オープン時の折りたたみレベル設定
	autocmd FileType c,cpp  setlocal foldcolumn=0
	autocmd FileType c,cpp  setlocal foldminlines=10
	autocmd FileType c,cpp  setlocal fdls=99

augroup END "}}}
