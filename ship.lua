function Ship()
	local ship = {}
	local layout = require "content.shipLayout"

	ship.ground = {}

	for i, layer in ipairs(layout.layers) do
		if layer.name == "ground" then
			for j, obj in ipairs(layer.objects) do
				table.insert(ship.ground, {
					x = obj.x,
					y = obj.y,
					width = obj.width,
					height = obj.height
				})
			end
		elseif layer.name == "spawns" then
			ship.spawns = layer.objects
		end
	end

	function ship:update(dt)
		
	end

	function ship:draw()
		for i, obj in ipairs(self.ground) do
			love.graphics.setColor(150, 150, 150)
			love.graphics.rectangle("fill",
				obj.x, obj.y, obj.width, obj.height)
		end
	end

	return ship
end

return Ship