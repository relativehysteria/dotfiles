if exists("b:globals_loaded_already")
	finish
endif
let b:globals_loaded_already=1

" brackets and parentheses coloring
function! globals#syntax_after()
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

	hi BrackParen guifg=#484E44 guibg=NONE guisp=NONE gui=NONE ctermfg=140 ctermbg=53 cterm=NONE

	hi link _Paren BrackParen
	hi link _Operator Operator
	hi link _Delimiter Delimiter
endfunction

" dark and light colorscheme toggle
function! globals#toggle_colorscheme()
    let g:dark_colorscheme = 'lackluster'
    let current = get(g:, 'colors_name', '')

    if current ==# g:dark_colorscheme
        execute 'colorscheme' 'minimal'
        hi String guifg=#000000
        hi SpecialComment guifg=#9590A0
        hi Comment guifg=#909090
        hi StatusLine guifg=#000000
    else
        execute 'colorscheme' g:dark_colorscheme
        hi SpecialComment guifg=#555060
        hi Comment guifg=#505050
        hi Normal guibg=None
    endif

    " Yeah i wish there was a better way but i don't think there is :/
    autocmd VimEnter * call globals#syntax_after()
    call globals#syntax_after()

    hi StatusLine guibg=None
    hi LineNr guibg=None
    hi CursorLine guibg=None
    hi CursorLineNr guibg=None
    hi SpellBad guifg=#D84587
endfunction

" insertion of C/C++ header guardians
function! globals#insert_header_guardian()
	let GuardianName = substitute(toupper(expand("%:t")), "\\.", "_", "g")
    execute "normal! i#pragma once"
    execute "normal! 2o"
	" execute "normal! i#ifndef " . GuardianName
	" execute "normal! o#define " . GuardianName
	" execute "normal! Go#endif /* " . GuardianName . " */"
	" normal! k3o
	" normal! k
endfunction

function! globals#prevent_long_lines() abort
    " Allow :w!
    if v:cmdbang
        return
    endif

    " Only check if colorcolumn is set and numeric
    if &colorcolumn == ''
        return
    endif

    " Get first column if multiple are set
    let l:cc = str2nr(split(&colorcolumn, ',')[0])
    if l:cc <= 0
        return
    endif

    " cc=81 should mean that we allow 80 columns
    if l:cc > 1
        let l:cc = l:cc - 1
    endif

    " Check for long lines
    for l:num in range(1, line('$'))
        if strdisplaywidth(getline(l:num)) > l:cc
            echohl ErrorMsg
            echom printf(
                \ "Line %d exceeds %d columns (use :w! to override)",
                \ l:num, l:cc)
            echohl None
            throw "Long line detected"
        endif
    endfor
endfunction
