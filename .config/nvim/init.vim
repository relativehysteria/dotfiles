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

syntax on
if trim(system('should_use_light')) == "true"
    " I don't know why, but shine into wildcharm creates pretty colors
    colorscheme shine
    colorscheme wildcharm
    hi LineNr guifg=#303030 guibg=None
else
    colorscheme habamax
    hi SpecialComment guifg=#906080
    autocmd FileType * call globals#SyntaxAfter()
endif
hi Normal guibg=None
hi StatusLine guibg=None
hi LineNr guibg=None
hi CursorLine guibg=None
hi CursorLineNr guibg=None
hi ColorColumn guibg=#A01030
hi SpellBad guifg=#D84587

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
nnoremap <F3> :set list!<CR>

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

" Copy into clipboard
vnoremap <Leader>y "+y
vnoremap <Leader>Y "+Y

" vim easy align stuff
xnoremap ga <Plug>(EasyAlign)
nnoremap ga <Plug>(EasyAlign)

" Misc stuff
autocmd BufNewFile *.h call globals#InsertHeaderGuardian()

" Remove trailing whitespace and newlines on save
autocmd BufWritePre * if &filetype != "markdown" | %s/\s\+$//e
autocmd BufWritePre * if &filetype != "markdown" | %s/\n\+\%$//e

" 80 char wrapping but also no colorcolumn on no filetype
autocmd FileType * setlocal textwidth=80
autocmd BufEnter,BufWinEnter * if &filetype ==# '' | setlocal colorcolumn= | endif

lua << EOF
require('lspconfig').rust_analyzer.setup{
    on_attach = function(client, bufnr)
        -- Disable everything except definition
        client.server_capabilities.documentRangeFormattingProvider = false
        client.server_capabilities.codeActionProvider = false
        client.server_capabilities.hoverProvider = false
        client.server_capabilities.renameProvider = false
        client.server_capabilities.signatureHelpProvider = false
        client.server_capabilities.referencesProvider = false
        client.server_capabilities.completionProvider = false
        client.server_capabilities.diagnosticProvider = false
        client.server_capabilities.semanticTokensProvider = nil

        -- Suppress diagnostics
        vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end
    end,
}
EOF

" LSP quality of life stuff
nnoremap <C-]> <cmd>lua vim.lsp.buf.definition()<CR>
