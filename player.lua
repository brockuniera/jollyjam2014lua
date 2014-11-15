local MOVE_SPEED = 50

function Player()
	local player = {
		x = 0,
		y = 0,
		width = 10,
		height = 10
	}

	function player:update(dt)
		if love.keyboard.isDown("d") then
			self.x = self.x + MOVE_SPEED * dt
		elseif love.keyboard.isDown("a") then
			self.x = self.x - MOVE_SPEED * dt
		end

		if love.keyboard.isDown("w") then
			self.y = self.y - MOVE_SPEED * dt
		elseif love.keyboard.isDown("s") then
			self.y = self.y + MOVE_SPEED * dt
		end
	end

	function player:draw()
		love.graphics.rectangle("fill",
			self.x, self.y, self.width, self.height)
	end

	return player
end

return Player