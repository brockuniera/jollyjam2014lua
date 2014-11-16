-- Globals
lume = require "lib.lume"
shapes = require "lib.collider.shapes"
objects = {}

-- Constructors
local Player = require "player"
local Gun = require "gun"
local GunControl = require "gunControl"
local Ship = require "ship"
local Navigation = require "navigation"
local Background = require "background"
local Minimap = require "minimap"

local AsteroidFields = require "asteroidFields"

function love.load()
	local layout = require "content.shipLayout"

	objects.ship = Ship(layout)
	objects.navigation = Navigation(layout)
	objects.background = Background()
	objects.minimap = Minimap()
	objects.players = {}
	objects.projectiles = {}
	objects.weapons = {}
	objects.gunControls = {}

	local asteroidSprites = {
		love.graphics.newImage("images/asteroid_1.png"),
		love.graphics.newImage("images/asteroid_2.png")
	}
	local level = require "levels.level1"
	objects.asteroidFields = AsteroidFields(level.layers[2], asteroidSprites)
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
		table.insert(objects.players, Player("keyboard", 2))
		table.insert(objects.weapons, Gun("keyboard", 2))
		table.insert(objects.gunControls, GunControl("keyboard", 1.00))
		objects.weapons[#objects.weapons].x =objects.gunControls[#objects.gunControls].x
		objects.weapons[#objects.weapons].y =objects.gunControls[#objects.gunControls].y

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
	for i, gunControl in ipairs(objects.gunControls) do
		gunControl:update(dt)
		if gunControl.canFire then
			--print("Firing is possible")
			objects.weapons[i]:update(gunControl.firingAngle)
			if gunControl.doesFire then
				--table.insert(objects.projectiles, Projectile(
				print("FIRE")
			end
		end
	end
	for i, nav in ipairs(objects.navigation) do
		nav:update(dt)
	end
	objects.ship:update(dt)
	objects.minimap:update(dt)

	objects.asteroidFields:update(dt)
end

function love.draw()
	love.graphics.push()
	love.graphics.rotate(-objects.ship.angle)
	love.graphics.translate(
		-objects.ship.x,
		-objects.ship.y
	)

	objects.background:draw({x = objects.ship.x, y = objects.ship.y})
	objects.asteroidFields:draw()
	love.graphics.pop()

	love.graphics.push()
	love.graphics.translate(
		love.graphics.getWidth()/2 - 550/2,
		love.graphics.getHeight()/2 - 381/2
	)

	for i, gun in ipairs(objects.weapons) do
		gun:draw()
	end
	objects.ship:draw()
	for i, gunControl in ipairs(objects.gunControls) do
		gunControl:draw()
	end
	for i, nav in ipairs(objects.navigation) do
		nav:draw()
	end
	for i, player in ipairs(objects.players) do
		player:draw()
	end
	love.graphics.pop()


	objects.minimap:draw()
end
