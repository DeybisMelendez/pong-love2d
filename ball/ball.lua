local ball = {
    x = 800/2-16,
    y = 600/2-16,
    image = love.graphics.newImage("ball/ball.png"),
    sideSize = 32,
    speed = 400,
    dirX = -0.5,
    dirY = -0.5,
}

function ball:new(o)
    o = o or {}
    self.__index = self
    setmetatable(o, self)
    return o
end

function ball:draw()
    love.graphics.draw(self.image, self.x, self.y)
end

function ball:update(dt)
    self.x = self.x + self.dirX * self.speed * dt
    self.y = self.y + self.dirY * self.speed * dt
    if self.y < 0 then
        self.dirY = 0.5
    elseif self.y > 600-32 then
        self.dirY = -0.5
    end
end
return ball
