local starfr, super = Class(LightBullet)

function starfr:init(x, y, dir, speed, timer,cooldown,delay,homing_speed)
    -- Last argument = sprite path
    super.init(self, x, y, "bullets/starfr")
    -- Top-center origin point (will be rotated around it)
    self:setOrigin(0.5, 0)
    self:setScale(1, 1)
    -- The hitbox where the player will be damaged by the bullet (affected by scale and rotation)
    -- Move the bullet in dir radians (0 = right, pi = left, clockwise rotation)
    self.physics.direction = dir or 0
    -- Speed the bullet moves (pixels per frame at 30FPS)
    self.siner = 0
    self.physics.speed = speed or 6
    self.state = 0
    self.wait_time = timer or 60
    self.timer = timer or 60
    -- Don't destroy this bullet when it damages the player
    self.destroy_on_hit = false
    self.cooldown = cooldown or 8
    self.attacks_left = self.attacks
    self.homing_delay = delay or 30
    self.homing_speed = homing_speed or 2
    
end

function starfr:update()
    self.siner = self.siner + DT
    self.rotation = math.sin(self.siner * 3) / 4
    if self.state == 0 then
        self.timer = self.timer - DTMULT
    if self.timer <= 0 then 
        self.timer = 2
        self.attacks_left = self.attacks
        self.state = 1
        end
    end 
    if self.state == 1 then
        self.sprite:setSprite("bullets/starfr_attack")
        self.timer = self.timer - DTMULT
        if self.timer <= 0 then
            local angle =  math.rad(55)
            for index = 1, 5 do
                self.wave:spawnBullet("smallstar", (self.x + (math.cos(angle) * 12)), (self.y + (math.sin(angle) * 12)) + 8, angle, self.homing_speed, (index - 1) *  self.homing_delay)
                angle = angle + math.rad(72)
            end
            
                self.timer = self.cooldown
                self.state = 2
                self.stop = false
        end
    end
    
     if self.state == 2 then
        self.timer = self.timer - DTMULT
        if self.timer <= 0 then
            self.state = 3
        end
     end
    if self.state == 3 then
         self.sprite:setSprite("bullets/starfr")
        self.timer = self.wait_time
        self.state = 0
     end
    -- For more complicated bullet behaviours, code here gets called every update
    super.update(self)

end

return starfr