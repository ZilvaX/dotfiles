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
" set autochdir

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

" Wildmenu
set wildmenu
set wildmode=longest,list,full

" Shortcut for listing buffers and inserting :b
map <Leader>b :ls<CR>:b

" True colour support
set termguicolors

" Background colour for Solarized8
set background=light

" Prevent crontab editing in place
" https://www.calebthompson.io/crontab-and-vim-sitting-in-a-tree
autocmd filetype crontab setlocal nobackup nowritebackup

" Sets text width to 80 for markdown
au BufRead,BufNewFile *.md setlocal textwidth=80 spell

" Allows CTRL-N and CTRL-P to autocomplete words
set complete+=kspell

" Don't mark URL-like things as spelling errors
syn match UrlNoSpell '\w\+:\/\/[^[:space:]]\+' contains=@NoSpell

" Don't count acronyms / abbreviations as spelling errors
" (all upper-case letters, at least three characters)
" Also will not count acronym with 's' at the end a spelling error
" Also will not count numbers that are part of this
" Recognizes the following as correct:
syn match AcronymNoSpell '\<\(\u\|\d\)\{3,}s\?\>' contains=@NoSpell

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
  " NERDTree
  Plug 'scrooloose/nerdtree'
  " Lint Engine
  Plug 'dense-analysis/ale'
  " Typescript
  Plug 'https://github.com/HerringtonDarkholme/yats.vim'
  " Solarized 8
  Plug 'lifepillar/vim-solarized8'

  " SparQL
  Plug 'https://github.com/rvesse/vim-sparql'

  " Rainbow brackets
  Plug 'junegunn/rainbow_parentheses.vim'
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
  colorscheme solarized8

  " NERDTree Hot key
  map <C-n> :NERDTreeToggle<CR>

  " ALE Fix configuration
  let g:ale_fixers = {
        \   'javascript': ['eslint'],
        \   'typescript': ['tslint'],
        \}
  " ALE Fix Leader shortcut
  map <Leader>F :ALEFix<CR>

  " Shortcut to close quickfix
  map <Leader>Q :ccl<CR>

endif
