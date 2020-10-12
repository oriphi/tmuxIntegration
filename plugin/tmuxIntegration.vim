
"let g:MPDRunning = 0

fun! InitTmux()
	lua for k in pairs(package.loaded) do if k:match("tmuxIntegration") then package.loaded[k] = nil end end
endfun

fun! MoveLeft()
	lua require("tmuxIntegration").moveLeft()
endfun

fun! MoveRight()
	lua require("tmuxIntegration").moveRight()
endfun

fun! MoveUp()
	lua require("tmuxIntegration").moveUp()
endfun

fun! MoveDown()
	lua require("tmuxIntegration").moveDown()
endfun


augroup TmuxCommands
	autocmd!
augroup END


noremap <silent> <C-h> :call MoveLeft()<CR>
noremap <silent> <C-j> :call MoveDown()<CR>
noremap <silent> <C-k> :call MoveUp()<CR>
noremap <silent> <C-l> :call MoveRight()<CR>
