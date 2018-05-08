set encoding=utf-8
" Tabs
"" Control the number of spaces to insert when tab is pressed
set tabstop=2
"" Control the number of space characters inserted for indentation
set shiftwidth=2
"" Insert spaces when tab is pressed
set expandtab

" Don't show the native mode text e.g. INSERT
set noshowmode
" Stop closing buffers when not focused
set hidden

syntax enable

" Set the working directory to wherever the open file lives
set autochdir

" Natural splitting
set splitbelow
set splitright

" Split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Show the line numbers
set nu

"" Plugins
if has('nvim')
  call plug#begin('~/.local/share/nvim/plugged')
  Plug 'tpope/vim-sensible'
  " Vim Airline
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'romainl/flattened'
  " Javascript
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'
  " Grepping
  Plug 'wincent/ferret'
  " Editor Configurations
  Plug 'editorconfig/editorconfig-vim'
  call plug#end()

  " Airline Configurations
  let g:airline_powerline_fonts = 1
  let g:airline_theme='solarized'
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#fnamemod = ':t'
  let g:airline#extensions#tabline#buffer_nr_show = 1

  " JSX support in .js file extensions
  let g:jsx_ext_required = 0

  " Solarized Theme
  colorscheme flattened_light 
endif
