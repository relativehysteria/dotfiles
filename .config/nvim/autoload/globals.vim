if exists("b:globals_loaded_already")
	finish
endif
let b:globals_loaded_already=1

" brackets and parentheses coloring
function! globals#SyntaxAfter()
	syntax keyword Boolean true false TRUE FALSE True False

	syntax match _Paren "[(){}\[\]]"
	" We don't match the slash char because doing so breaks comments..
	" The same goes for the octothorpe char.
	" The `<` character breaks syntax higlighting for filetypes which use it
	" as an element delimiter, so we don't match it with those filetypes
	if &filetype != 'html' && &filetype != 'xml' && &filetype != 'php'
		syntax match _Operator "[-+=<>!?\|~*@%&^]"
	else
		syntax match _Operator "[-+=!?\|~*@%&^]"
	endif
	syntax match _Delimiter "[.,;:]"

	"hi BrackParen guifg=#A00EFF guibg=NONE guisp=NONE gui=NONE ctermfg=140 ctermbg=53 cterm=NONE
	hi BrackParen guifg=#9BCEE4 guibg=NONE guisp=NONE gui=NONE ctermfg=140 ctermbg=53 cterm=NONE

	hi link _Paren BrackParen
	hi link _Operator Operator
	hi link _Delimiter Delimiter
endfunction

" dark and light colorscheme toggle
function! globals#ToggleColorscheme()
    let current = get(g:, 'colors_name', '')
    if current ==# 'habamax'
        colorscheme shine
        colorscheme wildcharm
        hi LineNr guifg=#303030 guibg=None
    else
        colorscheme habamax
        hi SpecialComment guifg=#906080
        call globals#SyntaxAfter()
    endif

    hi Normal guibg=None
    hi StatusLine guibg=None
    hi LineNr guibg=None
    hi CursorLine guibg=None
    hi CursorLineNr guibg=None
    hi ColorColumn guibg=#A01030
    hi SpellBad guifg=#D84587
endfunction

" insertion of C/C++ header guardians
function! globals#InsertHeaderGuardian()
	let GuardianName = substitute(toupper(expand("%:t")), "\\.", "_", "g")
    execute "normal! i#pragma once"
    execute "normal! 2o"
	" execute "normal! i#ifndef " . GuardianName
	" execute "normal! o#define " . GuardianName
	" execute "normal! Go#endif /* " . GuardianName . " */"
	" normal! k3o
	" normal! k
endfunction
