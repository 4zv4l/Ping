Player = {}

function Player:load()
	self.sprite = love.graphics.newImage("sprites/player.png")
	self.x = 50
	self.y = love.graphics.getHeight() / 2
	self.width = self.sprite:getWidth() -- 20
	self.height = self.sprite:getHeight() -- 100
	self.speed = 500
end

function Player:update(dt)
	self:move(dt)
end

-- move the player up and down
function Player:move(dt)
	gK = love.keyboard.isDown -- shorter func call
	if gK("z", "up")then
		self.y = self.y - self.speed * dt
	elseif gK("s", "down") then
		self.y = self.y + self.speed * dt
	end

	-- move with the mouse
	if love.mouse.isDown(1) then
		xMouse = love.mouse.getX()
		if xMouse < love.graphics.getWidth() / 2 then
			self.y = self.y + self.speed * dt
		elseif xMouse > love.graphics.getWidth() / 2 then
			self.y = self.y - self.speed * dt
		end
	end

	self:checkBorders()
end

-- check the player doesn't go beyond the window borders
function Player:checkBorders()
	height = love.graphics.getHeight()
	if self.y < 0 then
		self.y = 0
	elseif self.y + self.height > height then
		self.y = height - self.height
	end
end

function Player:draw()
	-- love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
	love.graphics.draw(self.sprite, self.x, self.y)
end
