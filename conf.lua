function love.conf(t)
	t.title = "Pong"	-- window title
	-- t.console = true	-- debug console
	t.window.height = 500
	t.window.length = 200
	t.modules.joystick = false 
	t.releases = {
		package = nil,            -- The project command and package name (string)
		version = 1.1,            -- The project version
		author = "4zv4l",             -- Your name (string)
		description = "Pong Game",        -- The project description (string)
	}
end
