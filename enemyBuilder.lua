function createEnemies(level)
	local RANGE = 400
	local MIN = 100

	for a, layer in ipairs(level.layers) do
		if layer.name == "Enemies" then
			for i, obj in pairs(layer.objects) do
				local x = 0
				local y = 0

				--build enemies
				while y < obj.height do
					while x < obj.width do
						x = x + MIN + lume.random(0, RANGE)
						local position = {
							['x'] = x + obj.x,
							['y'] = y + obj.y + lume.random(0, RANGE)
						}
						table.insert(objects.enemies, Enemy(position.x, position.y))
					end
					y = y + RANGE
				end
			end

		end
	end

end

return enemyBuilder
