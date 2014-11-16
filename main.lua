-- Globals
lume = require "lib.lume"
shapes = require "lib.collider.shapes"
objects = {}

-- Constructors
local Player = require "player"
local Projectile = require "projectile"
local Gun = require "gun"
local GunControl = require "gunControl"
local Ship = require "ship"
local Navigation = require "navigation"
local Background = require "background"
local Minimap = require "minimap"
local Shake = require "shake"

local AsteroidFields = require "asteroidFields"

function love.load()
	local layout = require "content.shipLayout"
	local level = require "levels.level1"
	local asteroidSprites = {
		love.graphics.newImage("images/asteroid_1.png"),
		love.graphics.newImage("images/asteroid_2.png")
	}

	objects.ship = Ship(layout, level)
	objects.asteroidFields = AsteroidFields(level, asteroidSprites)
	objects.navigation = Navigation(layout)

	objects.background = Background()
	objects.minimap = Minimap()
	objects.shake = Shake()
	objects.players = {}
	objects.projectiles = {}
	objects.weapons = {}
	objects.gunControls = {}
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
			if gunControl.doesFire and gunControl.timeSinceFired > gunControl.COOLDOWN then
				table.insert(objects.projectiles, Projectile(gunControl.pivotx, gunControl.pivoty, gunControl.firingAngle - math.pi/2.0, .125, objects.ship.velocity, objects.ship.angle))
				gunControl.timeSinceFired = 0.0
			end
		end
	end
	for i, projectile in ipairs(objects.projectiles) do
		if projectile.life <0 then
			table.remove(objects.projectiles, i)
		else
			projectile:update(dt)
		end
	end
	for i, nav in ipairs(objects.navigation) do
		nav:update(dt)
	end

	objects.ship:update(dt)
	objects.background:update(dt)
	objects.minimap:update(dt)
	objects.asteroidFields:update(dt)
	shake:update(dt)
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
		love.graphics.getWidth()/2 - 550/2 + objects.shake.offsetX,
		love.graphics.getHeight()/2 - 381/2 + objects.shake.offsetY
	)

	for i, projectile in ipairs(objects.projectiles) do
		projectile:draw()
	end
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
