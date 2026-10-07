local flowersplit, super = Class(LightBullet)

function flowersplit:init(x, y)
    super.init(self, x, y, "bullets/flowersplit")

    self.arena_x = Game.battle.arena.x
    self.arena_y = Game.battle.arena.y
    self.alpha = 1


    self:setScale(1,1)
    self:setOrigin(0.5, 0.5)

    local angle = MathUtils.angle(x, y, Game.battle.soul.x + 2, Game.battle.soul.y + 2)
    self.physics.direction = angle
    self.physics.speed = 2.5
end

function flowersplit:update()
    if self.x < self.arena_x - 90 or self.x > self.arena_x + 90
            or self.y < self.arena_y - 90 or self.y > self.arena_y + 90 then
        self.alpha = self.alpha - 0.1 * DTMULT
        if self.alpha <= 0 then
            self:remove()
            return
        end
    end

    super.update(self)
end

return flowersplit