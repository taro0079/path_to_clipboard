" Copy current file path to clipboard
function! PathToClipboard()
  let l:file_path = expand('%:p')
  let l:current_row_number = line('.')
  let l:cwd = getcwd() . '/'
  let l:result = substitute(l:file_path, l:cwd, '', '')
  let l:full_path = l:result . ':' . l:current_row_number

  if empty(l:file_path)
    echo "No file path found"
    return
  endif

  if has('clipboard')
    " let @+ = l:file_path
    let @+ = l:full_path
    echo "File path copied to clipboard"
  else
    echo "Clipboard support is not available"
  endif
endfunction

command! PathToClipboard call PathToClipboard()

