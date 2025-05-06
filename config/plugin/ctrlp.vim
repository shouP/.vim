nnoremap [ctrlp]f :<C-U>:CtrlP<CR>
nnoremap [ctrlp]b :<C-U>:CtrlPBuffer<CR>
nnoremap [ctrlp]m :<C-U>:CtrlPMRUFiles<CR>

let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_map = '<Nop>'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:30,results:50'
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v[\/]\.(obj|git|svn)$',
	\ 'file': '\v\.(exe|so(|\..*)|wav|png|jpg|dll|a|o(|\..*))$',
	\ }

let g:ctrlp_match_func = {'match': 'ctrlp_matchfuzzy#matcher'}

