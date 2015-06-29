" WindowGrab!

let s:markedWinNum = 0

function! WindowGrab#MarkWindow()
  let s:markedWinNum = winnr()
endfunction

function! WindowGrab#ClearMarkedWindowNum()
   let s:markedWinNum = 0
endfunction

function! WindowGrab#GetMarkedWindowNum()
   return s:markedWinNum
endfunction

function! WindowGrab#HasMarkedWindow()
  if WindowGrab#GetMarkedWindowNum() == 0
    return 0
  else
    return 1
  endif
endfunction

" Marks and swaps windows.
" If nothing is marked: marks the current window to be swapped/moved
" If a window has already been marked: swaps the current (destination) window
" with the marked window.
function! WindowGrab#DoWindowGrab()
  if WindowGrab#HasMarkedWindow()
    " Window already marked: swap destination and marked windows
    let destNum = winnr()
    let destBuf = bufnr("%")
    " Switch back to the marked window
    exe WindowGrab#GetMarkedWindowNum() . "wincmd w"
    let markedBuf = bufnr("%")
    " Open destination buffer in marked window.
    " Hide and open so that we aren't prompted and keep history
    exe 'hide buf' destBuf
    " Switch to the destination window
    exe destNum . "wincmd w"
    " Open marked buffer in destination window.
    " Hide and open so that we aren't prompted and keep history
    exe 'hide buf' markedBuf
    call WindowGrab#ClearMarkedWindowNum()
  else
    call WindowGrab#MarkWindow()
  endif
endfunction

" Moves the grabbed window to the current (destination) window, closing the
" original.
" TODO: Do nothing if the destination is the same as the marked window
function! WindowGrab#MoveWindow()
  if !WindowGrab#HasMarkedWindow()
    echom "No window marked to move! Mark a window first."
    return
  endif
  let destNum = winnr()
  let destBuf = bufnr("%")
  " Switch back to the marked window
  exe WindowGrab#GetMarkedWindowNum() . "wincmd w"
  let markedBuf = bufnr("%")
  " Close the marked window
  exe "close"
  " Switch to the destination window
  exe destNum . "wincmd w"
  " Open marked buffer in destination window.
  " Hide and open so that we aren't prompted and keep history
  exe 'hide buf' markedBuf
  call WindowGrab#ClearMarkedWindowNum()
endfunction
