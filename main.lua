require("src/player")
require("src/ball")
require("src/ai")
require("src/background")


function love.load()
	Player:load()
	Ball:load()
	AI:load()
	Background:load()

	score = {player = 0, ai = 0}
	font = love.graphics.newFont(30)
end

function love.update(dt)
	Player:update(dt)
	Ball:update(dt)
	AI:update(dt)
	Background:update(dt)
end

function checkCollision(a,b)
	if a.x + a.width > b.x and a.x < b.x + b.width and a.y + a.height > b.y and a.y < b.y + b.height then
		-- increase ball speed everytime the ball touches a paddle
		Ball.speed = Ball.speed + 25
		return true
	end
	return false
end

function love.draw()
	Background:draw()
	Player:draw()
	Ball:draw()
	AI:draw()
	drawScore()
end

function drawScore()
	local Height = love.graphics.getHeight()
	local Width = love.graphics.getWidth()
	love.graphics.setFont(font)
	love.graphics.print(score.player, 50, 50)
	love.graphics.print(score.ai, Width - 50 , 50)
end
