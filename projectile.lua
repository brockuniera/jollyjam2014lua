require "animated_sprite"
local MOVE_SPEED = 400
local INITIAL_LIFE = 200
local DEADZONE = .2

function Projectile(x,y, direction, scaling)

	local animation = AnimatedSprite:create("images/fireball.png", 258, 258, 1, 1)
	local projectile = {
		x = x,
		y = y,
		vel = vel,
		life = INITIAL_LIFE,
		direction = direction,
	animation = animation,
	width =  animation.width,
	height = animation.height,
	direction = direction,
	isUsing = false,
	scaling = scaling,
	aIndex

	}

	--Load sprite lists for animation
	projectile.animation:load()

	-- Collider
	projectile.collider = shapes.newPolygonShape(
		projectile.x, projectile.y,
		projectile.x + projectile.width, projectile.y,
		projectile.x + projectile.width, projectile.y + projectile.height,
		projectile.x, projectile.y + projectile.height
	)

	-- Get ref to ship
	ship = objects.ship
	if ship == nil then
		assert(false, "Must load ship before projectile")
	end

	function projectile:update(dt)
				self.velX = MOVE_SPEED * dt * math.cos(self.direction) 
				self.velY = MOVE_SPEED * dt * math.sin(self.direction) 
				self.animation:set_animation(true)
				self.animation:update(dt)
				
		-- Move collider to new location (on X axis)
				self.x = self.x + self.velX
				self.y = self.y + self.velY
				self.collider:moveTo(self.x, self.y)
				self.life = self.life - dt*100
				--print(self.life)
	end

	function projectile:draw()
		love.graphics.setColor(245, 245, 245)
		--self.collider:draw("fill")
		self.animation:draw(self.x, self.y, self.direction, self.scaling)
	end

	return projectile
end

return Projectile
