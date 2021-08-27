if exists("b:latex_loaded_already")
	finish
endif
let b:latex_loaded_already=1

function! tex#Compile()
	execute "!pdflatex % ; pdflatex % ; biber %:r ; pdflatex %"
endfunction
