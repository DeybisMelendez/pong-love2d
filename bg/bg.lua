local bg = {x = 0, y = 0, image = love.graphics.newImage("bg/bg.png")}

function bg:new(o)
    o = o or {}
    self.__index = self
    setmetatable(o, self)
    return o
end

function bg:draw()
    love.graphics.draw(self.image, self.x, self.y)
end

return bg
