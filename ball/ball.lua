local ball = {x = 800/2-16, y = 600/2-16, image = love.graphics.newImage("ball/ball.png"), sideSize = 32}

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
end
return ball
