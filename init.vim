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
call plug#end()

" general
let g:mapleader = "\<Space>"
colorscheme onedark 
set relativenumber
nnoremap <leader>w :w<CR>
nnoremap <leader>qq :q!<CR>
nnoremap <leader>wq :wq<CR>


" coc.nvim
inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
" NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>

" vim-which-key
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
set timeoutlen=0

" fzf
nnoremap <leader>f :Rg<CR>
