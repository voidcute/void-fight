local roto, super = Class(LightBullet)

function roto:init(x, y, dir, speed, timer, attacks, attack_delay,cooldown)
    -- Last argument = sprite path
    super.init(self, x, y, "bullets/roto_1")
    self.sprite:setAnimation({"bullets/roto",0.1,true})
    -- Top-center origin point (will be rotated around it)
    self:setOrigin(0.5, 0)
    self:setScale(1, 1)
    -- The hitbox where the player will be damaged by the bullet (affected by scale and rotation)
    -- Move the bullet in dir radians (0 = right, pi = left, clockwise rotation)
    self.physics.direction = dir or 0
    -- Speed the bullet moves (pixels per frame at 30FPS)
    self.physics.speed = speed or 1
    self.state = 0
    self.wait_time = timer or 60
    self.timer = timer or 60
    -- Don't destroy this bullet when it damages the player
    self.destroy_on_hit = false
    self.cooldown = cooldown or 8
    self.attacks = attacks or 3
    self.attack_delay = attack_delay or 2
    self.attacks_left = self.attacks
end

function roto:update()
    if self.state == 0 then
        self.timer = self.timer - DTMULT
    if self.timer <= 0 then 
        self.timer = 2
        self.attacks_left = self.attacks
        self.state = 1
        end
    end
    if self.state == 1 then
        self.timer = self.timer - DTMULT
        self.sprite:setAnimation({"bullets/rotoattack", 0.1, true})
        if self.timer <= 0 then
            for i = 1, 4 do
                local dir = math.rad(i * 90 - 45)
                local speed = 8
                local bullet = self.wave:spawnBullet("ruta", self.x+3, self.y + 20, dir, speed)
                bullet.match_rotation = true
            end
            
            self.attacks_left = self.attacks_left - 1
            if self.attacks_left > 0 then
                
                self.timer = self.attack_delay
            else
                self.timer = self.cooldown
                self.state = 2
                self.stop = false
            end
        end
    end
    
     if self.state == 2 then
        self.timer = self.timer - DTMULT
        if self.timer <= 0 then
            self.state = 3
        end
     end
    if self.state == 3 then
    self.timer = self.wait_time
    self.sprite:setAnimation({"bullets/roto",0.1,true})
    self.state = 0
     end
    -- For more complicated bullet behaviours, code here gets called every update
    super.update(self)

end

return roto