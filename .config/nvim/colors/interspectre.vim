if version > 580
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif

let g:colors_name = "interspectre"


if !exists("g:interspectre_background")
    let g:interspectre_background = 0
endif

if g:interspectre_background == 1
    hi LineNr        guifg=#573A7A guibg=#09010C guisp=#14011C gui=NONE      ctermfg=60  ctermbg=53  cterm=NONE
    hi Normal        guifg=#AD8CD3 guibg=#0b000F guisp=#16001F gui=NONE      ctermfg=140 ctermbg=53  cterm=NONE
    hi NonText       guifg=#9F5AFA guibg=#09010C guisp=#14011C gui=NONE      ctermfg=135 ctermbg=53  cterm=NONE
else
    hi LineNr        guifg=#573A7A guibg=NONE    guisp=NONE    gui=NONE      ctermfg=60  ctermbg=53  cterm=NONE
    hi Normal        guifg=#AD8CD3 guibg=NONE    guisp=#16001F gui=NONE      ctermfg=140 ctermbg=53  cterm=NONE
    hi NonText       guifg=#9F5AFA guibg=NONE    guisp=#14011C gui=NONE      ctermfg=135 ctermbg=53  cterm=NONE
endif


" ---
" RED
" ---
hi Number            guifg=#FF6FAF guibg=NONE    guisp=NONE    gui=NONE      ctermfg=125  ctermbg=NONE cterm=NONE
hi Float             guifg=#EA4A8A guibg=NONE    guisp=NONE    gui=NONE      ctermfg=89   ctermbg=NONE cterm=NONE
hi SpellBad          guifg=#D84587 guibg=NONE    guisp=NONE    gui=UNDERLINE ctermfg=89   ctermbg=NONE cterm=NONE
hi Character         guifg=#C83577 guibg=NONE    guisp=NONE    gui=BOLD      ctermfg=54   ctermbg=NONE cterm=NONE
hi String            guifg=#C32082 guibg=NONE    guisp=NONE    gui=NONE      ctermfg=89   ctermbg=NONE cterm=NONE
hi Special           guifg=#DA0CBF guibg=NONE    guisp=NONE    gui=NONE      ctermfg=128  ctermbg=NONE cterm=NONE
hi SpecialChar       guifg=#DA0CBF guibg=NONE    guisp=NONE    gui=NONE      ctermfg=128  ctermbg=NONE cterm=NONE
hi Boolean           guifg=#CF3FBF guibg=NONE    guisp=NONE    gui=NONE      ctermfg=54   ctermbg=NONE cterm=NONE
hi Identifier        guifg=#CC58C0 guibg=NONE    guisp=NONE    gui=NONE      ctermfg=5    ctermbg=NONE cterm=NONE
hi Exception         guifg=#F27AE6 guibg=NONE    guisp=NONE    gui=ITALIC    ctermfg=204  ctermbg=NONE cterm=NONE


" ----
" BLUE
" ----
hi Type              guifg=#A074FF guibg=NONE    guisp=NONE    gui=NONE      ctermfg=141  ctermbg=NONE cterm=NONE
hi StorageClass      guifg=#8954D9 guibg=NONE    guisp=NONE    gui=NONE      ctermfg=9    ctermbg=NONE cterm=NONE
hi Keyword           guifg=#7C58F0 guibg=NONE    guisp=NONE    gui=NONE      ctermfg=99   ctermbg=NONE cterm=NONE
hi Structure         guifg=#7854EB guibg=NONE    guisp=NONE    gui=NONE      ctermfg=98   ctermbg=NONE cterm=NONE
hi Typedef           guifg=#694FDB guibg=NONE    guisp=NONE    gui=NONE      ctermfg=98   ctermbg=NONE cterm=NONE
hi Conditional       guifg=#902DFA guibg=NONE    guisp=NONE    gui=NONE      ctermfg=13   ctermbg=NONE cterm=BOLD
hi Statement         guifg=#902DFA guibg=NONE    guisp=NONE    gui=NONE      ctermfg=13   ctermbg=NONE cterm=BOLD
hi Operator          guifg=#A84EED guibg=NONE    guisp=NONE    gui=NONE      ctermfg=135  ctermbg=NONE cterm=NONE
hi Repeat            guifg=#AB51FF guibg=NONE    guisp=NONE    gui=NONE      ctermfg=212  ctermbg=NONE cterm=NONE
hi Function          guifg=#D000EF guibg=NONE    guisp=NONE    gui=NONE      ctermfg=5    ctermbg=NONE cterm=NONE
hi Delimiter         guifg=#D83EFD guibg=NONE    guisp=NONE    gui=NONE      ctermfg=128  ctermbg=NONE cterm=NONE
hi Macro             guifg=#C254CC guibg=NONE    guisp=NONE    gui=NONE      ctermfg=170  ctermbg=NONE cterm=NONE
hi Label             guifg=#C270E6 guibg=NONE    guisp=NONE    gui=ITALIC    ctermfg=98   ctermbg=NONE cterm=NONE
hi Constant          guifg=#CD8CD3 guibg=NONE    guisp=NONE    gui=ITALIC    ctermfg=53   ctermbg=NONE cterm=BOLD
hi Union             guifg=#8B7DD1 guibg=NONE    guisp=NONE    gui=NONE      ctermfg=104  ctermbg=NONE cterm=NONE


