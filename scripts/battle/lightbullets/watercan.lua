local watercan, super = Class(LightBullet)

function watercan:init(x, y)
    -- Last argument = sprite path
    super.init(self, x, y, "bullets/watercan")

    -- Top-center origin point (will be rotated around it)
    self:setOrigin(0.5, 0)
    self:setScale(1, 1)

    -- The hitbox where the player will be damaged by the bullet (affected by scale and rotation)
    self:setHitbox(0, 0)
    self.time = 30
    self.flipped = false
    self.droplet_spawn_delay = 0.15
    self.droplet = nil
    -- Don't destroy this bullet when it damages the player
    self.destroy_on_hit = false
end

function watercan:spawnDroplet()
    local droplet = Mod.libs["magical-glass"]:getLightBullet("droplet")

    for _, bullet in ipairs(Game.stage:getObjects(Bullet)) do
        if bullet:includes(droplet) then
            self.droplet = nil
            return
        end
    end

    if self.droplet then
        return
    end

    self.droplet = self.droplet_spawn_delay
end

function watercan:onDamage()
    return {}
end

function watercan:update()
    local soul = Game.battle.soul
    if not self.flipped then
    self.x = soul.x - 8
    self.y = soul.y - 29
    else
    self.x = soul.x - 18
    self.y = soul.y - 29
    end
    if Input.pressed("right") then
        self.flipped = true
        self.flip_x = true
    elseif Input.pressed("left") then
        self.flipped = false
        self.flip_x = false
    end
    self:spawnDroplet()

    if self.droplet and soul.inv_timer == 0 then
        self.droplet = self.droplet - DT
        if self.droplet <= 0 then
            self.droplet = nil
            if not self.flipped then 
            self.wave:spawnBulletTo(nil, "droplet", self.x - 11 , self.y + 12)
            else
            self.wave:spawnBulletTo(nil, "droplet", self.x + 36, self.y + 12)    
        end
    end
end
    -- For more complicated bullet behaviours, code here gets called every update
    super.update(self)
end

return watercan
