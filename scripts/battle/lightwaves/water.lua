local water, super = Class(LightWave)

function water:init()
    super.init(self)
    self.time = -1
    Wave:setArenaOffset(0, -129)
    self.watered = 0
end

function water:onStart()
    self:spawnBullet("watercan",Game.battle.soul.x,Game.battle.soul.y)
    potx = 220
    for i = 1, 5 do 
    potx = potx + 32
    pot =  self:spawnBullet("pot", potx, 268)
    end
    self.timer:every(1.5, function()
        local x = -20
        local y = MathUtils.random(Game.battle.arena.top, Game.battle.arena.bottom)
        local bullet = self:spawnBullet("roto", x, y, 0, 3)

        -- Dont remove the bullet offscreen, because we spawn it offscreen
        bullet.remove_offscreen = false
    end)
end

function water:update()
    if self.watered == 5 then
    Game.battle:setState("DEFENDINGEND", "WAVEENDED")
    end

    super.update(self)
end

return water