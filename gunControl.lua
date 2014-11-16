require "animated_sprite"
function GunControl(input, scaling, players)
	local animation
	if players == 1 then
		animation = AnimatedSprite:create("images/Gun_control-Right.png", 100, 50, 1, 1)
	else
		animation = AnimatedSprite:create("images/Gun_control-Left.png", 100, 50, 1, 1)
	end
	local gunControl = {
		x = 290,
		y = 260,
		animation = animation,
		width =  animation.width,
		height = animation.height,
		firingAngle = 0.0,
		radius = 1.0,
		canFire = false,
		doesFire = false,
		scaling = scaling,
		COOLDOWN = 15,
		timeSinceFired = 0
	}

	spawn = ship:getCtrl()
	gunControl.x = spawn.x
	gunControl.y = spawn.y

	gunControl.animation:load()
	gunControl.radius = gunControl.height
	gunControl.pivotx = gunControl.x 
	gunControl.pivoty = gunControl.y - gunControl.height/2.0
	
	gunControl.collider = shapes.newPolygonShape(
	gunControl.x - gunControl.width/2.0, gunControl.y - gunControl.height/2.0,
	gunControl.x + gunControl.width/2.0, gunControl.y - gunControl.height/2.0,
	gunControl.x + gunControl.width/2.0, gunControl.y + gunControl.height/2.0,
	gunControl.x - gunControl.width/2.0, gunControl.y + gunControl.height/2.0
	)

	gunControl.pressed = false

	function gunControl:update(dt)
		-- Set pressed to true when any player collides with me
		players = objects.players
		assert(players)
		self.canFire = false
		self.doesFire = false
		self.pressed = false

		for i, player in ipairs(players) do
			if self.collider:collidesWith(player.collider) then
				if self:computeUsability(player.x, player.y) then
					self.canFire = true
					self.firingAngle = self:computeFiringAngle(player.x, player.y)

					if player.isUsing then
						self.pressed = true
						self.doesFire = true
					else
						self.pressed = false
						self.doesFire = false
					end
				end
			end
		end
		-- Pass input to ship
		--objects.ship.controls[self.type] = self.pressed
		self.timeSinceFired = self.timeSinceFired + dt*100
	end

	function gunControl:draw()
		if self.pressed then
			love.graphics.setColor(145, 165, 145)
			self.animation:draw(self.x, self.y, 0.0, scaling)
		else
			love.graphics.setColor(145, 145, 145)
			self.animation:draw(self.x, self.y, 0.0, scaling)
		end
	end

	function gunControl:computeFiringAngle(playerX, playerY)
		return math.atan2(playerY - self.pivoty, playerX - self.pivotx) - math.pi/2.0
	end

	function gunControl:computeUsability(playerX, playerY)
		if playerY > self.pivoty and (math.pow(playerY - self.pivoty, 2.0) + math.pow(playerX - self.pivotx, 2.0) < math.pow(self.radius, 2.0)) then
			return true
		end
		return false
	end

	return gunControl
end

return GunControl
