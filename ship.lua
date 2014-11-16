local SHAKE_THRESHOLD = 100
local ACCEL = 10
local MAX_TURN_SPEED = math.pi * .1
local TURN_ACCEL = math.pi * .0004
local MAX_SPEED = 50
local TURN_MULT = 2
local DECEL_MULT = 2
local TURN_DRAG = .995 * 60

function Ship(layout, level)
	local ship = {
		angle = 0,
		x = 0,
		y = 0,
		velocity = 0,
		angleVel = 0
	}

	ship.colliders = {}
	ship.walls = {}
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
				local points = {}
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
		elseif layer.name == "walls" then
			for j, obj in ipairs(layer.objects) do
				local points = {}
				for i, point in ipairs(obj.polygon) do
					table.insert(points, obj.x + point.x)
					table.insert(points, obj.y + point.y)
				end

				wall = shapes.newPolygonShape(unpack(points))

				table.insert(ship.walls, wall)
			end
		end
	end

	-- Places ship in world based on level file
	for i, layer in ipairs(level.layers) do
		if layer.name == "Spawn" and layer.objects then
			ship.x = layer.objects[1].x
			ship.y = layer.objects[1].y
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
		local accel = ACCEL
		
		if self.controls.forward then
			if self.velocity < 0 then
				accel = accel * TURN_MULT
			end
			self.velocity = self.velocity + accel * dt
		end
		if self.controls.back then
			if self.velocity > 0 then
				accel = accel * TURN_MULT
			end
			self.velocity = self.velocity - accel * dt
		end

		local turnAccel = TURN_ACCEL

		local applyDrag = true
		if self.controls.left then
			applyDrag = false -- only apply drag if there's no movement
			if self.angleVel > 0 then
				turnAccel = turnAccel * TURN_MULT
			end
			self.angleVel = self.angleVel - turnAccel * dt
		end
		if self.controls.right then
			applyDrag = false -- only apply drag if there's no movement
			if self.angleVel < 0 then
				turnAccel = turnAccel * TURN_MULT
			end
			self.angleVel = self.angleVel + turnAccel * dt
		end

		if applyDrag then
			self.angleVel = self.angleVel * TURN_DRAG * dt
		end

		-- Calculate velocity
		local xVel = math.cos(self.angle) * self.velocity
		local yVel = math.sin(self.angle) * self.velocity

		-- Apply velocity
		self.x = self.x + xVel
		self.y = self.y + yVel
		self.angle = self.angle + self.angleVel

		if self.velocity > SHAKE_THRESHOLD then
			objects.shake.intensity = self.velocity - SHAKE_THRESHOLD
			objects.shake.length = 1
		end
	end

	function rotatePoint(point, origin, degrees)
	    local x = origin.x + ( math.cos(degrees) * (point.x - origin.x) - math.sin(degrees) * (point.y - origin.y) )
	    local y = origin.y + ( math.sin(degrees) * (point.x - origin.x) + math.cos(degrees) * (point.y - origin.y) )
	    point.x = x
	    point.y = y
	end

	function ship:getCoords()
		point = {
			x = love.graphics.getWidth()/(scale*2) + self.x,
			y = love.graphics.getHeight()/(scale*2) + self.y,
		}
		rotatePoint(point, self, self.angle)
		return point
	end

	function ship:draw()
		love.graphics.setColor(255,255,255)
		love.graphics.draw(self.image)
		--[[\\for i, collider in ipairs(self.colliders) do
			love.graphics.setColor(150, 150, 150)
			collider:draw("fill")
		end]]--
	end

	return ship
end

return Ship
