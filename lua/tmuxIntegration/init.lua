local api = vim.api

function sleep(n)
  os.execute("sleep " .. tonumber(n))

end

local function moveLeft()
	local windows = api.nvim_tabpage_list_wins(0)
	local currentWin = api.nvim_get_current_win()

	local pos = api.nvim_win_get_position(currentWin)[2]

	local mini = pos
	for i = 1,#windows do
		local winPos = api.nvim_win_get_position(windows[i])[2]
		if(winPos < mini) then
			mini = winPos
		end
	end
	if(mini < pos) then
		-- Move inside vim
		-- Move inside TMUX
		api.nvim_command(':wincmd h')
	else
		os.execute('tmux select-pane -L')
	end
end
local function moveUp()
	local windows = api.nvim_tabpage_list_wins(0)
	local currentWin = api.nvim_get_current_win()

	local pos = api.nvim_win_get_position(currentWin)[1]

	local mini = pos
	for i = 1,#windows do
		local winPos = api.nvim_win_get_position(windows[i])[1]
		if(winPos < mini) then
			mini = winPos
		end
	end
	if(mini < pos) then
		-- Move inside vim
		-- Move inside TMUX
		api.nvim_command(':wincmd k')
	else
		os.execute('tmux select-pane -U')
	end
end

local function moveRight()
	local windows = api.nvim_tabpage_list_wins(0)
	local currentWin = api.nvim_get_current_win()

	local pos = api.nvim_win_get_position(currentWin)[2]

	local maxi = pos
	for i = 1,#windows do
		local winPos = api.nvim_win_get_position(windows[i])[2]
		if(winPos > maxi) then
			maxi = winPos
		end
	end
	if(maxi > pos) then
		-- Move inside vim
		api.nvim_command(':wincmd l')
	else
		-- Move inside TMUX
		os.execute('tmux select-pane -R')
	end
end

local function moveDown()
	local windows = api.nvim_tabpage_list_wins(0)
	local currentWin = api.nvim_get_current_win()

	local pos = api.nvim_win_get_position(currentWin)[1]

	local maxi = pos
	for i = 1,#windows do
		local winPos = api.nvim_win_get_position(windows[i])[1]
		if(winPos > maxi) then
			maxi = winPos
		end
	end
	if(maxi > pos) then
		-- Move inside vim
		api.nvim_command(':wincmd j')
	else
		-- Move inside TMUX
		os.execute('tmux select-pane -D')
	end
end



return {
	moveLeft = moveLeft,
	moveRight = moveRight,
	moveUp = moveUp,
	moveDown = moveDown,
}
