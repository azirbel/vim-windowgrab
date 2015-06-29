if !exists('g:windowgrab_map_keys')
   let g:windowgrab_map_keys = 1
endif

if g:windowgrab_map_keys
  nnoremap <silent> <leader>c :call WindowSwap#DoWindowSwap()<CR>
  nnoremap <silent> <leader>v :call WindowSwap#MoveWindow()<CR>
endif

let g:loaded_windowgrab = 1
