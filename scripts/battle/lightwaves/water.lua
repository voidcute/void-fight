local water, super = Class(LightWave)

function water:init()
    super.init(self)
    self.time = -1
    Wave:setSize(142, 142)
    Wave:setArenaPosition(316, 191)
    self.watered = 0
end

function water:onStart()
    self:spawnBullet("watercan",Game.battle.soul.x,Game.battle.soul.y)
    potx = 220
    for i = 1, 5 do 
    potx = potx + 32

    pot =  self:spawnBullet("pot", potx, 268)
    end
end

function water:update()
    if self.watered == 5 then
    Game.battle:setState("DEFENDINGEND", "WAVEENDED")
    end

    super.update(self)
end

return water