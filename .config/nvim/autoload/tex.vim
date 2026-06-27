if exists("b:latex_loaded_already")
	finish
endif
let b:latex_loaded_already=1

"; biber %:r ; makeindex %:r ; pdflatex % ; pdflatex %"
function! tex#compile()
	execute "!pdflatex % ; pdflatex %"
endfunction
