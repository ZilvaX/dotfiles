set encoding=utf-8
" Don't show the native mode text e.g. INSERT
set noshowmode
" Stop closing buffers when not focused
set hidden

"" Plugins
call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-sensible'
" Vim Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:Powerline_symbols = 'fancy'
let g:airline_theme='solarized'
" Javascript
Plug 'pangloss/vim-javascript'
call plug#end()
