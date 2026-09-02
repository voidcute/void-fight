local Basic, super = Class(LightWave)

function Basic:init()
    super.init(self)
    self.time = 8
    self:setArenaSize(100)
end

function Basic:onStart()

    self.timer:every(0.5, function()

        local x1 = -20
        local y1 =  Game.battle.soul.y

        local x2 = SCREEN_WIDTH + 20    
        local y2 = MathUtils.random(Game.battle.arena.top, Game.battle.arena.bottom)
        local bullet1 = self:spawnBullet("smilebullet", x1, y1, 0, 8)
        local bullet2 = self:spawnBullet("smilebullet", x2, y2, math.rad(180), 8,true) 
        -- Dont remove the bullet offscreen, because we spawn it offscreen
        bullet1.remove_offscreen = false
        bullet2.remove_offscreen = false
    end)
end

function Basic:update()
    -- Code here gets called every frame

    super.update(self)
end

return Basic