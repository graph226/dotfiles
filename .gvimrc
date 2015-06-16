set guifont=Menlo:h13
set transparency=13
set tabstop=2
set shiftwidth=2
colorscheme evening


if has('multi_byte_ime') || has('xim')
    highlight CursorIM guibg=DarkCyan guifg=NONE
endif



set incsearch	"インクリメンタルさーち
let &directory = &backupdir "swapファイルつくらない


function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction
   
if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme       * call ZenkakuSpace()
        autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
    augroup END
    call ZenkakuSpace()
endif

let g:save_window_file = expand('~/.vimwinpos')
augroup SaveWindow
  autocmd!
  autocmd VimLeavePre * call s:save_window()
  function! s:save_window()
    let options = [
      \ 'set columns=' . &columns,
      \ 'set lines=' . &lines,
      \ 'winpos ' . getwinposx() . ' ' . getwinposy(),
      \ ]
    call writefile(options, g:save_window_file)
  endfunction
augroup END

if filereadable(g:save_window_file)
  execute 'source' g:save_window_file
endif

nmap <D-S-Left> :tabp<CR>
nmap <D-S-Right> :tabn<CR>

command! Gcc call s:Gcc()
nmap <D-r> :Gcc<CR>

function! s:Gcc()
		:w
		:!gcc ./% -o ./%.out
		:!./%.out
endfunction

command! Ruby call s:Ruby()
nmap <D-1> :Ruby<CR>

function! s:Ruby()
	:w
	:!ruby %
endfunction

nmap <ESC><ESC> :noh<CR>

