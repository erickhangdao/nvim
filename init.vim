call plug#begin()
Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim'
Plug 'lilydjwg/colorizer'
Plug 'joshdick/onedark.vim'
Plug 'tpope/vim-fugitive'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc-snippets'
Plug 'neoclide/coc-tsserver'
Plug 'neoclide/coc-pairs'
Plug 'neoclide/coc-eslint'
Plug 'neoclide/coc-prettier'
Plug 'neoclide/coc-json'
Plug 'terryma/vim-multiple-cursors'
Plug 'sheerun/vim-polyglot'
call plug#end()

" general
let g:mapleader = "\<Space>"
colorscheme onedark 
set relativenumber

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
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

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
nnoremap <leader>f :NERDTreeFind<CR>

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
