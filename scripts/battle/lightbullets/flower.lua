local flower, super = Class(LightBullet)

function flower:init(x, y)
    -- Last argument = sprite path
    super.init(self, x, y, "bullets/flowerstem")
    self.timer = 0
    self.state = 0
    self.active = 0
    self.timermax = 30
    self.siner = 0
    self:setScale(0,0)
    self.collider = nil
    self.ox = x
    self.oy = y
    self.stem = nil
    self.destroy_on_hit = false
    -- Move the bullet in dir radians (0 = right, pi = left, clockwise rotation)
    -- Speed the bullet moves (pixels per frame at 30FPS)
end



function flower:update()
    -- For more complicated bullet behaviours, code here gets called every update
    if self.state == 0 then
        self.timer = self.timer + DTMULT
        local progress = self.timer / 10
        local scale = 5 + (1 - 5) * progress
        self:setScale(scale * progress)
        if self.timer >= 10 or self.fastspawn then
            self.timer = 30
            self.state = 1
            if self.fastspawn then
                self:setScale(1)
            end
        end
    elseif self.state == 1 then
        self.timer = self.timer + DTMULT
        if self.timer == 49 then
            self:setColor(1, 0, 0)
        elseif self.timer == 51 then
            self:setColor(1, 1, 1)
        elseif self.timer == 53 then
            self:setColor(1, 0, 0)
        elseif self.timer == 55 then
            self:setColor(1, 1, 1)
        end
        if self.timer >= 70 then
            self.timer = 0
            self.state = 2
            self.active = 1
            self:setSprite("bullets/flower")
            self.physics.speed = 2
            self.physics.direction = 3*math.pi / 2
            self.timermax = 11 + MathUtils.random(24)
            self.stem = Sprite("bullets/stem", self.ox - 10, self.oy - 11)
            self.stem:setLayer(BATTLE_LAYERS["below_bullets"])
            Game.battle:addChild(self.stem)
            self:setHitbox(5,5,self.width-10,self.height-10)    
        end
    elseif self.state == 2 then
        self.timer = self.timer + DTMULT
        self.siner = self.siner + DTMULT
        if self.scale_x < 2 then
            self:setScale(math.min(2, self.scale_x + 0.04 * DTMULT), self.scale_y)
        end
        if self.scale_y < 2 then
            self:setScale(self.scale_x, math.min(2, self.scale_y + 0.04 * DTMULT))
        end
        if self.timer >= self.timermax then
            self.physics.friction = 0.06
            self.timer = 0
            self.state = 3

        end
    elseif self.state == 3 then
        self.timer = self.timer + DTMULT
        self.siner = self.siner + DTMULT
        if self.timer == 9 then
            self:setColor(1, 0, 0)
        elseif self.timer == 11 then
            self:setColor(1, 1, 1)
        elseif self.timer == 13 then
            self:setColor(1, 0, 0)
        elseif self.timer == 15 then
            self:setColor(1, 1, 1)
        elseif self.timer == 28 then
            local fx = Sprite("effects/spr_explosive_shockwave/spr_explosive_shockwave", self.x, self.y)
            Game.battle:addChild(fx)
            fx:setOrigin(0.5, 0.5)
            fx:play(2/30, false,fx.remove)
           
            Assets.playSound("bomb")
        elseif self.timer >= 30 then
            self.timer = 0
            self.state = 4
            local angle = math.rad(55)
            for _ = 1, 5 do
                local split = self.wave:spawnBullet("flowersplit", self.x + (math.cos(angle) * 12), self.y + (math.sin(angle) * 12))
                split.physics.direction = angle
                split.physics.speed = 2
                angle = angle + math.rad(72)
            end
            self:remove()
        end
    end

    if self.state >= 2 then
        self.rotation = math.sin(self.siner * 0.1) * math.rad(20)
    end

    super.update(self)
end

function flower:onRemove(parent)
    if self.stem then
        self.stem:remove()
        self.stem = nil
    end

    super.onRemove(self, parent)
end


return flower  