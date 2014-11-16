local sprite = love.graphics.newImage("images/Fireball_green.png")
local MOVE_SPEED = 800

function EnemyProjectile(x, y, angle)
	proj = {
		x = x,
		y = y,
		angle = angle + math.pi/2,
		life = 800
	}

	function proj:update(dt)
		local velX = math.cos(self.angle)*MOVE_SPEED*dt
		local velY = math.sin(self.angle)*MOVE_SPEED*dt
		self.x = self.x + velX
		self.y = self.y + velY

		if objects.ship.worldCollider:contains(self.x, self.y) then
			self.life = 0
			if objects.ship.shieldStrength > 0 then
				objects.ship.shieldStrength = objects.ship.shieldStrength - 5
			else
				objects.ship.hullStrength = objects.ship.hullStrength - 1
			end
		end
	end

	function proj:draw()
		love.graphics.draw(sprite, self.x, self.y, self.angle)
	end

	return proj
end

return EnemyProjectile