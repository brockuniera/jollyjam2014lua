local ACCEL = 1
local TURN_SPEED = math.pi * .01
local MAX_SPEED = 20

function Ship(layout)
	local ship = {
		angle = 0,
		x = 0,
		y = 0,
		velocity = 0
	}

	ship.colliders = {}
	ship.controls = {
		left = false,
		right = false,
		back = false,
		forward = false
	}
	ship.image = love.graphics.newImage("images/Body_Small.png")

	for i, layer in ipairs(layout.layers) do
		if layer.name == "ground" then
			for j, obj in ipairs(layer.objects) do
				points = {}
				for i, point in ipairs(obj.polygon) do
					table.insert(points, obj.x + point.x)
					table.insert(points, obj.y + point.y)
				end

				collider = shapes.newPolygonShape(unpack(points))

				table.insert(ship.colliders, collider)
			end
		elseif layer.name == "spawns" then
			ship.spawns = layer.objects
			lume.shuffle(ship.spawns)
		end
	end

	function ship:getSpawn()
		-- pop a spawn
		spawn = table.remove(self.spawns, 1)
		-- push it to other end
		table.insert(self.spawns, spawn)

		return spawn
	end

	function ship:update(dt)
		-- Navigation controls
		if self.controls.forward then
			self.velocity = self.velocity + ACCEL * dt
		end
		if self.controls.back then
			self.velocity = self.velocity - ACCEL * dt
		end
		if self.controls.left then
			self.angle = self.angle - TURN_SPEED * dt
		end
		if self.controls.right then
			self.angle = self.angle + TURN_SPEED * dt
		end

		-- Calculate velocity
		local xVel = math.cos(self.angle) * self.velocity
		local yVel = math.sin(self.angle) * self.velocity

		-- Apply velocity
		self.x = self.x + xVel
		self.y = self.y + yVel
	end

	function ship:draw()
		love.graphics.setColor(255,255,255)
		love.graphics.draw(self.image, 428, 115)
		--[[for i, collider in ipairs(self.colliders) do
			love.graphics.setColor(150, 150, 150)
			collider:draw("fill")
		end]]--
	end

	return ship
end

return Ship