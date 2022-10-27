set encoding=UTF-8            

set number
set relativenumber

set autoindent
set autoread

set smarttab
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

set mouse=a
set mousehide

set noerrorbells
set noswapfile

" ------------  
"  ColorScheme
" ------------

colorscheme PaperColor

" -------------
" Compilation
" -------------

" F8 for Fast
" g++ -std=c++17 -Wshadow -Wall -o "%e" "%f" -O2 -Wno-unused-result
noremap <F8> <ESC> :w <CR> :!g++ -std=c++17 -Wshadow -Wall -o %< % -O2 -Wno-unused-result <CR>
inoremap <F8> <ESC> :w <CR> :!g++ -std=c++17 -Wshadow -Wall -o "%<" "%" -O2 -Wno-unused-result <CR>

" F9 for Safe
" g++ -std=c++17 -Wshadow -Wall -o "%e" "%f" -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG
noremap <F8> <ESC> :w <CR> :!g++ -std=c++17 -Wshadow -Wall -o %< % -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG<CR>
inoremap <F8> <ESC> :w <CR> :!g++ -std=c++17 -Wshadow -Wall -o "%<" "%" -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG<CR>

" -------------
"  Vim Plugins
"  ------------

call plug#begin('~/.config/nvim/plugged')

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

call plug#end()

" ----------
" Coc Nvim
" ----------

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

" ----------
" Nvim Auto snippets
" ----------

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

" ----------
"  NerdTree
" ----------

Plug 'preservim/nerdtree'
    let g:NERDTreeDirArrowExpandable="+"
    let g:NERDTreeDirArrowCollapsible="~"
    nnoremap <C-f> :NERDTreeFocus<CR>
    nnoremap <C-t> :NERDTree<CR>
    nnoremap <C-n> :NERDTreeToggle<CR>
    nmap <F7> :TagbarToggle <CR>
    set completeopt-=preview " For No Previews

" --------
"  Nvim Transparent
" --------
let g:transparent_enabled = v:true


" ---------
" Vim Airline
" ---------
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

" ---------------
" Key Mappings
" ---------------

noremap <TAB> %


" ---------------------------- "
"            THE END           "
" ---------------------------- "

