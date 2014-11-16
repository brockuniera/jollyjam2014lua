-- Globals
lume = require "lib.lume"
shapes = require "lib.collider.shapes"
objects = {}
gunShotSound = love.audio.newSource("Sound/Shot1.wav", "static") -- the "static" tells LÖVE to load the file into memory, good for short sound effects
music = love.audio.newSource("Sound/TIMES.mp3") -- if "static" is omitted, LÖVE will stream the file from disk, good for longer music tracks
music:setLooping()

old_love_audio_play = love.audio.play
function love.audio.play(source)
  if not source:isStopped() then
        source:rewind()
  else
        old_love_audio_play(source)
  end
end

-- Constructors
local Player = require "player"
local Projectile = require "projectile"
local Gun = require "gun"
local GunControl = require "gunControl"
local Thrusters = require "thrusters"
local Ship = require "ship"
local Navigation = require "navigation"
local Background = require "background"
local Minimap = require "minimap"
local Shake = require "shake"
local Enemy = require "enemy"

--local blur = love.graphics.newShader("lib/blur.frag")
--blur:send("CanvasSize", {love.graphics.getDimensions()})

scale = .5

local AsteroidFields = require "asteroidFields"

function love.load()
	local layout = require "content.shipLayout"
	local level = require "levels.level1"
	local asteroidSprites = {
		love.graphics.newImage("images/asteroid_1.png"),
		love.graphics.newImage("images/asteroid_2.png")
	}

	objects.asteroidFields = AsteroidFields(level, asteroidSprites)

	music:play()

	objects.ship = Ship(layout, level)
	objects.navigation = Navigation(layout)
	objects.thrusters = Thrusters(layout)

	
	objects.background = Background()
	objects.minimap = Minimap()
	objects.shake = Shake()
	objects.players = {}
	objects.projectiles = {}
	objects.weapons = {}
	objects.gunControls = {}

	objects.enemies = {
		Enemy(50, 50)
	}

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
		objects.weapons[#objects.weapons].x =objects.gunControls[#objects.gunControls].x +30
		objects.weapons[#objects.weapons].y =objects.gunControls[#objects.gunControls].y

	end
-- Add player when someone presses p
--TODO this is an adhoc second player
	if key == "p" then
		for i, player in ipairs(objects.players) do
			if player.input == "keyboard2" then
				-- There's already a keyboard player
				return
			end
		end
		-- There is no keyboard2 player yet. Make one.
		table.insert(objects.players, Player("keyboard2", 2))
		table.insert(objects.weapons, Gun("keyboard2", 2))
		table.insert(objects.gunControls, GunControl("keyboard2", 1.00))
		objects.weapons[#objects.weapons].x =objects.gunControls[#objects.gunControls].x +30
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
				love.audio.play(gunShotSound)				
				table.insert(objects.projectiles, Projectile(gunControl.pivotx, gunControl.pivoty, -40, 150, gunControl.firingAngle - math.pi/2.0, .25, objects.ship.velocity, objects.ship.angle))
				table.insert(objects.projectiles, Projectile(gunControl.pivotx, gunControl.pivoty, 0, 150, gunControl.firingAngle - math.pi/2.0, .25, objects.ship.velocity, objects.ship.angle))
				table.insert(objects.projectiles, Projectile(gunControl.pivotx, gunControl.pivoty, 40, 150, gunControl.firingAngle - math.pi/2.0, .25, objects.ship.velocity, objects.ship.angle))
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
	for i, thr in ipairs(objects.thrusters) do
		thr:update(dt)
	end
	for i, nav in ipairs(objects.navigation) do
		nav:update(dt)
	end
	for i, enemy in ipairs(objects.enemies) do
		enemy:update(dt)
	end
	objects.ship:update(dt)
	objects.background:update(dt)
	objects.minimap:update(dt)
	--blur:send("Blur", {objects.shake.offsetX, objects.shake.offsetY})
	objects.asteroidFields:update(dt)
	--shake:update(dt)
end

function love.draw()
	love.graphics.push()
	love.graphics.scale(scale, scale)
	love.graphics.rotate(-objects.ship.angle)
	love.graphics.translate(
		-objects.ship.x,
		-objects.ship.y
	)

	objects.background:draw({x = objects.ship.x, y = objects.ship.y})
	-- Enemies
	for i, enemy in ipairs(objects.enemies) do
		enemy:draw()
	end

	objects.asteroidFields:draw()
	love.graphics.pop()

	love.graphics.push()
	love.graphics.scale(scale, scale)
	love.graphics.translate(
		love.graphics.getWidth()/(scale*2) - 550/2 + objects.shake.offsetX,
		love.graphics.getHeight()/(scale*2) - 381/2 + objects.shake.offsetY
	)
	love.graphics.setShader(blur)

	for i, projectile in ipairs(objects.projectiles) do
		projectile:draw()
	end
	for i, gun in ipairs(objects.weapons) do
		gun:draw()
	end
	for i, thr in ipairs(objects.thrusters) do
		--assert(i<2)
		thr:draw()
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
			
	love.graphics.setShader()
	love.graphics.pop()


	objects.minimap:draw()


end
