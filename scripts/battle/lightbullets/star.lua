local star, super = Class(LightBullet)

function star:init(x, y, dir, speed)
    -- Last argument = sprite path
    super.init(self, x, y, "bullets/star")
    self:setScale(1)
    -- Move the bullet in dir radians (0 = right, pi = left, clockwise rotation)
    self.physics.direction = dir or 0
    self.graphics.spin = math.rad(45 / 4)
    -- Speed the bullet moves (pixels per frame at 30FPS)
    self.physics.speed = speed
    self:setHitbox(7,8,9,9)
end

function star:update()

   

    super.update(self)
end

return star