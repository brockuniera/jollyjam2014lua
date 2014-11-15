local MOVE_SPEED = 200

function Player(input)
	local player = {
		x = 0,
		y = 0,
		width = 10,
		height = 10
	}

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
	spawn = lume.randomchoice(ship.spawns)
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
		love.graphics.setColor(255, 0, 0)
		self.collider:draw("fill")
	end

	return player
end

return Player