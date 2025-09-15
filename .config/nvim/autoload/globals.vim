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
