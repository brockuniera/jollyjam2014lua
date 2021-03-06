MAX_DIST = 25

function Shake()
	shake = {
		intensity = 0,
		length = 0,
		offsetX = 0,
		offsetY = 0
	}

	function shake:update(dt)
		if self.length > 0 then
			self.length = self.length - dt
			self.offsetX = self.offsetX
				+ love.math.random() * self.intensity - self.intensity * .5
			self.offsetY = self.offsetY
				+ love.math.random() * self.intensity - self.intensity * .5

			self.offsetX = lume.clamp(self.offsetX, -MAX_DIST, MAX_DIST)
			self.offsetY = lume.clamp(self.offsetY, -MAX_DIST, MAX_DIST)
		else
			if math.abs(self.offsetX) > 1 then
				self.offsetX = self.offsetX * .99
			else
				self.offsetX = 0
			end

			if math.abs(self.offsetX) > 1 then
				self.offsetY = self.offsetY * .99
			else
				self.offsetY = 0
			end
			self.intensity = 0
		end
	end

	return shake
end

return Shake