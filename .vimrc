set encoding=UTF-8            
set guifont=SauceCodePro\ Nerd\ Font:h22
set laststatus=0 ruler
set number
set relativenumber
set autoindent
set autoread
set cin
set history=1000
set hlsearch
set ignorecase
set incsearch
set smarttab
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set pastetoggle=
set mouse=a
set mousehide
set vb t_vb=
set noerrorbells
set noswapfile

" ————————————  
"  ColorScheme
" ————————————

syntax enable
set background=dark
colorscheme molokai
let g:molokai_original = 1
let g:molokai_termcolors=256
let g:rehash256 = 1

" For molokai
" ———————————
" let g:molokai_original = 1
" let g:molokai_termcolors=256
" let g:rehash256 = 1

" For solarized
" —————————————
" let g:solarized_termcolors=256

" —————————————
" Compilation
" —————————————

" F1 for previous tab
noremap  <F1> <ESC> :tabprev <CR>
vnoremap <F1> <ESC> :tabprev <CR>
inoremap <F1> <ESC> 

" F2 for copy whole file content
noremap   <F2> <ESC> :w <CR> :!pbcopy < % <CR>
vnoremap  <F2> <ESC> :w <CR> :!pbcopy < % <CR>
inoremap  <F2> <ESC> :w <CR> :!pbcopy < % <CR>

" F3 for making 
noremap  <F3> <ESC> :w <CR> :make <CR>
vnoremap <F3> <ESC> :w <CR> :make <CR>
inoremap <F3> <ESC> :w <CR> :make <CR>

" F7 for terminal
noremap  <F5> <ESC> :w <CR> :term <CR>
vnoremap <F5> <ESC> :w <CR> :term <CR>
inoremap <F5> <ESC> :w <CR> :term <CR>

" ———————————————————————————————————————————

" F8 for fast compilation
" g++ -std=c++17 -Wshadow -Wall -o "%e" "%f" -O2 -Wno-unused-result
noremap <F8> <ESC> :w <CR> :!g++ -std=c++17 -Wshadow -Wall -o %< % -O2 -Wno-unused-result<CR>
inoremap <F8> <ESC> :w <CR> :!g++ -std=c++17 -Wshadow -Wall -o "%<" "%" -O2 -Wno-unused-result<CR>

" F9 for compilatioin with input
noremap <F9> <ESC> :w <CR> :!g++ -std=c++17 -Wshadow -Wall -Wextra -o %< % -O2 -Wno-unused-result -DONPC && ./%< < inp<CR>
inoremap <F9> <ESC> :w <CR> :!g++ -std=c++17 -Wshadow -Wall -Wextra -o "%<" "%" -O2 -Wno-unused-result -DONPC && ./%< < inp<CR>

" F10 for safe compilation with input
" g++ -std=c++17 -Wshadow -Wall -o "%e" "%f" -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG
noremap <F10> <ESC> :w <CR> :!g++ -std=c++17 -Wshadow -Wall -Wextra -o %< % -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG && ./%< < inp<CR> 
inoremap <F10> <ESC> :w <CR> :!g++ -std=c++17 -Wshadow -Wall -Wextra -o "%<" "%" -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG && ./%< < inp<CR> 


" ———————————————————————————————————————————


" ———————————————
"  Vim Plugins
" ———————————————

" ~/.vim/pluggee
call plug#begin()

Plug 'tpope/vim-commentary' " For Commenting gcc & gc
Plug 'tpope/vim-surround' " Surrounding ysw)
Plug 'preservim/nerdtree' " NerdTree
Plug 'preservim/tagbar' " Tagbar for code navigation
Plug 'neoclide/coc.nvim'  " Auto Completion
Plug 'neoclide/coc-snippets' " Code snippets
Plug 'neoclide/coc-git' " git extension for coc
Plug 'vim-airline/vim-airline' " Status bar
Plug 'ap/vim-css-color' " CSS Color Preview
Plug 'rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'ryanoasis/vim-devicons' " Developer Icons
Plug 'tc50cal/vim-terminal' " Vim Terminal
Plug 'terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'preservim/tagbar' " Tagbar for code navigation
Plug 'xiyaowong/nvim-transparent' " Transparent Neovim
Plug  'jiangmiao/auto-pairs' " vim auto pairs

call plug#end()

" ———————————————
" Coc Nvim
" ———————————————

" use <tab> for trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

" use <c-space>for trigger completion
inoremap <silent><expr> <c-space> coc#refresh()
" Use <C-@> on vim
inoremap <silent><expr> <c-@> coc#refresh()

inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

" --- Just Some Notes ---
" :PlugClean :PlugInstall :UpdateRemotePlugins
"
" :CocInstall coc-python
" :CocInstall coc-clangd
" :CocInstall coc-snippets
" :CocCommand snippets.edit... FOR EACH FILE TYPE

" ———————————————
" Nvim Auto snippets
" ———————————————

Plug 'neoclide/coc-snippets'
    inoremap <silent><expr> <TAB>
          \ coc#pum#visible() ? coc#_select_confirm() :
          \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
          \ CheckBackSpace() ? "\<TAB>" :
          \ coc#refresh()

    function! CheckBackSpace() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    let g:coc_snippet_next = '<tab>'

" ———————————————
"  NerdTree
" ———————————————

Plug 'preservim/nerdtree'
    let g:NERDTreeDirArrowExpandable="+"
    let g:NERDTreeDirArrowCollapsible="~"
    nnoremap <C-f> :NERDTreeFocus<CR>
    nnoremap <C-t> :NERDTree<CR>
    nnoremap <C-n> :NERDTreeToggle<CR>
    nmap <F7> :TagbarToggle <CR>
    set completeopt-=preview " For No Previews

" ———————————————
"  Nvim Transparent
" ———————————————
let g:transparent_enabled = v:true


" ———————————————
" Vim Airline
" ———————————————
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" ———————————————
" Key Mappings
" ———————————————

noremap <TAB> %

" ———————————————————————————— "
"            THE END           "
" ———————————————————————————— "

