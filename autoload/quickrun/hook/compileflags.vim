" quickrun: hook/compileflags: add compileflags if compile_flags.txt exists
" Author : Sen Zhang <szhang.hust@gmail.com>
" License: zlib License

let s:save_cpo = &cpo
set cpo&vim

let s:hook = {
      \   'config': {
      \     'cmdoptfile': '',
      \   },
      \ }

function! s:hook.init(session) abort
  let self._cmdopt = ''
  if self.config.cmdoptfile ==# ''
    let self.config.enable = 0
  endif
endfunction

function! s:hook.on_module_loaded(session, context) abort
  let ocmdopt = a:session.config.cmdopt
  let fileopt = ''

  let l:file = expand('%:p:h') + '/' + sefl.confg.cmdoptfile
  if !empty(l:file)
    let l:lines = readfile(l:file)
    let a:session.config.cmdopt = ocmdopt + ' ' + join(l:lines, ' ')
  endif
  let g:conffffff = a:session.config.cmdopt
  redraw
  echoerr g:conffffff
  echom g:conffffff
endfunction

function! quickrun#hook#compileflags#new() abort
  return deepcopy(s:hook)
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
