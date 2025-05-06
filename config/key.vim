" キーマップの割り当て maping 
let mapleader = ","

"-------------------------------------------------------------------------------
"Prefix
"-------------------------------------------------------------------------------
nnoremap [TagJump] <Nop>
nmap <silent><Leader>t [TagJump]
nmap <silent><Leader>g [Gtags]
nnoremap [ctrlp] <Nop>
nmap <silent><Leader>f [ctrlp]
nnoremap [make] <Nop>
nmap <silent><Leader>m [make]


"-------------------------------------------------------------------------------
"実体
"-------------------------------------------------------------------------------
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/build/*,*/Output/*,*/.cppcheck/*
" 行の折り返しキーマップ
nnoremap <Leader>w  :<C-U>set wrap!<CR>
" スペース＋e でエクスプローラ起動
nnoremap <Leader>e :<C-U>Lexplore<CR>

" quickfixの移動を楽に
nnoremap <C-N> :cn<CR>
nnoremap <C-P> :cp<CR>

nnoremap [make] <Nop>
nmap <silent><Leader>m [make]
" nnoremap [make]m :make -j<CR>
nnoremap [make]m :<C-U>bufdo update<CR>:make -j<CR>
nnoremap [make]t :<C-U>bufdo update<CR>:make -j run_test<CR>
nnoremap [make]r :<C-U>bufdo update<CR>:make -j run<CR>
nnoremap [make]i :<C-U>bufdo update<CR>:make -j in<CR>
nnoremap [make]c :<C-U>bufdo update<CR>:make clean<CR>
nnoremap [make]a :<C-U>bufdo update<CR>:make all<CR>
nnoremap [make]u :<C-U>bufdo update<CR>:make unit<CR>

" .vimrcを開く
nnoremap <Leader>.  :<C-U>tabnew $MYVIMRC<CR>
" .bashrcを開く
nnoremap <Leader>b  :<C-U>tabnew ~/.bashrc<CR>
" IMEがONの時IMEをOFFにしてt/fコマンド実行
nnoremap <silent> t :<C-U>set iminsert=0<CR>t
nnoremap <silent> T :<C-U>set iminsert=0<CR>T
nnoremap <silent> f :<C-U>set iminsert=0<CR>f
nnoremap <silent> F :<C-U>set iminsert=0<CR>F

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

"Gtagsのキーバインド
" 関数一覧を検索
nnoremap [Gtags]f :Gtags -f %<CR>
" カーソル下の関数定義を検索
" nnoremap [Gtags]g :Gtags <C-r><C-w><CR>
nnoremap [Gtags]o :Gtags -g <C-r><C-w><CR>
nnoremap [Gtags]t :Gtags <C-r><C-w><CR>
" カーソル下の呼び出し元を検索
nnoremap [Gtags]r :Gtags -r <C-R><C-W><CR>

"カレントパスを現在編集中のファイルパスに変更
nnoremap <Leader>cd :<C-U>cd %:h<CR>

"バッファを切り替えて切替前のバッファを閉じる
nnoremap <Leader>bd :<C-U>bd!<CR>

nnoremap <Leader>x  :<C-U>simalt ~x <CR>
nnoremap <Leader>fd  :<C-U>!git diff %<CR>
nnoremap <Leader>fl  :<C-U>!git log -p %<CR>


" Quickfixpreviewを表示
nnoremap <Leader>o  :<C-U>copen<CR>
autocmd QuickFixCmdPost *grep* cwindow

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

" x/s での削除をレジスタリストに追加しない。
nnoremap x "_x
nnoremap X "_X
nnoremap s "_s
nnoremap S "_S

nnoremap <Space> <PageDown>
nnoremap <S-Space> <PageUp>

" コマンドラインモードはUnixライクな挙動にする
cnoremap <C-E> <End>
cnoremap <C-A> <Home>
cnoremap <C-H> <BS>
" cnoremap <C-D> <delete>

" tag jumpをちょっと賢く
nnoremap <C-]> g<C-]>

" 少しでも早く(英語配列用)
noremap ;  :
noremap :  ;

" inoremap <C-D> <delete>
vnoremap <silent><c-p> ?{<CR>
vnoremap <silent><c-n> /}<CR>

" 最後に変更されたテキストを選択する(不完全)
nnoremap gc  `[v`]$

" <CR>で発動したかったが、コマンドラインウィンドウで誤発動するのでF10にする
" nnoremap <CR> :<C-U>noh<CR>
nnoremap <F10> :<C-U>noh<CR>

" Linux環境でのクリップボードコピー
if has('unix')
	vnoremap y "+y
	" imap <C-I> <ESC>"*pa
endif

