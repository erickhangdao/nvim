call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim'
Plug 'justinmk/vim-sneak'
Plug 'junegunn/fzf'
Plug 'lilydjwg/colorizer'
Plug 'joshdick/onedark.vim'
Plug 'liuchengxu/vim-which-key'
Plug 'tpope/vim-fugitive'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'
call plug#end()

" general
let g:mapleader = ","
colorscheme onedark 
set relativenumber
nnoremap <leader>w :w<CR>
nnoremap <leader>qq :q!<CR>
nnoremap <leader>ww :wq<CR>


" coc.nvim
let g:coc_global_extensions = [
        \ 'coc-pairs'
        \ ]
inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
" NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>

" vim-which-key
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
set timeoutlen=0

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
