function Button(type, x, y, width, height)
	local button = {
		type = type,
		x = x,
		y = y,
		width = width,
		height = height
	}

	if button.type == "left" then
		button.sprite = love.graphics.newImage("images/Left.png")
		button.spritePressed = love.graphics.newImage("images/Left_Pressed.png")
		button.spriteBroken = love.graphics.newImage("images/Left_Broken.png")
	elseif button.type == "right" then
		button.sprite = love.graphics.newImage("images/Right.png")
		button.spritePressed = love.graphics.newImage("images/Right_Pressed.png")
		button.spriteBroken = love.graphics.newImage("images/Right_Broken.png")
	elseif button.type == "forward" then
		button.sprite = love.graphics.newImage("images/Forward.png")
		button.spritePressed = love.graphics.newImage("images/Forward_Pressed.png")
		button.spriteBroken = love.graphics.newImage("images/Forward_Broken.png")
	elseif button.type == "back" then
		button.sprite = love.graphics.newImage("images/Backward.png")
		button.spritePressed = love.graphics.newImage("images/Backward_Pressed.png")
		button.spriteBroken = love.graphics.newImage("images/Backward_Broken.png")
	end

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
		love.graphics.setColor(255,255,255)
		local sprite
		if self.pressed then
			sprite = self.spritePressed
		else
			sprite = self.sprite
		end
		love.graphics.draw(sprite, self.x, self.y)
	end

	return button
end

return Button