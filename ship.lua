SHIP_X = 428
SHIP_Y = 115

local ACCEL = 10
local MAX_TURN_SPEED = math.pi * .1
local TURN_ACCEL = math.pi * .0004
local MAX_SPEED = 50
local TURN_MULT = 2

function Ship(layout)
	local ship = {
		angle = 0,
		x = 0,
		y = 0,
		velocity = 0,
		angleVel = 0
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

		local turnAccel = TURN_ACCEL
		if self.angleVel > 0 then
			turnAccel = turnAccel * TURN_MULT
		end

		if self.controls.left then
			self.angleVel = self.angleVel - turnAccel * dt
		end
		if self.controls.right then
			self.angleVel = self.angleVel + turnAccel * dt
		end

		-- Calculate velocity
		local xVel = math.cos(self.angle) * self.velocity
		local yVel = math.sin(self.angle) * self.velocity

		-- Apply velocity
		self.x = self.x + xVel
		self.y = self.y + yVel
		self.angle = self.angle + self.angleVel
	end

	function ship:draw()
		love.graphics.setColor(255,255,255)
		love.graphics.draw(self.image)
		--[[for i, collider in ipairs(self.colliders) do
			love.graphics.setColor(150, 150, 150)
			collider:draw("fill")
		end]]--
	end

	return ship
end

return Ship