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

function drawGame()
    background:draw()
    bluePad:draw()
    greenPad:draw()
    ball:draw()
end

function updateGame(dt)
    bluePad:update(dt)
    greenPad:update(dt)
    ball:update(dt)
end

function drawStart()
    background:draw()
    love.graphics.setColor(0, 0, 0)
    love.graphics.printf("Press Space to start", 0, 200, 800, "center")
    love.graphics.setColor(1,1,1)
end

function updateStart(dt)
    if love.keyboard.isDown("space") then
        state = "game"
    end
end

function love.draw()
    if state == "start" then
        drawStart()
    elseif state == "game" then
        drawGame()
    elseif state == "finish" then
    elseif state == "restart" then
    end
end

function love.update(dt)
    if state == "start" then
        updateStart(dt)
    elseif state == "game" then
        updateGame(dt)
    elseif state == "finish" then
    elseif state == "restart" then
    end
end
