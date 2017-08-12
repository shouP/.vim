set nocompatible
source $VIMRUNTIME/vimrc_example.vim

" Vimそのものの動作設定"{{{
"color setting
colorscheme jellybeans
set background=dark
"ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
set browsedir=buffer
"クリップボードをWindowsと連携
set clipboard=unnamed
"変更中のファイルでも、保存しないで他のファイルを表示
set hidden
"行末折り返しを禁止
set tw=0
"バックアップを作成しない
set nobackup
"スワップファイルを作成しない
set noswapfile
"括弧の入力時にカーソルを対応する括弧の上に一定時間表示させる
set showmatch
"マッチした括弧の始めを表示する時間(100ms order)
set matchtime=1
"コマンドライン補完するときに補完候補を表示する
set wildmenu
"テキスト幅は制限しない
set textwidth=0
"行折り返しの際は単語単位で切れるようにする
set linebreak
" Hack #76: Insert mode中で単語単位/行単位の削除を行なう
set backspace=indent,eol,start
if exists('g:Align_xstrlen') 
	"http://nanasi.jp/articles/vim/align/align_vim.html 
	" Alignを日本語環境で使用するための設定
	let g:Align_xstrlen = 3
	"実際には、この設定は完璧には機能していないようなので、 
	"現段階では設定を追加しなくても良いと思います。
endif
" カーソルライン表示
set cursorline
" Diffopt
" set diffopt=vertical
" GUIからアイコンを削除
set guioptions-=T
set guioptions-=m
"日本語の行の連結時には空白を入力しない
set formatoptions+=mM
" コマンド行の高さを減らす
set cmdheight=1
" ステータス行を無くして、画面描画をより広くする
set laststatus=0
let mapleader = ","
let g:netrw_winsize   = 30

" 右のスクロールバーを非表示
set guioptions-=m
" 左のスクロールバーを非表示
set guioptions-=L

"}}}

" 現在のファイルに対する動作設定"{{{
"新しい行のインデントを現在行と同じにする
set autoindent
"インクリメンタルサーチを行う
set incsearch
"listで表示される文字のフォーマットを指定する
set listchars=eol:$,tab:>\ ,extends:<
"行番号を表示する
set number
"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch
"検索時に大文字を含んでいたら大/小を区別
set smartcase
"新しい行を作ったときに高度な自動インデントを行う
set smartindent
"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
"検索をファイルの先頭へループしない
set nowrapscan
" タブを表示するときの幅
set tabstop=4
" タブを挿入するときの幅
set shiftwidth=4
" タブをタブとして扱う(スペースに展開しない)
set noexpandtab
set softtabstop=0
" 8進数として扱わない
set nrformats-=octal
" 検索時、大文字小文字を無視する
set ignorecase " デフォルトで行折り返ししない
set wrap!
"tagファイルを再帰的に遡って探す
" set tags=tags;
" leaderを変更
"}}}

" vimrcを編集した後にすぐ反映させるための設定とか"{{{
augroup VimrcReloadGrp
	autocmd!
	if !has('gui_running') && !(has('win32') || has('win64'))
		" .vimrcの再読込時にも色が変化するようにする
		autocmd VimrcReloadGrp BufWritePost $MYVIMRC nested source $MYVIMRC
	else
		" .vimrcの再読込時にも色が変化するようにする
		autocmd VimrcReloadGrp BufWritePost $MYVIMRC source $MYVIMRC |
					\if has('gui_running') | source $MYGVIMRC
		autocmd VimrcReloadGrp BufWritePost $MYGVIMRC if has('gui_running') | source $MYGVIMRC
	endif
augroup END

"入力モード時、ステータスラインのカラーを変更
augroup InsertHook
	autocmd!
	autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
	autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
augroup END
"}}}

" キーマップの割り当て maping "{{{
"-------------------------------------------------------------------------------
"Prefix
"-------------------------------------------------------------------------------
nnoremap [TagJump] <Nop>
nmap <silent><Leader>t [TagJump]
nnoremap [ChangeEncode] <Nop>
nmap <silent><Leader>l [ChangeEncode]
nnoremap [FuzzyFinder] <Nop>
nmap <silent><Leader>f [FuzzyFinder]


"-------------------------------------------------------------------------------
"実体
"-------------------------------------------------------------------------------
nnoremap [FuzzyFinder]f :<C-U>:FufFile<CR>
nnoremap [FuzzyFinder]b :<C-U>:FufBuffer<CR>
nnoremap [FuzzyFinder]m :<C-U>:FufMruFile<CR>

" 行の折り返しキーマップ
nnoremap <Leader>w  :<C-U>set wrap!<CR>
" スペース＋e でエクスプローラ起動
nnoremap <Leader>e :<C-U>VimFilerBufferDir -simple -split -winwidth=40 -no-quit<CR>
" nnoremap <Leader>e :<C-U>VimFilerBufferDir -split -winwidth=35 -no-quit<CR>

nnoremap <Leader>m :<C-U>marks<CR>
" .vimrcを開く
nnoremap <Leader>.  :<C-U>tabnew $MYVIMRC<CR>

"tag jumpの振る舞いをごっそり変えてみる。
nnoremap [TagJump]j  <C-]>
"tag pop / previouse
nnoremap [TagJump]p  :<C-U>pop<CR>
"tag next
nnoremap [TagJump]n  :<C-U>tag<CR>
"open tag on preview window
nnoremap [TagJump]w  <C-W>}
" select tag jump.
nnoremap [TagJump]t  g<C-]>

"カレントパスを現在編集中のファイルパスに変更
nnoremap <Leader>cd :<C-U>cd %:h<CR>

nnoremap [ChangeEncode]8 :<C-U>set encoding=utf-8<CR>
nnoremap [ChangeEncode]c :<C-U>set encoding=CP932<CR>

"バッファを切り替えて切替前のバッファを閉じる
nnoremap <Leader>bd :<C-U>bn \| bd# <CR>

" Quickfixpreviewを表示
nnoremap <Leader>o  :<C-U>copen<CR>

" 画面サイズ変更
noremap <LEFT>  <C-W><<ESC>
noremap <RIGHT>  <C-W>><ESC>
noremap <UP>  <C-W>-<ESC>
noremap <DOWN>  <C-W>+<ESC>
noremap <S-LEFT>  5<C-W><<ESC>
noremap <S-RIGHT>  5<C-W>><ESC>
noremap <S-UP>  5<C-W>-<ESC>
noremap <S-DOWN>  5<C-W>+<ESC>

"ページ送りを快適に
noremap <C-J> 4j
noremap <C-K> 4k
noremap <C-E> 4<C-E>
noremap <C-Y> 4<C-Y>

" x での削除をレジスタリストに追加しない。
nnoremap x "_x
nnoremap X "_X

" inoremap <C-J> <DOWN>
" inoremap <C-K> <UP>
nnoremap <Space> <PageDown>
nnoremap <S-Space> <PageUp>

" 挿入モードをUnixライクな挙動にする
" inoremap <C-E> <End>
" inoremap <C-A> <Home>
" inoremap <C-E> <End>
" inoremap <C-B> <Left>
" inoremap <C-F> <Right>
" inoremap <C-L> <Right>
" inoremap <C-Y> <ESC>yiwea 
" inoremap <C-D> <delete>

" コマンドラインモードはUnixライクな挙動にする
cnoremap <C-E> <End>
cnoremap <C-A> <Home>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>

" tag jumpをちょっと賢く
nnoremap <C-]> g<C-]>

" 少しでも早く(英語配列用)
noremap ;  :
noremap :  ;

inoremap <C-D> <delete>
vnoremap <silent><c-p> ?{<CR>
vnoremap <silent><c-n> /}<CR>

" 最後に変更されたテキストを選択する(不完全)
nnoremap gc  `[v`]$

" Tabキーで全バッファを巡回
nnoremap <silent><C-Tab> :<C-U>bnext<CR>
nnoremap <silent><S-C-Tab> :<C-U>bprevious<CR>

nnoremap <C-G> gv

" Linux環境でのクリップボードコピー
if has('unix')
	vnoremap y "+y
	" imap <C-I> <ESC>"*pa
endif
"}}}

" cindent settings"{{{
" CのSwitchCaseで、caseのインデントがswitchに合うようになる。
set cindent cino+=:0
" C++のラベルをインデント開始に合わせる。class {} のなかのpublic:みたいなやつ
" がきれいに合うようになる。
set cindent cino+=g0
" 関数の戻り型の宣言を N 文字インデントする。
set cindent cino+=t0
" N が 0 でなければVimはcaseラベル後の文の替わりに、caseラベルそ
" のものを基本にして配置を行う。
set cindent cino+=l-1
" K&Rスタイルの関数宣言の引数宣言を N 文字インデントする。
set cindent cino+=p0
"}}}

" setting of NeoComplete
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif



" 囲いこみプラグインの自動マッピングをしない
let g:surround_no_mappings = 0

"********************************************************************************
" grep設定
"********************************************************************************
set grepprg=/bin/grep\ -nH

"-------------------------------------------------------------------------------
" ファイルタイプ別設定
"-------------------------------------------------------------------------------
" augroup MyAuGroup"{{{
augroup MyAuGroup
	autocmd!
	autocmd BufNewFile,BufRead * set iminsert=0
	autocmd FileType *  	execute printf("setlocal dict=$VIMRUNTIME/dict/%s.dict", &filetype)
	autocmd FileType c  	setlocal syntax=c.doxygen
	autocmd FileType cpp  	setlocal syntax=cpp.doxygen
	autocmd FileType c,cpp  setlocal foldmethod=syntax
	" autocmd FileType c,cpp  setlocal fdn=3
	autocmd FileType c,cpp  setlocal fdls=2
	autocmd FileType c,cpp  setlocal foldcolumn=3
	" autocmd FileType c,cpp  setlocal foldminlines=20
	" 必ず最大化して起動
	autocmd FileType c,cpp  simalt ~x
	" autocmd FileType c,cpp	setlocal includeexpr=substitute(v:fname,'^\\/','','') | setlocal path+=./;/
	" autocmd FileType c,cpp  set foldmarker=\/\*\*,\*\/

	"-----------------------------------------------------------------------
	" 各種パスの設定
	"-----------------------------------------------------------------------
	" autocmd FileType c,cpp setlocal includeexpr=substitute(v:fname,'.cpp','h','g')

augroup END
"}}}
" augroup ColorSettings"{{{
augroup ColorSettings
	autocmd!
	autocmd FileType txt  colorscheme desert
	autocmd FileType log  colorscheme desert
	autocmd FileType bin  colorscheme desert
	autocmd FileType cpp  colorscheme jellybeans
augroup END
"}}}

" " neocomplcache が作成したタグファイルのパスを tags に追加する
" function! g:UpdateTags()
" 	setlocal tags=
" 	for filename in neocomplete#sources#include_complete#get_include_files(bufnr('%'))
" 		execute "setlocal tags+=" . neocomplete#cache#encode_name('include_tags', filename)
" 	endfor
" endfunction

function! Maketags() "{{{
	let PathName = expand("%:p:h")
	call system(
		\ "ctags".
		\ " -R --sort=1 --c++-kinds=+cdfgmnpstuvx --file-scope=0 --exclude=.svn --fields=+iaS --extra=+q --language-force=C++ ".
		\ PathName)

	" execute "silent !ctags -R `pwd` --sort=1 --c++-kinds=+cdfgmnpstuvx --file-scope=0 --exclude=.svn --fields=+iaS --extra=+q --language-force=C++ "
	" execute "silent !ctags -R --c++-kinds=+p --fields=+iaS  --language-force=C++ -f ."
endfunction
nnoremap <silent><Leader>tag  :call Maketags()<CR>
"}}}

if exists('g:echodoc_enable_at_startup')
	let g:echodoc_enable_at_startup = 1
endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
	command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
				\ | wincmd p | diffthis
endif

""""""""""""""""""""""""""""""
"ファイルを開いたら前回のカーソル位置へ移動
""""""""""""""""""""""""""""""
augroup vimrcEx
	autocmd!
	autocmd BufReadPost *
				\ if line("'\"") > 1 && line("'\"") <= line('$') |
				\   exe "normal! g`\"" |
				\ endif
augroup END

"-------------------------------------------------------------------------------
" コメントつけたり消したり
"-------------------------------------------------------------------------------
" Comment or uncomment lines from mark a to mark b.
function! CommentMark(docomment, a, b)
	if !exists('b:comment')
		let b:comment = CommentStr() . ' '
	endif
	if a:docomment
		exe "normal! '" . a:a . "_\<C-V>'" . a:b . 'I' . b:comment
	else
		exe "'".a:a.",'".a:b . 's/^\(\s*\)' . escape(b:comment,'/') . '/\1/e'
	endif
endfunction

" Comment lines in marks set by g@ operator.
function! DoCommentOp(type)
	call CommentMark(1, '[', ']')
endfunction

" Uncomment lines in marks set by g@ operator.
function! UnCommentOp(type)
	call CommentMark(0, '[', ']')
endfunction

" Return string used to comment line for current filetype.
function! CommentStr()
	if &ft == 'cpp' || &ft == 'java' || &ft == 'javascript'
		return '//'
	elseif &ft == 'c'
		return '//'
	elseif &ft == 'vim'
		return '"'
	elseif &ft == 'python' || &ft == 'perl' || &ft == 'sh' || &ft == 'R' || &ft == 'ruby'
		return '#'
	elseif &ft == 'autohotkey'
		return ';'
	elseif &ft == 'dosbatch'
		return 'rem'
	endif
	return ''
endfunction

nnoremap <Leader>c <Esc>:set opfunc=DoCommentOp<CR>g@
nnoremap <Leader>C <Esc>:set opfunc=UnCommentOp<CR>g@
vnoremap <Leader>c <Esc>:call CommentMark(1,'<','>')<CR>
vnoremap <Leader>C <Esc>:call CommentMark(0,'<','>')<CR>

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

"-------------------------------------------------------------------------------
" 縦に連番を入力する
"-------------------------------------------------------------------------------
nnoremap <silent>co :ContinuousNumber <C-a><CR>
vnoremap <silent>co :ContinuousNumber <C-a><CR>
command! -count -nargs=1 ContinuousNumber let c = col('.')|for n in range(1, <count>?<count>-line('.'):1)|exec 'normal! j' . n . <q-args>|call cursor('.', c)|endfor

"-------------------------------------------------------------------------------
" コマンド出力結果をクリップボードにコピー
"-------------------------------------------------------------------------------
func! s:func_copy_cmd_output(cmd)
	redir @*>
	silent execute a:cmd
	redir END
endfunc
command! -nargs=1 -complete=command CopyCmdOutput call <SID>func_copy_cmd_output(<q-args>)


function! GetPixel()
   let c = getline(".")[col(".") - 1]
   echo c
   exe "noremap <LeftMouse> <LeftMouse>r".c
   exe "noremap <LeftDrag>	<LeftMouse>r".c
endfunction
noremap <RightMouse> <LeftMouse>:call GetPixel()<CR>
set guicursor=n:hor20	   " to see the color beneath the cursor

" vim: fdm=marker
