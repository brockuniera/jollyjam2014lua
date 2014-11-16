function Thruster(type, x, y, width, height)
	local thruster = {
		type = type,
		x = x,
		y = y,
		width = width,
		height = height
	}

	local current = {
		left = false,
		right = false,
		forward = false,
		back = false
	}

	if thruster.type == "left" then
		thruster.sprite = love.graphics.newImage("images/Left_Thruster/Left_Thruster-off.png")
		thruster.spriteLow = love.graphics.newImage("images/Left_Thruster/Left_Thruster-Low.png")
		thruster.spriteMid = love.graphics.newImage("images/Left_Thruster/Left_Thruster-Mid.png")
		thruster.sprite1 = love.graphics.newImage("images/Left_Thruster/Left_Thruster-Flame1.png")
		thruster.sprite2 = love.graphics.newImage("images/Left_Thruster/Left_Thruster-Flame2.png")
		thruster.sprite3 = love.graphics.newImage("images/Left_Thruster/Left_Thruster-Flame3.png")
		thruster.sprite4 = love.graphics.newImage("images/Left_Thruster/Left_Thruster-Flame4.png")
		thruster.sprite5 = love.graphics.newImage("images/Left_Thruster/Left_Thruster-Flame5.png")
	elseif thruster.type == "right" then
		thruster.sprite = love.graphics.newImage("images/Right_Thruster/Right_Thruster-off.png")
		thruster.spriteLow = love.graphics.newImage("images/Right_Thruster/Right_Thruster-Low.png")
		thruster.spriteMid = love.graphics.newImage("images/Right_Thruster/Right_Thruster-Mid.png")
		thruster.sprite1 = love.graphics.newImage("images/Right_Thruster/Right_Thruster-Flame1.png")
		thruster.sprite2 = love.graphics.newImage("images/Right_Thruster/Right_Thruster-Flame2.png")
		thruster.sprite3 = love.graphics.newImage("images/Right_Thruster/Right_Thruster-Flame3.png")
		thruster.sprite4 = love.graphics.newImage("images/Right_Thruster/Right_Thruster-Flame4.png")
		thruster.sprite5 = love.graphics.newImage("images/Right_Thruster/Right_Thruster-Flame5.png")
	end

	-- thruster.collider = shapes.newPolygonShape(
	-- 	thruster.x, thruster.y,
	-- 	thruster.x + thruster.width, thruster.y,
	-- 	thruster.x + thruster.width, thruster.y + thruster.height,
	-- 	thruster.x, thruster.y + thruster.height
	-- )

	thruster.on = false

	function thruster:draw() 
		love.graphics.setColor(255,255,255)
		local sprite
		if objects.ship.velocity > 0 then
			thruster.on = true
			sprite = self.sprite1
		else
			sprite = self.sprite
		end
		love.graphics.draw(sprite, self.x, self.y)
	end

	function thruster:update(dt) 
		local fwd = false
		if objects.ship.velocity > 0 then
			fwd = true
		end
		if thruster.on == false and type == forward then
			thruster.on = true
			sprite = self.spriteLow
			sleep(80)
			sprite = self.spriteMid
			sleep(80)
			sprite = self.sprite1
		elseif ((current.left == true and type == "left" and thruster.on == true)  or (current.right == true and type == "right" and thruster.on == true)) and fwd == false then
			thruster.on = false
			sprite = self.spriteMid
			sleep(80)
			sprite = self.spriteLow
			sleep(80)
			sprite = self.sprite
		elseif thruster.on == off and ((current.left == true and type == right) or (current.right == true and type == left)) then
			thruster.on = true
			sprite = self.spriteLow
			sleep(80)
			sprite = self.spriteMid
			sleep(80)
			sprite = self.sprite1
		end
	end
	return thruster
end

return Thruster