if exists("b:latex_loaded_already")
	finish
endif
let b:latex_loaded_already=1

function! tex#compile()
	execute "!pdflatex % ; pdflatex % ; biber %:r ; makeindex %:r ; pdflatex % ; pdflatex %"
endfunction
