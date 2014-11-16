-- Globals
lume = require "lib.lume"
shapes = require "lib.collider.shapes"
objects = {}


-- Constructors
local Player = require "player"
local Ship = require "ship"
local Navigation = require "navigation"
local Background = require "background"
local Minimap = require "minimap"

function love.load()
	local layout = require "content.shipLayout"

	objects.ship = Ship(layout)
	objects.navigation = Navigation(layout)
	objects.background = Background()
	objects.minimap = Minimap()
	objects.players = {}

	--objects.player = Player("keyboard")
end

function love.keypressed(key)
	-- Add player when someone presses space
	if key == " " then
		for i, player in ipairs(objects.players) do
			if player.input == "keyboard" then
				-- There's already a keyboard player
				return
			end
		end
		-- There is no keyboard player yet. Make one.
		table.insert(objects.players, Player("keyboard"))
	end
end

function love.joystickpressed(joystick, button)
	-- Add player when someone presses A
	local inputType, aIndex = joystick:getGamepadMapping("a")
	if button == aIndex then
		for i, player in ipairs(objects.players) do
			if player.input == joystick then
				-- There's already a player with this joystick
				return
			end
		end
		-- No player has this joystick yet
		table.insert(objects.players, Player(joystick))
	end
end

function love.update(dt)
	for i, player in ipairs(objects.players) do
		player:update(dt)
	end
	for i, nav in ipairs(objects.navigation) do
		nav:update(dt)
	end
	objects.ship:update(dt)
	objects.minimap:update(dt)
end

function love.draw()
	love.graphics.push()
	love.graphics.rotate(-objects.ship.angle)
	love.graphics.translate(
		-objects.ship.x,
		-objects.ship.y
	)

	objects.background:draw({x = objects.ship.x, y = objects.ship.y})
	love.graphics.pop()

	love.graphics.push()
	love.graphics.translate(
		love.graphics.getWidth()/2 - 550/2,
		love.graphics.getHeight()/2 - 381/2
	)
	
	objects.ship:draw()
	for i, nav in ipairs(objects.navigation) do
		nav:draw()
	end
	for i, player in ipairs(objects.players) do
		player:draw()
	end
	love.graphics.pop()

	objects.minimap:draw()
end
