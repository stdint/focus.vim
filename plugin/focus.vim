" focus.vim
"
let s:total_win_count = winnr('$')
let s:current_winnr = winnr()

let s:win_height_array = []
let s:win_width_array = []


function GetWindowStats()
  let i = 1
  while i <= s:total_win_count
    call add(s:win_height_array, winheight(i))
    call add(s:win_width_array, winwidth(i))
    let i += 1
  endwhile

  "echo s:win_height_array
  "echo s:win_width_array
endfunction

