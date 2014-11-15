Button = require("button")

function Navigation(layout)
	buttons = {}
	for i, layer in ipairs(layout.layers) do
		if layer.name == "navigation" then
			for j, obj in ipairs(layer.objects) do
					table.insert(buttons, Button(
						obj.x, obj.y, obj.width, obj.height
					))
			end
		end
	end
	return buttons
end

return Navigation