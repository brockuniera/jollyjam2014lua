local PARRALAX = .9
local BLUR_FACTOR = .1
local MAX_BLUR = 20

function Background()
	--constructor
	local background = {}
	background.image = love.graphics.newImage("images/background.png")
--	background.blur = love.graphics.newShader("lib/blur.frag")
	--background.blur:send("CanvasSize", {love.graphics.getDimensions()})

	function background:update(dt)
		self.drawOffset = shipPosition
		local blurX = lume.clamp(
			objects.ship.velocity * BLUR_FACTOR * math.cos(objects.ship.angle),
			-MAX_BLUR, MAX_BLUR)
		local blurY = lume.clamp(
			objects.ship.velocity * BLUR_FACTOR * math.sin(objects.ship.angle),
			-MAX_BLUR, MAX_BLUR)
	--	background.blur:send("Blur", {blurX, blurY})
	end

	--draws a tiling background
	function background:draw(shipPosition)
		--love.graphics.setShader(background.blur)
		love.graphics.setColor(255, 255, 255 )
		local width = love.graphics.getWidth()/scale
		local height = love.graphics.getHeight()/scale

		for i = -2, width / self.image:getWidth() + 1 do
			for j = -2, height / self.image:getHeight() + 1 do
				love.graphics.draw(self.image,
				(i + math.floor(shipPosition.x / self.image:getWidth())) * self.image:getWidth(),
				(j + math.floor(shipPosition.y / self.image:getHeight())) * self.image:getHeight())
			end
		end
		--love.graphics.setShader()
	end

	return background
end

return Background
