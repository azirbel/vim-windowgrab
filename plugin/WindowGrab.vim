if !exists('g:windowgrab_map_keys')
   let g:windowgrab_map_keys = 1
endif

if g:windowgrab_map_keys
  nnoremap <silent> <leader>c :call WindowGrab#DoWindowGrab()<CR>
  nnoremap <silent> <leader>v :call WindowGrab#MoveWindow()<CR>
endif

let g:loaded_windowgrab = 1
