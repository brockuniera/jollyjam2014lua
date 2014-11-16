function Enemy(x, y)
	local enemy = {
		x = x,
		y = y
	}

	function enemy:update(dt)

	end

	function enemy:draw()
		love.graphics.rectangle(self.x, self.y, 10, 10)
	end

	return enemy
end

return Enemy