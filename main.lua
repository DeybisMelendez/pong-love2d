local pad = require "pad.pad"
local bg = require "bg.bg"
local ball = require "ball.ball"

local font = love.graphics.newFont("font.ttf", 32)
love.graphics.setFont(font)

local bluePad = pad:new{
    image = "pad/BluePad.png",
    speed = 200
}
local greenPad = pad:new{
    image = "pad/GreenPad.png",
    x = love.graphics.getWidth()-32,
    buttonUp = "k",
    buttonDown = "m",
    speed = 500
}

local background = bg:new()

local state = "start" -- "game", "restart", "finish"
local game = {}
local start = {}

local function CheckCollision(x1,y1,w1,_, x2,y2,w2,h2)
  return (x1 + w1) > x2 and (x1 + w1) < (x2 + w2) and y1 > y2 and y1 < (y2 + h2),
        x1 < (x2 + w2) and x1 > x2 and y1 > y2 and y1 < (y2 + h2)
end

local function checkBodiesCollision(body)
    local rightCol, leftCol = CheckCollision(
        ball.x, ball.y, ball.sideSize, ball.sideSize,
        body.x, body.y, body.width, body.height
    )
    if rightCol then
        ball.dirX = -0.5
    elseif leftCol then
        ball.dirX = 0.5
    end
end

function game.draw()
    background:draw()
    bluePad:draw()
    greenPad:draw()
    ball:draw()
end

function game.update(dt)
    bluePad:update(dt)
    greenPad:update(dt)
    ball:update(dt)
    checkBodiesCollision(bluePad)
    checkBodiesCollision(greenPad)
end

function start.draw()
    background:draw()
    love.graphics.setColor(0, 0, 0)
    love.graphics.printf("Press Space to start", 0, 200, 800, "center")
    love.graphics.setColor(1,1,1)
end

function start.update(_)
    if love.keyboard.isDown("space") then
        state = "game"
    end
end

function love.draw()
    if state == "start" then
        start.draw()
    elseif state == "game" then
        game.draw()
    elseif state == "finish" then
    elseif state == "restart" then
    end
end

function love.update(dt)
    if state == "start" then
        start.update(dt)
    elseif state == "game" then
        game.update(dt)
    elseif state == "finish" then
    elseif state == "restart" then
    end
end
