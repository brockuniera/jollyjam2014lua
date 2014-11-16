require "animated_sprite"
local MOVE_SPEED = 200
local DEADZONE = .2

function Gun(input, scaling)

	local animation = AnimatedSprite:create("images/gatling_gun_small.png", 89, 256,1, 1)
	local gun = {
		x = 0,
		y = 0,
	animation = animation,
	width =  animation.width,
	height = animation.height,
	scaling = scaling,
	direction = 0.0

	}

	--Load sprite lists for animation
	gun.animation:load()

	gun.input = input

	-- Get ref to ship
	ship = objects.ship
	if ship == nil then
		assert(false, "Must load ship before gun")
	end

	-- Pick a spawn point
	--spawn = ship:getSpawn()
	--gun.x = spawn.x 
	--gun.y = spawn.y

	function gun:update(direction)
		--[[
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

			if love.keyboard.isDown(" ") then
				print ("KAPOW, give them aliens what for!")	
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
				-- aim gun in correct direction
				self.direction = math.atan2(velY, velX) + 3.0*math.pi/2.0
			end
			--]]
			self.direction = direction
	end

	function gun:draw()
		love.graphics.setColor(145, 145, 145)
		--self.collider:draw("fill")
		self.animation:draw(self.x, self.y, self.direction, self.scaling)
	end

	return gun
end

return Gun
