set number
set hls
set ft=php
colorscheme pablo

set smarttab
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set nobk

set wrap

" set mouse=a



" Show lines that exceed 80 characters
" match ErrorMsg '\%80v.\+'

" Marcar la columna 80
set colorcolumn=80
" Modificar el color del ColorColumn
highlight ColorColumn ctermbg=0




" NERDTree
map <silent> <c-n> :NERDTreeToggle<CR>
" abre automaticamente el NERDTree
" autocmd VimEnter * NERDTree
" ... pero a continuacion va a la ventana de edicion
autocmd VimEnter * wincmd p
let g:NERDTreeDirArrows=0 " Para cambiar el icono del arbol y q funcione en ISO

let html_templates_imasd = 1

hi Directory ctermfg=3 ctermbg=4


abbr fn function ()\n{\n}
abbr ccom <!-- ====\n==== -->
abbr IF <!-- _IF_ @ () @ -->xxx<!-- _ENDIF_ -->
abbr IFE <!-- _IF_ @ () @ -->xxx<!-- _ELSE_ -->yyy<!-- _ENDIF_ -->
abbr IFC <!-- _IF_ @ () @ -->xxx<!-- _ELSEIF_ @ () @ -->yyy<!-- _ELSE_ -->zzz<!-- _ENDIF_ -->





" Mostrar y eliminar espacios en blanco no deseados
function ShowSpaces(...)
  let @/='\v(\s+$)|( +\ze\t)'
  let oldhlsearch=&hlsearch
  if !a:0
    let &hlsearch=!&hlsearch
  else
    let &hlsearch=a:1
  end
  return oldhlsearch
endfunction

function TrimSpaces() range
  let oldhlsearch=ShowSpaces(1)
  execute a:firstline.",".a:lastline."substitute ///gec"
  let &hlsearch=oldhlsearch
endfunction

command -bar -nargs=? ShowSpaces call ShowSpaces(<args>)
command -bar -nargs=0 -range=% TrimSpaces <line1>,<line2>call TrimSpaces()
nnoremap <F12>     :ShowSpaces 1<CR>
nnoremap <S-F12>   m`:TrimSpaces<CR>``
vnoremap <S-F12>   :TrimSpaces<CR>
" fin



" Statusline Always
set laststatus=2

" now set it up to change the status line based on mode
if version >= 700
  au InsertEnter * hi StatusLine term=reverse ctermbg=1 ctermfg=0 gui=undercurl guisp=Red
  au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse
endif

set statusline=%F\ [l=%L]\ [%p%%]\ [p=%03l,%03v]\ [b=%n]\}

" default the statusline to green when entering Vim
" hi statusline guibg=green
hi StatusLine term=reverse ctermbg=2 ctermfg=0 gui=undercurl guisp=Green


" Cambio de color de la linea de status
"function! NormalStatuslineColor(mode)
"    set laststatus=2
"    hi Statusline term=reverse ctermbg=1 gui=undercurl guisp=green
"endfunction


"function! InsertStatuslineColor(mode)
"  if a:mode == 'i'
"    set laststatus=2
"    hi StatusLine term=reverse ctermbg=1 gui=undercurl guisp=red
"  elseif a:mode == 'r'
"    set laststatus=2
"    hi StatusLine term=reverse ctermbg=2 gui=undercurl guisp=red
"  else
"    set laststatus=2
"    hi StatusLine term=reverse ctermbg=3 gui=undercurl guisp=red
"  endif
"endfunction

"au InsertEnter * call InsertStatuslineColor(v:insertmode)
"au InsertLeave * call NormalStatuslineColor(v:insertmode)
" fin de cambio de color de linea de status



" F3 for :tabnew
map <F3> :tabnew


command! W :w " for mistyping :w as :W


" A VER SI LOGRAMOS HACER FUNCIONAR UN CAMBIO DE MODALIDAD DEL RATON CON F2
" :map <F2> :set mouse=a <CR>

":map <F2> :<C-U>call MyFunc()<CR>

"function! MyFunc()
"    mou = :set mouse?
"   echo mou
"endfunction

