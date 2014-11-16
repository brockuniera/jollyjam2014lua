local PARRALAX = .9
function Background()
	--constructor
	local background = {}
	background.image = love.graphics.newImage("images/background.png")

	function background:update(shipPosition)
		self.drawOffset = shipPosition
	end


	--draws a tiling background
	function background:draw(shipPosition)
		love.graphics.setColor(255, 255, 255 )
		local width = love.graphics.getWidth()
		local height = love.graphics.getHeight()

		for i = -2, width / self.image:getWidth() + 1 do
			for j = -2, height / self.image:getHeight() + 1 do
				love.graphics.draw(self.image,
				(i + math.floor(shipPosition.x / self.image:getWidth())) * self.image:getWidth(),
				(j + math.floor(shipPosition.y / self.image:getHeight())) * self.image:getHeight())
			end
		end
	end

	return background
end

return Background
