augroup AllType " {{{
	autocmd BufNewFile,BufRead * set iminsert=0
	autocmd FileType *  	execute printf("setlocal dict=$VIMRUNTIME/dict/%s.dict", &filetype)
augroup END "}}}


