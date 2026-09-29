local potchomp, super = Class(LightBullet)

function potchomp:init(x, y, wait_time, grown_time, flash_time)
    -- Last argument = sprite path
    super.init(self, x, y, "bullets/potchomp1")
    self.sprite:setAnimation({"bullets/potchomp1",0.1,true})
    self.wait_time = wait_time or 30
    self.grown_time = grown_time or 25
    self.flash_time = math.min(flash_time or 20, self.wait_time)
    self.timer = self.wait_time
    self.flash_timer = 0
    self.flash_red = false
    self.state = "spawning"
    self.grow_duration = 5
    self.spawn_duration = 5
    self.spawn_timer = self.spawn_duration
    self:setScale(1)
    self.sprite:setOrigin(0, 1)
    self.sprite.y = self.sprite.height
    self.sprite:setScale(1, 0)

    self.destroy_on_hit = false
    -- Move the bullet in dir radians (0 = right, pi = left, clockwise rotation)
    -- Speed the bullet moves (pixels per frame at 30FPS)
end

function potchomp:GrowColliders(progress)
    if self.state == "spawning" then
        local function growY(y)
        return 29 + ((y - 29) * progress)
    end
    self.collider = Hitbox(self, 0, growY(0), 36, 29)
    else
    local function growY(y)
        return 85 + ((y - 85) * progress)
    end
    self.head_collider = Hitbox(self, 0, growY(-56), 31, 31)
    self.stem_collider = Hitbox(self, 12, growY(-25), 12, 110)
    self.collider = ColliderGroup(self, {self.head_collider, self.stem_collider})
    end
end


function potchomp:update()
    -- For more complicated bullet behaviours, code here gets called every update

    if self.state == "spawning" then
        self.spawn_timer = self.spawn_timer - DTMULT
        local progress = math.max(0, 1 - (self.spawn_timer / self.spawn_duration))
        self.sprite:setScale(1, progress)
        self:GrowColliders(progress)
        if self.spawn_timer <= 0 then
            self.sprite:setScale(1, 1)
            self.timer = self.wait_time
            self.state = "warning"
        end
    elseif self.state == "warning" then
        self.timer = self.timer - DTMULT
        if self.timer <= self.flash_time then
            self.flash_timer = self.flash_timer - DTMULT
            if self.flash_timer <= 0 then
                self.flash_red = not self.flash_red
                if self.flash_red then
                    Assets.playSound("alert", 0.4)
                    self:setColor(1, 0, 0)
                else
                    self:setColor(1, 1, 1)
                end
                self.flash_timer = 2
            end
        else
            self.flash_timer = 0
            if self.flash_red then
                self.flash_red = false
                self:setColor(1, 1, 1)
            end
        end
        if self.timer <= 0 then
            self:setSprite("bullets/potchomped")
            self.sprite:setOrigin(0, 1)
            self.sprite:setScale(1, 0)
            self:setColor(1, 1, 1)
            self.sprite.y = 85
            self.grow_timer = self.grow_duration
            self.state = "growing"
        end
        elseif self.state == "growing" then
        self.grow_timer = self.grow_timer - DTMULT
        local progress = math.max(0, 1 - (self.grow_timer / self.grow_duration))
        self.sprite:setScale(1, progress)
        self:GrowColliders(progress)
        if self.grow_timer <= 0 then
            self.sprite:setScale(1, 1)
            self.timer = self.grown_time
            self.state = "grown"
        end
    elseif self.state == "grown" then
        self.timer = self.timer - DTMULT
        if self.timer <= 0 then
            self.state = "removing"
            if self.wave and self.wave.spawnPotchomp then
                self.wave:spawnPotchomp()
            end
            self.collider = nil
            self:fadeOutAndRemove(0.1)
        end
    end

    super.update(self)
end

return potchomp  