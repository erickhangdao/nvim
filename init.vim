let mapleader = " "

call plug#begin()

Plug 'alvan/vim-closetag'
Plug 'christoomey/vim-sort-motion'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'lilydjwg/colorizer'
Plug 'luochen1990/rainbow'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'rbgrouleff/bclose.vim'
Plug 'sheerun/vim-polyglot'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" __general__
colorscheme onedark 
command! MakeTags !ctags -R .
filetype plugin on
set nocompatible
set path+=**
set number relativenumber
set splitbelow 
set splitright
set wildmenu
set noswapfile
set encoding=utf-8
set guifont=Roboto\ Mono:h11
syntax enable
syntax on

" __editing__
nnoremap <leader>ev :e $HOMEPATH\AppData\Local\nvim\init.vim<CR>
nnoremap <leader>h :noh<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
" __fzf__
nnoremap <leader>f :Files $HOME<CR>

" __navigation__
" unbind arrow keys
imap <Up>    <Nop>
imap <Down>  <Nop>
imap <Left>  <Nop>
imap <Right> <Nop>

nmap <Up>    <Nop>
nmap <Down>  <Nop>
nmap <Left>  <Nop>
nmap <Right> <Nop>

" rebind tabs
nnoremap tn :tabnew<CR>
nnoremap tc :tabclose<CR>

" split navigation
map <C-s> <C-w>v
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" insert mode navigation
inoremap <C-k> <Up>
inoremap <C-j> <Down>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" rebind search & replace
nnoremap <C-x> yiw:%s/\<<C-r>"\>//g<left><left>
nnoremap S :%s//g<left><left>

inoremap <expr> <CR> 
   \   getline(".") =~ '\S\s*{$'                 ? "<bs><CR>{<CR>}<esc>O"
   \ : getline('.') =~ '^\s*{$'                  ? "<CR>}<esc>O" 
   \ : getline(".")[col(".")-2:col(".")-1]=="{}" ? "<CR><esc>O<tab>"
   \ :                                             "<CR>"

" __airline__
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'

" auto format
au BufNewFile,BufRead *.py,*.java,*.cpp,*.c,*.cs,*.rkt,*.h,*.html,*.css,*.js
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=120 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

" __coc.nvim__
:verbose imap <tab>
" coc extensions
let g:coc_global_extensions = [
  \ 'coc-pairs',
	\ 'coc-snippets',
	\ 'coc-tsserver',
	\ 'coc-eslint',
	\ 'coc-prettier',
	\ 'coc-json',
	\ 'coc-html',
	\ 'coc-pyright',
	\ 'coc-css',
	\ 'coc-sh',
	\ 'coc-clangd',
	\ 'coc-python',
	\ 'coc-lua'
	\ ]

" tab autocompletion
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1] =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

if has('nvim')
	inoremap <silent><expr> <c-space> coc#refresh()
else
	inoremap <silent><expr> <c-@> coc#refresh()
endif

" definition navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gy <Plug>(coc-type-definition)

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
        else
		call CocAction('doHover')
	endif
 endfunction

" __NERDTree__
nnoremap <leader>n :NERDTreeToggle<CR>

" __vim closetag__
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

" __rainbow brackets__
let g:rainbow_active = 1
