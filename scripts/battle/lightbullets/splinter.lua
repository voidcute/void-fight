local bullet, super = Class(LightBullet)

function bullet:init(x, y)
    super.init(self, x, y, "bullets/bulletsm")



    self:setScale(1,1)
    self:setOrigin(0.5, 0.5)
    self:setHitbox(3, 3, 5, 5)

    local angle = MathUtils.angle(x, y, Game.battle.soul.x + 2, Game.battle.soul.y + 2)
    self.physics.direction = angle
    self.physics.speed = 2.5
end

return bullet