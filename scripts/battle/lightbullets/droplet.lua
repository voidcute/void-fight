local droplet, super = Class(LightBullet)

function droplet:init(x, y)
    -- Last argument = sprite path
    super.init(self, x, y, "bullets/droplet")
    self:setScale(1, 1)
    -- Move the bullet in dir radians (0 = right, pi = left, clockwise rotation)
    self.physics.direction = math.pi / 2
    -- Speed the bullet moves (pixels per frame at 30FPS)
    self:setHitbox(0, 11, 10, 8)
    self.physics.speed = 4
    self.destroy_on_hit = false
end

function droplet:update()
    -- For more complicated bullet behaviours, code here gets called every update

    super.update(self)
end

return droplet