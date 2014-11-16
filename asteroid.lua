local TURN_SPEED = math.pi * .1   --base turn speed, randomly chosen

--images are the sprites for the asteroids
function Asteroid(position, images)
	local asteroid = {
		x = position.x,
		y = position.y,
		velocity = 0,
		angle,
		image,
		collider,
		turnVel
	}


	asteroid.image = love.graphics.newImage(lume.randomchoice(images))
	asteroid.collider = shapes.newCircleShape(asteroid.image:getWidth() / 2, asteroid.image:getHeight() / 2, asteroid.image:getWidth() / 2)

	asteroid.turnVel = lume.random(-TURN_SPEED, TURN_SPEED)
	asteroid.angle = lume.random(0, 2 * math.pi)

	function asteroid:update(dt)
		-- Float around predictably

		-- Apply velocity

		-- Apply rotation
		self.angle = self.angle + self.turnVel * dt
	end

	function asteroid:draw()
		love.graphics.setColor(255,255,255)
		love.graphics.draw(self.image, self.x, self.y, self.angle, 1, 1, self.image:getWidth()/2, self.image:getHeight()/2)
	end

	return asteroid
end

return Asteroid
