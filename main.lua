-- Globals
lume = require "lib.lume"
shapes = require "lib.collider.shapes"
objects = {}

-- Constructors
local Player = require "player"
local Ship = require "ship"

function love.load()
	objects.ship = Ship()
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
	objects.ship:update(dt)
end

function love.draw()
	objects.ship:draw()
	for i, player in ipairs(objects.players) do
		player:draw()
	end
end