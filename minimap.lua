local X = 5
local Y = 5
local MARGIN = 10
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

		local shipX = MARGIN + X + objects.ship.x / WORLD_WIDTH
		local shipY = MARGIN + Y + objects.ship.y / WORLD_HEIGHT
		love.graphics.setColor(0, 255, 0)



		local verts = {
			-5, -5,
			10, 0,
			-5, 5
		}
		-- Rotate verticies
		for i = 1, #verts, 2 do
			local c = math.cos(objects.ship.angle)
			local s = math.sin(objects.ship.angle)

			local tempX = verts[i] * c - verts[i+1] * s
			local tempY = verts[i] * s + verts[i+1] * c;

			verts[i] = tempX + shipX
			verts[i+1] = tempY + shipY
		end

		love.graphics.polygon("fill", verts)

		
		love.graphics.setColor(255, 255, 255)
		love.graphics.rectangle("line", X, Y, WIDTH, HEIGHT)
	end

	return minimap
end

return Minimap