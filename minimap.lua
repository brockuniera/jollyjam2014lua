local X = 5
local Y = 5
local MARGIN = 10
local WIDTH = 200
local HEIGHT = 200
local WORLD_WIDTH = 100000
local WORLD_HEIGHT = 100000

function Minimap()
	minimap = {}

	function minimap:update(dt)

	end

	function minimap:draw()
		love.graphics.setScissor(X, Y, WIDTH, HEIGHT)
		love.graphics.setColor(0, 0, 0)
		love.graphics.rectangle("fill", X, Y, WIDTH, HEIGHT)

		-- Player ship
		local shipX = MARGIN + X + (objects.ship.x / WORLD_WIDTH) * (WIDTH-MARGIN)
		local shipY = MARGIN + Y + (objects.ship.y / WORLD_HEIGHT) * (HEIGHT-MARGIN)
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

		-- Enemies
		love.graphics.setColor(255, 0, 0)
		for i, enemy in ipairs(objects.enemies) do
			local enemyX = MARGIN + X + (enemy.x / WORLD_WIDTH) * (WIDTH-MARGIN)
			local enemyY = MARGIN + Y + (enemy.y / WORLD_HEIGHT) * (HEIGHT-MARGIN)

			love.graphics.circle("fill", enemyX, enemyY, 4)
		end

		-- Asteroids
		love.graphics.setColor(150, 60, 10)
		for i, val in pairs(objects.asteroidFields:get()) do
			for j, asteroid in pairs(val) do
				local asteroidX = MARGIN + X + (asteroid.x / WORLD_WIDTH) * (WIDTH-MARGIN)
				local asteroidY = MARGIN + Y + (asteroid.y / WORLD_HEIGHT) * (HEIGHT-MARGIN)

				love.graphics.circle("fill", asteroidX, asteroidY, 2)
			end
		end
		
		love.graphics.setColor(255, 255, 255)
		love.graphics.rectangle("line", X, Y, WIDTH, HEIGHT)
		love.graphics.setScissor()
	end

	return minimap
end

return Minimap