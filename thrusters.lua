Thruster = require("thruster")

function Thrusters(layout)
	thrstrs = {}
	for i, layer in ipairs(layout.layers) do
		if layer.name == "thruster" then
			for j, obj in ipairs(layer.objects) do
					table.insert(thrstrs, Thruster(
						obj.type,
						obj.x, obj.y, obj.width, obj.height
					))
			end
		end
	end
	return thrstrs
end

return Thrusters