Ball = {}

function Ball:load()
	self.sprite = love.graphics.newImage("sprites/ball.png")
	self.x = love.graphics.getWidth() / 2
	self.y = love.graphics.getHeight() / 2
	self.width = self.sprite:getWidth() -- 20
	self.height = self.sprite:getHeight() -- 100
	self.defaultSpeed = 200
	self.speed = self.defaultSpeed
	-- velocity of the ball start by going to the player
	self.xVel = -self.speed
	self.yVel = 0
end

function Ball:update(dt)
	self:move(dt)
	self:collide()
end

function Ball:collide()
	self:collidePlayer()
	self:collideAI()
	self:collideWall()
	self:score()
end

-- check if it touches the Player
function Ball:collidePlayer()
	if checkCollision(self, Player) then
		self.xVel = self.speed -- bounce to the right
		local middleBall = self.y + self.height / 2
		local middlePlayer = Player.y + Player.height / 2
		local collisionPosition = middleBall - middlePlayer
		-- change the angle depends on where it collides
		self.yVel = collisionPosition * 5
	end
end

-- check if it touches the AI
function Ball:collideAI()
	if checkCollision(self, AI) then
		self.xVel = -self.speed -- bounce to the left
		local middleBall = self.y + self.height / 2
		local middleAI = AI.y + AI.height / 2
		local collisionPosition = middleBall - middleAI
		-- change the angle depends on where it collides
		self.yVel = collisionPosition * 5
	end
end

-- check if it touches a wall
function Ball:collideWall()
	local Height = love.graphics.getHeight()
	-- top wall
	if self.y < 0 then
		self.y = 0
		self.yVel = -self.yVel
	-- bottom wall
	elseif self.y + self.height > Height then
		self.y = Height - self.height
		self.yVel = -self.yVel
	end
end

-- check if it touches the left or right wall
function Ball:score()
	local Width = love.graphics.getWidth()
	-- left wall
	if self.x < 0 then
		self.x = 0
		self.xVel = -self.xVel
		score.ai = score.ai + 1
		self:reset()
	-- right wall
	elseif self.x + self.width > Width then
		self.x = Width - self.width
		self.xVel = -self.xVel
		score.player = score.player + 1
		self:reset()
	end
end

function Ball:reset()
	self.speed = self.defaultSpeed
	self.xVel = self.speed
	self.yVel = 0
	self.x = love.graphics.getWidth() / 2 - self.width / 2
	self.y = love.graphics.getHeight() / 2 - self.height / 2
end

function Ball:move(dt)
	self.x = self.x + self.xVel * dt
	self.y = self.y + self.yVel * dt
end

function Ball:draw()
	-- love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
	love.graphics.draw(self.sprite, self.x, self.y)
end