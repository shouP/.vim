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
	" autocmd FileType c,cpp	setlocal includeexpr=substitute(v:fname,'^\\/','','') | setlocal path+=./;/

	"-----------------------------------------------------------------------
	" 各種パスの設定
	"-----------------------------------------------------------------------
	autocmd FileType c,cpp setlocal path+=$INCLUDEPATHLIST
	autocmd FileType c,cpp setlocal tags=/Users/sizumi/proj/pioneer/tags,$VIMTAGFILELIST,./tags;~

	" NeoCompleteの設定
	autocmd BufWritePost *.c,*.cpp,*.h  NeoCompleteBufferMakeCache
	autocmd BufWritePost *.c,*.cpp,*.h  NeoCompleteTagMakeCache
	autocmd BufWritePost *.c,*.cpp,*.h  NeoCompleteMemberMakeCache

augroup END "}}}
