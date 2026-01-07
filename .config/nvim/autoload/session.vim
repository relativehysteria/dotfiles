if exists('g:loaded_project_session')
    finish
endif

let g:loaded_project_session = 1

function! session#dir() abort
    let l:dir = stdpath('data') . '/sessions'
    if !isdirectory(l:dir)
        call mkdir(l:dir, 'p')
    endif
    return l:dir
endfunction

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

function! session#hash() abort
    let l:base = session#find_base()
    return sha256(l:base)[0:15]
endfunction

function! session#file() abort
    let l:hash = session#hash()
    return session#dir() . '/' . l:hash . '.vim'
endfunction

function! session#echo(msg) abort
    echo '[ ' . session#hash() . ' ] ' . a:msg
endfunction

function! session#save() abort
    let l:file = session#file()
    execute 'mksession!' fnameescape(l:file)
    call session#echo('Session saved')
endfunction

function! session#restore() abort
    let l:file = session#file()
    if filereadable(l:file)
        execute 'source' fnameescape(l:file)
        call session#echo('Session restored')
    else
        call session#echo('No session for this project')
    endif
endfunction
