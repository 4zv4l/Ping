AI = {}

function AI:load()
    self.sprite = love.graphics.newImage("sprites/ai.png")
	self.width = self.sprite:getWidth() -- 20
	self.height = self.sprite:getHeight() -- 100
	self.x = love.graphics.getWidth() - self.width - 50
	self.y = love.graphics.getHeight() / 2
	self.speed = 500
    self.yVel = 0
    -- timer to make the AI wait before check for the ball
    self.timer = 0
    self.rate = 0.75
end

function AI:update(dt)
    AI:move(dt)
    self.timer = self.rate + dt
    if self.timer > self.rate then
        self.timer = 0
        AI:aquireTarget()
    end
end

function AI:move(dt)
    self.y = self.y + self.yVel * dt
end

function AI:aquireTarget()
    if Ball.y + Ball.height < self.y then
        self.yVel = -self.speed
    elseif Ball.y + Ball.height > self.y + self.height then
        self.yVel = self.speed
    else
        self.yVel = 0
    end
end

function AI:draw()
    -- love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
	love.graphics.draw(self.sprite, self.x, self.y)
end