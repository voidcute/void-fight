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

    Object.startCache()
    for _, other in ipairs(Game.stage:getObjects(Registry.getBullet("droplet"))) do -- loop through a list of every bullet added to the battle
    if other ~= self and self:collidesWith(other) then -- if 'other' isn't this bullet itself, check collision with it
        if self.watered <5 then
           self.watered = self.watered + 1
        end
        other:remove()
        if  self.watered == 1 then
        self:setSprite("bullets/pot_2")
        end
        if  self.watered == 2 then
        self:setSprite("bullets/pot_3")
        end
        if  self.watered == 3 then
        self:setSprite("bullets/pot_4")
        end
        if  self.watered == 4 then
        self.wave.watered = self.wave.watered + 1
        self:setSprite("bullets/pot_5")
        end
        
        -- code in here will be run every frame that they are touching
    end
    end
    Object.endCache()

function pot:onCollide()


end
end
return pot