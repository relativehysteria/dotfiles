" Netrw stuff
let g:netrw_liststyle = 3
let g:netrw_banner = 0

" Misc stuff
set noswapfile
set number
set splitbelow
set splitright
set mouse=a

" A reasonable default statusline
set statusline=%f\ %y\ %=(%l:%c)\ %L

" Colorscheme
set termguicolors
set cursorline
set colorcolumn=81

syntax on
call globals#toggle_colorscheme()
nnoremap <leader>c :call globals#toggle_colorscheme()<CR>

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
nnoremap <F2> :call tex#compile()<CR>
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

" Tabs
nnoremap <leader>n :tabnew<CR>

" Dynamically map 1-9 to :tabn <number>
nnoremap <leader>0 :tabn 10<CR>
for i in range(1, 9)
    execute 'nnoremap <leader>' . i . ' :tabn ' . i . '<CR>'
endfor

" Sessions
set sessionoptions+=buffers,curdir,tabpages,winsize
nnoremap <leader>ss :call session#save()<CR>
nnoremap <leader>sr :call session#restore()<CR>
autocmd VimEnter * ++once nested if argc() == 0 && has('ttyin') | call session#restore() | endif

" Copy into clipboard
vnoremap <Leader>y "+y
vnoremap <Leader>Y "+Y

" vim easy align stuff
xnoremap ga <Plug>(EasyAlign)
nnoremap ga <Plug>(EasyAlign)

lua << EOF
vim.lsp.config("rust_analyzer", {
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
})
vim.lsp.enable("rust_analyzer")
EOF

" Generic auto cmds
augroup auto_cmds
    autocmd!
    " Insert header guardian into new headers
    autocmd BufNewFile *.h call globals#insert_header_guardian()

    " Remove trailing whitespace and newlines on save
    autocmd BufWritePre * if &filetype != "markdown" | %s/\s\+$//e
    autocmd BufWritePre * if &filetype != "markdown" | %s/\n\+\%$//e

    " 80 char wrapping but also no colorcolumn on no filetype
    autocmd FileType * setlocal textwidth=80
    autocmd BufEnter,BufWinEnter * if &filetype ==# '' | setlocal colorcolumn= | endif

    " Overwrite tag navigation with lsp definition for Rust
    autocmd FileType rust nnoremap <buffer> <C-]> <cmd>lua vim.lsp.buf.definition()<CR>
augroup END
