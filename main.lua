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


function love.load()
	local layout = require "content.shipLayout"

	objects.ship = Ship(layout)
	objects.navigation = Navigation(layout)
	objects.background = Background()
	objects.players = {}
	objects.projectiles = {}
	objects.weapons = {}
	objects.gunControls = {}
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
end

function love.draw()
	objects.background:draw()
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

end


