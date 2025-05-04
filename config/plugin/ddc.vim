if empty(globpath(&rtp, 'plugged/ddc.vim/'))
	  finish
endif

call ddc#custom#patch_global('sources', [
 \ 'around',
 \ 'vim-lsp',
 \ 'file'
 \ ])

call ddc#custom#patch_global('sourceOptions', {
 \ '_': {
 \   'matchers': ['matcher_fuzzy'],
 \   'sorters': ['sorter_fuzzy'],
 \   'converters': ['converter_fuzzy'],
 \ },
 \ 'around': {'mark': 'Around'},
 \ 'vim-lsp': {
 \   'mark': 'LSP', 
 \   'matchers': ['matcher_head'],
 \   'forceCompletionPattern': '\.|:|->|"\w+/*'
 \ },
 \ 'file': {
 \   'mark': 'file',
 \   'isVolatile': v:true, 
 \   'forceCompletionPattern': '\S/\S*'
 \ }})

" SOURCE PARAM
"call ddc#custom#patch_global('sourceParams', {
"    \ 'dictionary': {'dictPaths':
"    \ ['C:\Users\hoge\Documents\hogehoge\koten',
"    \  'C:\Users\hoge\Documents\hogehoge\kanbun'],
"    \ 'showMenu': v:false
"    \ }
"    \ })
"   この例では2つの辞書（kotenとkanbun）を指定している
"   showMenu を v:true にすると補完候補の供給元である辞書ファイル名が表示される

call ddc#enable()
" inoremap <Tab> <Cmd>call pum#map#insert_relative(+1)<CR>
" inoremap <S-Tab> <Cmd>call pum#map#insert_relative(-1)<CR>

