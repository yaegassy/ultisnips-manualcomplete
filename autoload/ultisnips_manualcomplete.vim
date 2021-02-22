if exists('g:autoloaded_ultisnips_manualcomplete')
  finish
endif
let g:autoloaded_ultisnips_manualcomplete= 1

let s:save_cpo = &cpo
set cpo&vim

" ----

" function! ultisnips_manualcomplete#complete() abort
"   let l:word_to_complete = matchstr(strpart(getline('.'), 0, col('.') - 1), '\S\+$')
"   let l:from_where = col('.') - len(l:word_to_complete)
"   let l:contain_word = 'stridx(v:val.word, l:word_to_complete)>=0'
"   let l:candidates = vsnip#get_complete_items(bufnr('%'))
"   let l:matches = map(filter(l:candidates, l:contain_word),
"     \ "{
"     \  'word': v:val.word,
"     \  'menu': v:val.kind,
"     \  'dup' : 1,
"     \ }")
"
"   if !empty(l:matches)
"     call complete(l:from_where, l:matches)
"   endif
"   return ''
" endfunction

" ----

function! ultisnips_manualcomplete#complete() abort
  if empty(UltiSnips#SnippetsInCurrentScope(1))
    return ''
  endif
  let word_to_complete = matchstr(strpart(getline('.'), 0, col('.') - 1), '\S\+$')
  let contain_word = 'stridx(v:val, word_to_complete) >= 0'
  let candidates = map(filter(keys(g:current_ulti_dict_info), contain_word),
        \ "{
        \    'word': v:val,
        \    'menu': '[snip] '. g:current_ulti_dict_info[v:val]['description'],
        \    'dup' : 1,
        \  }")
  let from_where = col('.') - len(word_to_complete)
  if !empty(candidates)
    call complete(from_where, candidates)
  endif
  return ''
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
