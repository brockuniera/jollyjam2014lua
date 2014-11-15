Player = require "player"

objects = {}

function love.load()
	objects.player = Player()
end

function love.update(dt)
	objects.player:update(dt)
end

function love.draw()
	objects.player:draw()
end