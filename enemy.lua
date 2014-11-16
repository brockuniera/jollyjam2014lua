local SHOOT_DISTANCE = 1000
local SHOOT_TIME = 1

local enemySprites = {
	love.graphics.newImage("images/Blue_Enemy.png"),
	love.graphics.newImage("images/Cyan_Enemy.png"),
	love.graphics.newImage("images/Magenta_Enemy.png"),
	love.graphics.newImage("images/Orange_Enemy.png"),
	love.graphics.newImage("images/Red_Enemy.png")
}

function Enemy(x, y)
	local enemy = {
		x = x,
		y = y,
		sprite = lume.randomchoice(enemySprites),
		angle = 0,
		shootTimer = SHOOT_TIME
	}
	enemy.collider = shapes.newCircleShape(x, y, 100)

	function enemy:update(dt)
		coords = objects.ship:getCoords()
		self.angle = math.atan2(
			self.y - coords.y,
			self.x - coords.x
		) + math.pi/2
		if lume.distance(self.x, self.y, coords.x, coords.y) < SHOOT_DISTANCE then
			self.shootTimer = self.shootTimer - dt
			if self.shootTimer <= 0 then
				self.shootTimer = SHOOT_TIME
				--table.insert(objects.projectiles, Projectile("enemy", self.x, self.y, 0, 0, self.angle, .25, 0, 0))
			end
		end
	end

	function enemy:draw()
		love.graphics.setColor(255,255,255,255)
		love.graphics.draw(self.sprite, self.x, self.y, self.angle, 1, 1,
			self.sprite:getWidth()/2, self.sprite:getHeight()/2)
	end

	return enemy
end

return Enemy