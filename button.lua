function Button(type, x, y, width, height)
	local button = {
		type = type,
		x = x,
		y = y,
		width = width,
		height = height
	}

	button.collider = shapes.newPolygonShape(
		button.x, button.y,
		button.x + button.width, button.y,
		button.x + button.width, button.y + button.height,
		button.x, button.y + button.height
	)

	button.pressed = false

	function button:update(dt)
		-- Set pressed to true when any player collides with me
		players = objects.players
		assert(players)
		self.pressed = false
		for i, player in ipairs(players) do
			if self.collider:collidesWith(player.collider) then
				self.pressed = true
			end
		end
		-- Pass input to ship
		objects.ship.controls[self.type] = self.pressed
	end

	function button:draw()
		if self.pressed then
			love.graphics.setColor(0, 155, 0)
		else
			love.graphics.setColor(0, 255, 0)
		end
		self.collider:draw("fill")
	end

	return button
end

return Button