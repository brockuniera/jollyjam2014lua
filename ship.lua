function Ship()
	local ship = {}
	local layout = require "content.shipLayout"

	ship.colliders = {}

	for i, layer in ipairs(layout.layers) do
		if layer.name == "ground" then
			for j, obj in ipairs(layer.objects) do
				collider = shapes.newPolygonShape(
					obj.x, obj.y,
					obj.x + obj.width, obj.y,
					obj.x + obj.width, obj.y + obj.height,
					obj.x, obj.y + obj.height
				)
				table.insert(ship.colliders, collider)
			end
		elseif layer.name == "spawns" then
			ship.spawns = layer.objects
		end
	end

	function ship:update(dt)

	end

	function ship:draw()
		for i, collider in ipairs(self.colliders) do
			love.graphics.setColor(150, 150, 150)
			collider:draw("fill")
		end
	end

	return ship
end

return Ship