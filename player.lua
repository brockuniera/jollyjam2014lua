require "animated_sprite"
local MOVE_SPEED = 200
local DEADZONE = .2

function Player(input)

	local animation = AnimatedSprite:create("hero.png", 32, 32, 4, 1)
	local player = {
		x = 0,
		y = 0,
	animation = animation,
	width =  animation.width,
	height = animation.height,
	Directions = {
		["Right"] = 0,
		["Up"] = 1,
		["Left"] = 2,
		["Down"] = 3
	},
	direction = 0.0

	}

	--Load sprite lists for animation
	player.animation:load()

	player.input = input

	-- Collider
	player.collider = shapes.newPolygonShape(
		player.x, player.y,
		player.x + player.width, player.y,
		player.x + player.width, player.y + player.height,
		player.x, player.y + player.height
	)

	-- Get ref to ship
	ship = objects.ship
	if ship == nil then
		assert(false, "Must load ship before player")
	end

	-- Pick a spawn point
	spawn = ship:getSpawn()
	player.x = spawn.x
	player.y = spawn.y

	function player:update(dt)
		local velX = 0
		local velY = 0

		if self.input == "keyboard" then
			-- Keyboard input
			if love.keyboard.isDown("d") then
				velX = MOVE_SPEED * dt
			elseif love.keyboard.isDown("a") then
				velX = -MOVE_SPEED * dt
			end

			if love.keyboard.isDown("w") then
				velY = -MOVE_SPEED * dt
			elseif love.keyboard.isDown("s") then
				velY = MOVE_SPEED * dt
			end
		else
			-- Controller input
			velX = self.input:getGamepadAxis("leftx")
			velY = self.input:getGamepadAxis("lefty")

			-- Deadzone
			if math.abs(velX) < DEADZONE then
				velX = 0
			end
			if math.abs(velY) < DEADZONE then
				velY = 0
			end
		end

			if(velX == 0.0 and velY == 0.0) then
				--Stop moving
				self.animation:set_animation(false)
			else 
				self.animation:set_animation(true)
				self.animation:update(dt)
				-- aim player in correct direction
				self.direction = math.atan2(velY, velX) + 3.0*math.pi/2.0
			end
				
		-- Move collider to new location (on X axis)
		self.x = self.x + velX
		self.collider:moveTo(self.x, self.y)

		-- Make sure it still collides with ship
		local collision = false
		for i, shipCollider in ipairs(ship.colliders) do
			if self.collider:collidesWith(shipCollider) then
				-- There was a collision
				collision = true
				break
			end
		end

		if not collision then
			-- Reset position
			self.x = self.x - velX
		end

		-- Do same for Y axis
		self.y = self.y + velY
		self.collider:moveTo(self.x, self.y)

		-- Make sure it still collides with ship
		collision = false
		for i, shipCollider in ipairs(ship.colliders) do
			if self.collider:collidesWith(shipCollider) then
				-- There was a collision
				collision = true
				break
			end
		end

		if not collision then
			-- Reset position
			self.y = self.y - velY
		end
		self.collider:moveTo(self.x, self.y)
	end

	function player:draw()
		love.graphics.setColor(145, 145, 145)
		--self.collider:draw("fill")
		self.animation:draw(self.x, self.y, self.direction)
		print (self.direction)
	end

	return player
end

return Player
