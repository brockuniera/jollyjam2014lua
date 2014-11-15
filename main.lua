-- Globals
lume = require "lib.lume"
shapes = require "lib.collider.shapes"
objects = {}

-- Constructors
local Player = require "player"
local Ship = require "ship"

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