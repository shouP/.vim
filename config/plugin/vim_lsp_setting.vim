if empty(globpath(&rtp, 'autoload/lsp.vim'))
	  finish
endif

function! s:on_lsp_buffer_enabled() abort
	"setlocal omnifunc=lsp#complete
	setlocal signcolumn=no
	nmap <buffer> gd <plug>(lsp-definition)
	nmap <buffer> gD <plug>(lsp-references)
	nmap <buffer> <f2> <plug>(lsp-rename)
	nmap <buffer> gh <plug>(lsp-hover)
	inoremap <expr> <cr> pumvisible() ? "\<c-y>\<cr>" : "\<cr>"
endfunction

augroup lsp_install
	au!
	autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

let g:lsp_diagnostics_enabled = 0
let g:lsp_diagnostics_echo_cursor = 0
let g:asyncomplete_auto_popup = 0
let g:asyncomplete_auto_completeopt = 0
let g:asyncomplete_popup_delay = 200
let g:lsp_text_edit_enabled = 0

command! LspDebug let lsp_log_verbose=1 | let lsp_log_file = expand('~/shm/lsp.log')

let g:lsp_settings = {
\  'kotlin-language-server': {
\    'workspace_config': {
\      'kotlin': {'compiler': {'jvm': {'target': '17'}}}
\    }
\  }
\}
