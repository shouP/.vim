syntax on

set mouse-=a
set hlsearch
set fileformat=unix
set encoding=utf-8
"color setting
set background=dark
"ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
set browsedir=buffer
"クリップボード
set clipboard=unnamed,autoselect
"変更中のファイルでも、保存しないで他のファイルを表示
set hidden
"行末折り返しを禁止
set tw=0
"バックアップを作成しない
set nobackup
"スワップファイルを作成しない
set noswapfile
" undoファイルを作成しない
set noundofile
"括弧の入力時にカーソルを対応する括弧の上に一定時間表示させる
"set showmatch
"set matchparen
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
" カーソルライン表示
set cursorline
" GUI setting
set guioptions-=T
" 右のスクロールバーを非表示
set guioptions-=m
" 左のスクロールバーを非表示
set guioptions-=L
set ambiwidth=single

"日本語の行の連結時には空白を入力しない
set formatoptions+=mM
set scrolloff=0


" このセクションの項目はデフォルトのvimrcで上書きされてしまうため、ここで設定 {{{
" しても元に戻されてしまう。そのため、gvimrcに記述しないとダメっぽい。
" コマンド行の高さを減らす
set cmdheight=1
" ステータス行を無くして、画面描画をより広くする
set laststatus=0
" コピペモードトグル
set pastetoggle=<F9>
"}}}
"
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
set ignorecase
" デフォルトで行折り返ししない
set wrap!
"tagファイルを再帰的に遡って探す
set tags=tags;
" leaderを変更
"}}}

" cindent settings"{{{
" CのSwitchCaseで、caseのインデントがswitchに合うようになる。
set cindent cino+=:0
" func( ... \n ...) のとき、カッコのインデントを下げる。
set cindent cino+=m1
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
" インデントしない文字列を設定
" set cinkeys = "0{,0},0),:,!^F,o,O,e"
"}}}

" ファイル名表示
" 現在行数/全行数
set statusline=[buf:%n]
set statusline+=[%L]
set statusline+=%F
" 変更チェック表示
set statusline+=%m
" 読み込み専用かどうか表示
set statusline+=%r
" ヘルプページなら[HELP]と表示
set statusline+=%h
" プレビューウインドウなら[Prevew]と表示
set statusline+=%w
" これ以降は右寄せ表示
set statusline+=%=
" file encoding
set statusline+=[%{&fileencoding}]
" ステータスラインを常に表示(0:表示しない、1:2つ以上ウィンドウがある時だけ表示)
set laststatus=2

" vimrcを編集した後にすぐ反映させるための設定とか"{{{
augroup VimrcReloadGrp
	autocmd!
	if !has('gui_running') && !(has('win32') || has('win64'))
		" .vimrcの再読込時にも色が変化するようにする
		
		autocmd VimrcReloadGrp BufWritePost $MYVIMRC nested source $MYVIMRC
	endif

"}}}

set gfn=Menlo-Regular:h14

colorscheme jellybeans
" jellybeansの設定上書き
let g:jellybeans_overrides = { 'Comment': { 'attr': 'none' }, }

if has('conceal')
  set conceallevel=2 concealcursor=n
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

"タブ幅・タブインサート幅設定{{{
let s:coding_styles = {}
let s:coding_styles['My_style']      = 'set expandtab   tabstop=4 shiftwidth=4 softtabstop&'
let s:coding_styles['Short_indent']  = 'set expandtab   tabstop=2 shiftwidth=2 softtabstop&'
let s:coding_styles['GNU']           = 'set expandtab   tabstop=8 shiftwidth=2 softtabstop=2'
let s:coding_styles['BSD']           = 'set noexpandtab tabstop=8 shiftwidth=4 softtabstop&'
let s:coding_styles['Linux']         = 'set noexpandtab tabstop=8 shiftwidth=8 softtabstop&'

let g:markdown_fenced_languages = ['viml=vim', 'vim', 'cpp', 'bash=sh']
let g:markdown_folding = 1

" Vim標準のファイラー設定
filetype plugin on
" ファイルツリーの表示形式、1にするとls -laのような表示になります
let g:netrw_liststyle=1
" ヘッダを非表示にする
let g:netrw_banner=0
" サイズを(K,M,G)で表示する
let g:netrw_sizestyle="H"
" 日付フォーマットを yyyy/mm/dd(曜日) hh:mm:ss で表示する
let g:netrw_timefmt="%Y/%m/%d(%a) %H:%M:%S"
" プレビューウィンドウを垂直分割で表示する
let g:netrw_preview=1
let g:netrw_winsize   = 30

if &term !~ "xterm-color"
autocmd BufEnter * if bufname("") !~ "^?[A-Za-z0-9?]*://" | silent! exe '!echo -n "^[k[`basename %`]^[??"' | endif
autocmd VimLeave * silent! exe '!echo -n "^[k`dirs`^[??"'
endif
