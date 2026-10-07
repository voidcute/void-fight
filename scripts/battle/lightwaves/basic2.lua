local Basic, super = Class(LightWave)

function Basic:init()
    super.init(self)
    self.time = -1
end

function Basic:onStart()

    self.timer:everyInstant(5, function()

        local x1 = -20
        local y1 =  Game.battle.soul.y

        local x2 = SCREEN_WIDTH + 20    
        local y2 = MathUtils.random(Game.battle.arena.top, Game.battle.arena.bottom)
        local bullet1 = self:spawnBullet("homingstar", x1, y1, 0, 3)
        -- Dont remove the bullet offscreen, because we spawn it offscreen
        bullet1.remove_offscreen = false
    end)
end

function Basic:update()
    -- Code here gets called every frame

    super.update(self)
end

return Basic