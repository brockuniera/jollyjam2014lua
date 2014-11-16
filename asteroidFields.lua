local Asteroid = require "asteroid"

local RANGE = 400 --max spread of asteroids
local MIN = 100 --min spread of asteroids

function AsteroidFields(level, sprites)
	local asteroidFields = {
		fields = {} --contains all asteroid fields
	}

	for a, layer in ipairs(level.layers) do
		if layer.name == "Asteroids" then

			for i, obj in ipairs(layer.objects) do
				--gets every asteroid field
				asteroidFields.fields[i] = {}

				local x = 0
				local y = 0

				--build asteroids
				while y < obj.height do
					while x < obj.width do
						x = x + MIN + lume.random(0, RANGE)
						local position = {
							['x'] = x + obj.x,
							['y'] = y + obj.y + lume.random(0, RANGE)
						}
						table.insert(asteroidFields.fields[i],
						Asteroid(position, lume.randomchoice(sprites)))
					end
					y = y + RANGE
				end
			end

		end
	end

	function asteroidFields:update(dt)
		for i, val in pairs(self.fields) do
			for j, asteroid in pairs(val) do
				asteroid:update(dt)
			end
		end
	end

	function asteroidFields:draw()
		for i, field in pairs(self.fields) do
			for j, asteroid in pairs(field) do
				asteroid:draw()
			end
		end
	end

	return asteroidFields
end

return AsteroidFields
