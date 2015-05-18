filetype plugin on
syntax on
set tabstop=2
set cursorline
set cursorcolumn
set number
        set smartindent
        inoremap <C-a> <Home>
        inoremap <C-e> <End>
        inoremap <C-d> <Del>

        inoremap <C-b> <Left>
        inoremap <C-n> <Down>
        inoremap <C-f> <Right>
	inoremap jk <ESC>

if has('multi_byte_ime') || has('xim')
    highlight CursorIM guibg=DarkCyan guifg=NONE
endif


	nnoremap <Space>l $

".gvimrc" 45L, 1110C


"---------------------------
" Start Neobundle Settings.
"---------------------------
" bundleで管理するディレクトリを指定
set runtimepath+=~/.vim/bundle/neobundle.vim/
 
" Required:
call neobundle#begin(expand('~/.vim/bundle/'))
 
" neobundle自体をneobundleで管理
NeoBundleFetch 'Shougo/neobundle.vim'
 
" 今後このあたりに追加のプラグインをどんどん書いて行きます！！"
" NERDTreeを設定
NeoBundle 'scrooloose/nerdtree' 
NeoBundle 'kannokanno/previm'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'tyru/open-browser.vim'

call neobundle#end()
 
" Required:
filetype plugin indent on
 
" 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
" 毎回聞かれると邪魔な場合もあるので、この設定は任意です。
NeoBundleCheck
 
"-------------------------
" End Neobundle Settings.
"-------------------------
"
"PreVim
augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END

"kkh環境の設定
au BufNewFile,BufRead *.wl setf c
