if (exists('g:loaded_ultisnips_manualcomplete'))
  finish
endif
let g:loaded_ultisnips_manualcomplete = 1

let s:save_cpo = &cpo
set cpo&vim

inoremap <silent> <Plug>(ultisnips-manualcomplete) <C-r>=ultisnips_manualcomplete#complete()<CR>

let &cpo = s:save_cpo
unlet s:save_cpo
