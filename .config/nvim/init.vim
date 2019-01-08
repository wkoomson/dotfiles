"""""
""""" Dein
"""""
if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.local/share/dein/repos/github.com/Shougo/dein.vim
set runtimepath+=~/.local/share/fzf
if dein#load_state('~/.local/share/dein')
  call dein#begin('~/.local/share/dein')

  call dein#add('~/.local/share/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('zchee/deoplete-zsh')
  call dein#add('zchee/deoplete-jedi')
  call dein#add('Shougo/neco-syntax')
  call dein#add('Shougo/deoplete-clangx')
  call dein#add('Shougo/neoinclude.vim')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('tpope/vim-fugitive')
  call dein#add('majutsushi/tagbar')
  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable
""""""""""""""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme='dracula'
set number
set colorcolumn=80
highlight ColorColumn ctermbg=blue 
""""""""""""""""""""""""""""""""""""""

function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

command! FZFMru call fzf#run({
\  'source':  v:oldfiles,
\  'sink':    'e',
\  'options': '-m -x +s',
\  'down':    '40%'})
"""""""""""""""""""""""""""""""""""""""
map ; :
noremap ;; ;
nmap <silent><leader>p :FZF<CR>
nmap <silent><leader>P :FZF ~<CR>
nnoremap <silent><leader>o :FZFMru<CR>
nmap <silent><leader>t :TagbarToggle<CR>
nnoremap <silent> <leader>b :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>
