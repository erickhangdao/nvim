let mapleader = ","

call plug#begin()

Plug 'alvan/vim-closetag'
Plug 'christoomey/vim-sort-motion'
Plug 'francoiscabrol/ranger.vim'
Plug 'joshdick/onedark.vim'
Plug 'lilydjwg/colorizer'
Plug 'neoclide/coc-eslint'
Plug 'neoclide/coc-json'
Plug 'neoclide/coc-pairs'
Plug 'neoclide/coc-prettier'
Plug 'neoclide/coc-snippets'
Plug 'neoclide/coc-tsserver'
Plug 'neoclide/coc.nvim'
Plug 'preservim/nerdtree'
Plug 'rbgrouleff/bclose.vim'
Plug 'sheerun/vim-polyglot'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" general
colorscheme onedark 
command! MakeTags !ctags -R .
filetype plugin on
set nocompatible
set path+=**
set relativenumber
set splitbelow 
set splitright
set wildmenu
set noswapfile
syntax enable
syntax on

" navigation
nnoremap tn :tabnew<CR>
nnoremap tc :tabclose<CR>
nnoremap <C-tab> :tabnext<CR>

map <C-s> <C-w>s
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

nnoremap S yiw:%s/\<<C-r>"\>//g<left><left>

inoremap <expr> <CR> 
   \   getline(".") =~ '\S\s*{$'                 ? "<bs><CR>{<CR>}<esc>O"
   \ : getline('.') =~ '^\s*{$'                  ? "<CR>}<esc>O" 
   \ : getline(".")[col(".")-2:col(".")-1]=="{}" ? "<CR><esc>O<tab>"
   \ :                                             "<CR>"

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'

au BufNewFile,BufRead *.py,*.java,*.cpp,*.c,*.cs,*.rkt,*.h,*.html,*.css,*.js
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=120 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

" coc.nvim
:verbose imap <tab>
let g:coc_global_extensions = [
  \ 'coc-pairs',
	\ 'coc-snippets',
	\ 'coc-tsserver',
	\ 'coc-eslint',
	\ 'coc-prettier',
	\ 'coc-json'
  \ ]

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1] =~ '\s'
endfunction
inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
if has('nvim')
	inoremap <silent><expr> <c-space> coc#refresh()
else
	inoremap <silent><expr> <c-@> coc#refresh()
endif

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

" NERDTree
nnoremap <leader>n :NERDTreeToggle<CR>

"vim closetag
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
