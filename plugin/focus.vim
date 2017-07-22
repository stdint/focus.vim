" focus.vim
"
let s:total_win_count = winnr('$')
let s:current_winnr = winnr()

let s:win_height_array = []
let s:win_width_array = []

function! s:GetWindowStats()
  let s:current_winnr = winnr()
  let s:total_win_count = winnr('$')

  let i = 1
  while i <= s:total_win_count
    call add(s:win_height_array, winheight(i))
    call add(s:win_width_array, winwidth(i))
    let i += 1
  endwhile

  echo s:win_height_array
  echo s:win_width_array
endfunction

function! s:FocusCurrentWindow()
  execute "wincmd t"
  let i = 1
  while i <= s:total_win_count
    if i != s:current_winnr
      execute "resize 0"
      execute "vertical resize 0"
    endif
    execute "wincmd w"
    let i += 1
  endwhile

  " move the cursor back
  let i = 1
  while i != s:current_winnr
    execute "wincmd w"
    let i = winnr()
  endwhile
endfunction

"call s:GetWindowStats()
call s:FocusCurrentWindow()
