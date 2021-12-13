Background = {}

function Background:load()
    self.universe = love.graphics.newImage("sprites/universe.png")
    self.planets = love.graphics.newImage("sprites/planets.png")
    self.width = self.planets:getWidth()
    self.height = self.planets:getHeight()
    self.Wscale = love.graphics.getWidth() / self.universe:getWidth()
    self.Hscale = love.graphics.getHeight() / self.universe:getHeight()
    self.rotation = 0
end

function Background:update(dt)
    self.rotation = self.rotation + 0.05 * dt
end

function Background:draw()
    love.graphics.draw(self.universe, 0, 0, 0, self.Wscale, self.Hscale)
    love.graphics.draw(self.planets, self.width / 2, self.height / 2, self.rotation, 1, 1,self.width / 2, self.height / 2)
end