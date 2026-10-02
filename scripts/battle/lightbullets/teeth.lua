local teeth, super = Class(LightBullet)

function teeth:init(x, y, dir, speed)
    -- Last argument = sprite path
    super.init(self, x, y, "bullets/teeth")
    self.collider = PolygonCollider(self, {
        { 3, 4 },
        { 37, 25 },
        { 2, 45 }
    })
    self:setScale(1, 1)
    
    -- Move the bullet in dir radians (0 = right, pi = left, clockwise rotation)
    self.physics.direction = dir
    self.rotation = self.physics.direction
    -- Speed the bullet moves (pixels per frame at 30FPS)
    self.physics.speed = speed
    self.destroy_on_hit = false
end

function teeth:update()
    -- For more complicated bullet behaviours, code here gets called every update

    super.update(self)
end

return teeth