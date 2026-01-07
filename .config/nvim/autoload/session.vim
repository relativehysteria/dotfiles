if exists('g:loaded_project_session')
    finish
endif

let g:loaded_project_session = 1

" Return (and ensure) the directory used to store session files
function! session#dir() abort
    let l:dir = stdpath('data') . '/sessions'
    if !isdirectory(l:dir)
        call mkdir(l:dir, 'p')
    endif
    return l:dir
endfunction

" Find the project root by walking up to Cargo.toml or .git
function! session#find_base() abort
    let l:targets = ['Cargo.toml', '.git']
    let l:dir = getcwd()

    while l:dir !=# '/'
        for l:target in l:targets
            if filereadable(l:dir . '/' . l:target) || isdirectory(l:dir . '/' . l:target)
                return l:dir
            endif
        endfor
        let l:dir = fnamemodify(l:dir, ':h')
    endwhile

    return getcwd()
endfunction

" Compute a stable short hash for the current project root
function! session#hash() abort
    let l:base = session#find_base()
    return sha256(l:base)[0:15]
endfunction

" Build the full path to the session file for this project
function! session#file() abort
    let l:hash = session#hash()
    return session#dir() . '/' . l:hash . '.vim'
endfunction

" Echo a message prefixed with the current project session hash
function! session#echo(msg) abort
    echo '[ ' . session#hash() . ' ] ' . a:msg
endfunction

" Save the current session for this project
function! session#save() abort
    let l:file = session#file()
    execute 'mksession!' fnameescape(l:file)
    call session#echo('Session saved')
endfunction

" Restore the saved session for this project if it exists
function! session#restore() abort
    let l:file = session#file()
    if filereadable(l:file)
        execute 'source' fnameescape(l:file)
        call session#echo('Session restored')
    else
        call session#echo('No session for this project')
    endif
endfunction
