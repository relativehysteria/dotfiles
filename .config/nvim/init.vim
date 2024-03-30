" Netrw (directory listing) stuff
let g:netrw_liststyle = 3
let g:netrw_banner = 0

" Tagbar on the left
let g:tagbar_left = 1

" Misc stuff
set noswapfile
set number
set splitbelow
set mouse=a
set showmatch

" A reasonable default statusline
set statusline= "clear statusline
set statusline=%#Normal#
set statusline+=%f
set statusline+=\ %y
set statusline+=%=
set statusline+=%c:
set statusline+=%l\ \|\ %L

" Colorscheme
set termguicolors
set cursorline
set colorcolumn=81
colorscheme morning
syntax on

" Indentation, width, comments
set textwidth=0
set shiftwidth=4
set tabstop=4
set autoindent
set formatoptions-=cro
set expandtab
set lcs+=space:·

" Searching
set ignorecase
set smartcase
set showmatch
set noincsearch

" Forecasting of lines or something like that
set display+=lastline
set scrolloff=15
set sidescrolloff=15

" Function keys
nnoremap <F1> :setlocal spell!<CR>
nnoremap <F2> :call tex#Compile()<CR>
nnoremap <F3> :TagbarToggle<CR>
nnoremap <F4> :set list!<CR>

" Capitalization
nnoremap <Tab> g~iw
nnoremap <M-Tab> lb~

" Resize buffers
noremap <M-h> <C-W>2<
noremap <M-j> <C-W>-
noremap <M-k> <C-W>+
noremap <M-l> <C-W>2>

" Move the cursor between buffers
noremap <C-h> <C-W>h
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-l> <C-W>l

" Move buffers
noremap <C-M-h> <C-W>H
noremap <C-M-j> <C-W>J
noremap <C-M-k> <C-W>K
noremap <C-M-l> <C-W>L

" Tags quality of life
nnoremap <C-]> g<C-]>

" Copy into clipboard
vnoremap <Leader>y "+y
vnoremap <Leader>Y "+Y

" Misc stuff
autocmd BufNewFile *.h      call globals#InsertHeaderGuardian()
autocmd FileType *          call globals#SyntaxAfter()

" Remove trailing whitespace and newlines on save
autocmd BufWritePre * if &filetype != "markdown" | %s/\s\+$//e
autocmd BufWritePre * if &filetype != "markdown" | %s/\n\+\%$//e
