local starsmall, super = Class(LightBullet)

function starsmall:init(x, y, dir, speed, redirect_timer)
    -- Last argument = sprite path
    super.init(self, x, y, "bullets/smallstar")
    self:setScale(1,1)     
    self:setOrigin(0.5, 0.5)
    -- Move the bullet in dir radians (0 = right, pi = left, clockwise rotation)
    self.physics.direction = dir or 0
    self.rotation = self.physics.direction
    -- Speed the bullet moves (pixels per frame at 30FPS)
    self.physics.speed = speed or 0
    self.ox = x
    self.oy = y
    self.stop_distance = 45
    self.move_speed = speed or 4
    self.graphics.spin = math.rad(45 / 4)
    self.stopped = false
    self.redirect_timer = redirect_timer or 0
    self.redirected = false
end

function starsmall:update()
    -- For more complicated bullet behaviours, code here gets called every update
    if not self.stopped then
        if self.x < self.ox - self.stop_distance
                or self.x > self.ox + self.stop_distance
                or self.y < self.oy - self.stop_distance
                or self.y > self.oy + self.stop_distance then
            self.physics.speed = 0
            self.stopped = true
        end
    elseif not self.redirected then
        self.redirect_timer = self.redirect_timer - DTMULT
        if self.redirect_timer <= 0 and Game.battle and Game.battle.soul then
            self.physics.direction = MathUtils.angle(self.x, self.y, Game.battle.soul.x + 2, Game.battle.soul.y + 2)
            self.physics.speed = self.move_speed
            self.rotation = self.physics.direction
            self.redirected = true
        end
    end
    super.update(self)
end

return starsmall