if exists('g:loaded_project_session')
  finish
endif
let g:loaded_project_session = 1

" Where sessions are stored
function! session#dir() abort
  let l:dir = stdpath('data') . '/sessions'
  if !isdirectory(l:dir)
    call mkdir(l:dir, 'p')
  endif
  return l:dir
endfunction

" Determine project root (git root > cwd)
function! session#project_root() abort
  let l:git_root = systemlist('git rev-parse --show-toplevel 2>/dev/null')
  if len(l:git_root) > 0 && !empty(l:git_root[0])
    return l:git_root[0]
  endif
  return getcwd()
endfunction

" Generate session filename from project root (hashed)
function! session#file() abort
  let l:root = session#project_root()
  let l:hash = sha256(l:root)[0:15]
  return session#dir() . '/' . l:hash . '.vim'
endfunction

" Save session
function! session#save() abort
  let l:file = session#file()
  execute 'mksession!' fnameescape(l:file)
  echo 'Session saved'
endfunction

" Restore session
function! session#restore() abort
  let l:file = session#file()
  if filereadable(l:file)
    execute 'source' fnameescape(l:file)
    echo 'Session restored'
  else
    echo 'No session for this project'
  endif
endfunction
