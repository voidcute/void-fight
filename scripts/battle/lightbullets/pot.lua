local pot, super = Class(LightBullet)

function pot:init(x, y)
    -- Last argument = sprite path
    super.init(self, x, y, "bullets/pot_1")
    self:setScale(1)
    -- Top-center origin point (will be rotated around it)
    self:setOrigin(0.5, 0)
    -- The hitbox where the player will be damaged by the bullet (affected by scale and rotation)
    self:setHitbox(0, 0, 28, 25)
    self.watered = 0
    -- Rotation of the bullet (in radians)

    -- Don't destroy this bullet when it damages the player
    self.destroy_on_hit = false
end

function pot:update()
    -- For more complicated bullet behaviours, code here gets called every update

    super.update(self)

    local droplet_class = Mod.libs["magical-glass"]:getLightBullet("droplet")
        
        for _, droplet in ipairs(Game.stage:getObjects(Bullet)) do
            if droplet:includes(droplet_class) and droplet ~= self and self:collidesWith(droplet) then
            if self.watered < 5 then
                self.watered = self.watered + 1
            end
            droplet:remove()

            if self.watered == 1 then
                self:setSprite("bullets/pot_2")
            elseif self.watered == 2 then
                self:setSprite("bullets/pot_3")
            elseif self.watered == 3 then
                self:setSprite("bullets/pot_4")
            elseif self.watered == 4 then
                self.wave.watered = self.wave.watered + 1
                self:setSprite("bullets/pot_5")
            end
        end
    end
    Object.endCache()
end

function pot:onCollide()
end
return pot