local X = 5
local Y = 5
local WIDTH = 200
local HEIGHT = 200
local WORLD_WIDTH = 4000
local WORLD_HEIGHT = 4000

function Minimap()
	minimap = {}

	function minimap:update(dt)

	end

	function minimap:draw()
		love.graphics.setColor(0, 0, 0)
		love.graphics.rectangle("fill", X, Y, WIDTH, HEIGHT)

		local shipX = objects.ship.x / WORLD_WIDTH
		local shipY = objects.ship.y / WORLD_HEIGHT
		love.graphics.setColor(0, 255, 0)
		love.graphics.rectangle("fill", X + shipX,
			Y + shipY, 5, 5)

		
		love.graphics.setColor(255, 255, 255)
		love.graphics.rectangle("line", X, Y, WIDTH, HEIGHT)
	end

	return minimap
end

return Minimap