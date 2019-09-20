local pad = {x = 0, y = 0, width = 32, height = 128, buttonUp = "a", buttonDown = "z", speed = 100}

function pad:new(o)
    o = o or {}
    if o.image then
        o.sprite = love.graphics.newImage(o.image)
    end
    self.__index = self
    setmetatable(o, self)
    return o
end

function pad:draw()
    if self.image then
        love.graphics.draw(self.sprite, self.x, self.y)
    end
end

function pad:update(dt)
    if love.keyboard.isDown(self.buttonUp) and self.y >= 2 then
        self.y = self.y - self.speed * dt
    elseif love.keyboard.isDown(self.buttonDown) and self.y < 470 then
        self.y = self.y + self.speed * dt
    end
end

return pad
