" focus.vim
"
let s:total_win_count = winnr('$')
let s:current_winnr = winnr()

let s:win_height_array = []
let s:win_width_array = []

function! ArchiveWindowConfiguration()
  let s:win_height_array = []
  let s:win_width_array = []
  let s:current_winnr = winnr()
  let s:total_win_count = winnr('$')

  let i = 1
  while i <= s:total_win_count
    call add(s:win_height_array, winheight(i))
    call add(s:win_width_array, winwidth(i))
    let i += 1
  endwhile

  "echo s:win_height_array
  "echo s:win_width_array
endfunction

function! FocusCurrentWindow()
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
  " last check if we changed the focused window too small by mistake, move it
  " back
  if winheight(i) < s:win_height_array[i - 1]
    execute "resize ".s:win_height_array[i - 1]
  endif
  if winwidth(i) < s:win_width_array[i - 1]
    execute "vertical resize ".s:win_width_array[i - 1]
  endif
endfunction

function! RestoreArchivedWindowConfig()
  execute "wincmd t"
  let i = 1
  while i <= s:total_win_count
    execute "resize ".s:win_height_array[i - 1]
    execute "vertical resize ".s:win_width_array[i - 1]
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

function! ArchiveAndFocusCurrentWindow()
  call ArchiveWindowConfiguration()
  call FocusCurrentWindow()
endfunction

" Commands
command! FocusArchive call ArchiveWindowConfiguration()
command! FocusFocus call FocusCurrentWindow()
command! FocusArchiveFocus call ArchiveAndFocusCurrentWindow()
command! FocusRestore call RestoreArchivedWindowConfig()

