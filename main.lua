Player = require "player"
Ship = require "ship"

objects = {}

function love.load()
	objects.ship = Ship()
	objects.player = Player()
end

function love.update(dt)
	objects.player:update(dt)
	objects.ship:update(dt)
end

function love.draw()
	objects.ship:draw()
	objects.player:draw()
end