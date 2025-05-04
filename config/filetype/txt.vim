augroup TextSettings "{{{
	autocmd!
	" autocmd BufReadPost *.txt  colorscheme desert
	autocmd BufReadPost *.txt  setlocal tabstop=2
	autocmd BufReadPost *.txt  setlocal shiftwidth=2
	" autocmd BufReadPost *.txt  setlocal fdm=indent
	" autocmd BufReadPost *.txt  call neocomplete#commands#_lock()
	autocmd BufReadPost *.gnu  	setlocal ft=gnuplot
augroup END "}}}