" -------
" SOMETHING IN THE BETWEEN
" -------
hi PreProc           guifg=#FF40CF guibg=NONE    guisp=NONE    gui=NONE      ctermfg=5    ctermbg=NONE cterm=NONE
hi Define            guifg=#950EC2 guibg=NONE    guisp=NONE    gui=NONE      ctermfg=5    ctermbg=NONE cterm=NONE
hi Include           guifg=#8A0BFF guibg=NONE    guisp=NONE    gui=NONE      ctermfg=5    ctermbg=NONE cterm=NONE
hi Comment           guifg=#7F3BB1 guibg=NONE    guisp=NONE    gui=NONE      ctermfg=54   ctermbg=NONE cterm=NONE
hi SpecialComment    guifg=#8f1B81 guibg=NONE    guisp=NONE    gui=NONE      ctermfg=54   ctermbg=NONE cterm=NONE
hi Todo              guifg=#8653B5 guibg=NONE    guisp=NONE    gui=BOLD      ctermfg=97   ctermbg=NONE cterm=BOLD
hi PreCondit         guifg=#AF6BFF guibg=NONE    guisp=NONE    gui=NONE      ctermfg=134  ctermbg=NONE cterm=NONE


" -------
" SPECIAL
" -------
hi PMenuSbar         guifg=NONE    guibg=#130C1A guisp=#130C1A gui=NONE      ctermfg=NONE ctermbg=234  cterm=NONE
hi PMenuSel          guifg=#887C94 guibg=#1A0F2E guisp=#1A0F2E gui=NONE      ctermfg=246  ctermbg=236  cterm=NONE
hi PMenu             guifg=#6F33C4 guibg=#170E1F guisp=#170E1F gui=NONE      ctermfg=4    ctermbg=234  cterm=NONE
hi PMenuThumb        guifg=#4E14CC guibg=#1F122E guisp=#1f122e gui=NONE      ctermfg=56   ctermbg=236  cterm=NONE

hi DiffDelete        guifg=#7F3BA1 guibg=NONE    guisp=NONE    gui=UNDERLINE ctermfg=167  ctermbg=NONE cterm=NONE
hi DiffText          guifg=#91285B guibg=NONE    guisp=NONE    gui=NONE      ctermfg=89   ctermbg=NONE cterm=NONE
hi DiffAdd           guifg=#289C64 guibg=NONE    guisp=NONE    gui=NONE      ctermfg=35   ctermbg=NONE cterm=NONE
hi DiffChange        guifg=#7184D1 guibg=NONE    guisp=NONE    gui=NONE      ctermfg=104  ctermbg=NONE cterm=NONE

hi Folded            guifg=#7F3BB1 guibg=NONE    guisp=NONE    gui=UNDERLINE ctermfg=54   ctermbg=NONE cterm=NONE
hi FoldColumn        guifg=#7F3BB1 guibg=NONE    guisp=NONE    gui=UNDERLINE ctermfg=54   ctermbg=NONE cterm=NONE

hi CursorLine        guifg=NONE    guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE
hi CursorLineNr      guifg=#AB8AD1 guibg=NONE    guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=NONE cterm=NONE

hi MatchParen        guifg=#C78585 guibg=#4E375C guisp=#4e375c gui=NONE      ctermfg=174  ctermbg=59   cterm=BOLD
hi Title             guifg=#E1AFE6 guibg=NONE    guisp=NONE    gui=BOLD      ctermfg=182  ctermbg=NONE cterm=BOLD
hi Debug             guifg=#FFDEAD guibg=NONE    guisp=NONE    gui=NONE      ctermfg=223  ctermbg=NONE cterm=NONE
hi Search            guifg=#444444 guibg=#AF87D7 guisp=#af87d7 gui=NONE      ctermfg=238  ctermbg=140  cterm=NONE
hi WarningMsg        guifg=#FFFFFF guibg=#FF0000 guisp=NONE    gui=BOLD      ctermfg=196  ctermbg=NONE cterm=NONE
hi Visual            guifg=NONE    guibg=NONE    guisp=NONE    gui=REVERSE   ctermfg=234  ctermbg=97   cterm=NONE
hi VertSplit         guifg=#664466 guibg=NONE    guisp=NONE    gui=NONE      ctermfg=238  ctermbg=NONE cterm=NONE
hi StatusLine        guifg=#AD8CD3 guibg=NONE    guisp=NONE    gui=NONE      ctermfg=140  ctermbg=NONE cterm=NONE
hi StatusLineNC      guifg=#AD8CD3 guibg=NONE    guisp=NONE    gui=NONE      ctermfg=140  ctermbg=NONE cterm=NONE
hi ColorColumn       guifg=NONE    guibg=#A01030 guisp=NONE    gui=NONE      ctermfg=NONE ctermbg=89   cterm=NONE
