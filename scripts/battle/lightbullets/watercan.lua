local watercan, super = Class(LightBullet)

function watercan:init(x, y)
    -- Last argument = sprite path
    super.init(self, x, y, "bullets/watercan")

    -- Top-center origin point (will be rotated around it)
    self:setOrigin(0.5, 0)
    self:setScale(1, 1)
    -- The hitbox where the player will be damaged by the bullet (affected by scale and rotation)
    self:setHitbox(0,0)
    self.timer = Timer()
    self:addChild(self.timer)
        self.timer:every(1.5, function()
            self.wave:spawnBullet("droplet", self.x-11, self.y+12)
    end
 )
    -- Don't destroy this bullet when it damages the player
    self.destroy_on_hit = false
    
end
function watercan:onDamage()
        return {}
end
function watercan:update()
    local soul = Game.battle.soul
    self.x = soul.x-8
    self.y = soul.y-29
    
    -- For more complicated bullet behaviours, code here gets called every update
    super.update(self)


end

return watercan