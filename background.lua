function Background()
	--constructor
	local background = {}
	background.image = love.graphics.newImage("images/background-250px.png")


	--draws a tiling background
	function background:draw()
		love.graphics.setColor(255, 255, 255 )
		local width = love.graphics.getWidth()
		local height = love.graphics.getHeight()

		for i = 0, width / self.image:getWidth() do
			for j = 0, height / self.image:getHeight() do
				love.graphics.draw(self.image, i * self.image:getWidth(), j * self.image:getHeight())
			end
		end
	end

	return background
end

return Background
