" vim: fdm=marker fileformat=unix
set nocompatible

source $VIMRUNTIME/defaults.vim

call plug#begin()

Plug 'SirVer/ultisnips'
Plug 'fuenor/qfixgrep'
Plug 'nanotech/jellybeans.vim'
Plug 'tpope/vim-surround'
Plug 'tyru/open-browser.vim'
Plug 'vim-jp/vimdoc-ja'
Plug 'vim-scripts/taglist.vim'

" CtroP関連
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mattn/ctrlp-matchfuzzy'

" COC関連
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

source $HOME/.vim/config/behavior.vim
source $HOME/.vim/config/key.vim
source $HOME/.vim/config/grep.vim

"-------------------------------------------------------------------------------
" ファイルタイプ別設定
"-------------------------------------------------------------------------------
source $HOME/.vim/config/filetype/all.vim
source $HOME/.vim/config/filetype/cpp.vim
source $HOME/.vim/config/filetype/txt.vim

source $HOME/.vim/config/plugin/surround.vim
source $HOME/.vim/config/plugin/coc.vim
source $HOME/.vim/config/plugin/ctrlp.vim

source $HOME/.vim/script/comment_in_out.vim
source $HOME/.vim/script/remove_lineend_spaces.vim
source $HOME/.vim/script/etc.vim

