" ================== PLUGINS ===================

call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-easy-align'
Plug 'wakatime/vim-wakatime'

" Ayu theme
Plug 'ayu-theme/ayu-vim'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" WakaTime
Plug 'tpope/vim-fireplace'

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" NERDTree Syntax Highlighting
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Fuzzy Finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" IntelliSense
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'leafgarland/typescript-vim'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" Initialize plugin system
call plug#end()

" ================== LET ===================

" NerdTree
let NERDTreeIgnore=['\node_modules$', '**/node_modules$']
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeStatusline = ''
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']

" Fuzzy Finder
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

" Color Scheme Variant
let ayucolor="dark"

" ================== SET ===================

colorscheme ayu
set termguicolors

" open new split panes to right and below
set splitright
set splitbelow

" Tab
set ts=2
set expandtab

" Line numbers
set number

" Terminal
set shell=bash

" ================== MAPS ===================

silent! nmap <C-P> :GFiles<CR>

" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>

" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" NERDTree
nnoremap <silent> <C-b> :NERDTreeToggle<CR>
nnoremap <C-p> :FZF<CR>

" ================== COMMANDS ===================
command! -nargs=0 Prettier :CocCommand prettier.formatFile
