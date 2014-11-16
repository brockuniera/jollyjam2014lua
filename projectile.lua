require "animated_sprite"
local MOVE_SPEED = 800
local INITIAL_LIFE = 400
local DEADZONE = .2
local bigExplosion = love.audio.newSource("Sound/EnemyDead.wav", "static") -- the "static" tells LÖVE to load the file into memory, good for short sound effects

function Projectile(owner, x, y, lateralOffset, radius, direction, scaling, shipVelocity, shipDirection)
	local animation = AnimatedSprite:create("images/Fireball_Purple.png", 200, 100,1, 1)
	local projectile = {
		x = 0,
		y = 0,
		vel = vel,
		owner = owner,
		life = INITIAL_LIFE,
                lateralOffset = lateralOffset,
		direction = direction,
		animation = animation,
		width =  animation.width,
		height = animation.height,
		direction = direction,
		radius = radius,
		isUsing = false,
		scaling = scaling,
		shipVel = shipVelocity,
		shipDir = shipDirection,
		aIndex
	}

	local tempX = x + math.cos(direction)*radius + math.sin(direction)*projectile.lateralOffset
	local tempY = y + math.sin(direction)*radius - math.cos(direction)*projectile.lateralOffset

	local translated = objects.ship:translateCoords(tempX, tempY)
	projectile.x = translated.x
	projectile.y = translated.y

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
				self.velX = MOVE_SPEED * dt * math.cos(self.direction) + self.shipVel*math.cos(self.shipDir)
				self.velY = MOVE_SPEED * dt * math.sin(self.direction) + self.shipVel*math.sin(self.shipDir)
				self.animation:set_animation(true)
				self.animation:update(dt)
				
		-- Move collider to new location (on X axis)
				self.x = self.x + self.velX
				self.y = self.y + self.velY
				self.collider:moveTo(self.x, self.y)
				self.life = self.life - dt*100
				--print(self.life)

				for i, enemy in ipairs(objects.enemies) do
					if self.collider:collidesWith(enemy.collider) then
						-- Destroy enemy
						table.remove(objects.enemies, i)
						self.life = 0
						love.audio.play(bigExplosion)
						break
					end
				end
	end

	function projectile:draw()
		love.graphics.setColor(245, 245, 245)
		--self.collider:draw("fill")
		self.animation:draw(self.x, self.y, self.direction, self.scaling)
	end

	return projectile
end

return Projectile
