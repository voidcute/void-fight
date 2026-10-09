local water, super = Class(LightWave)

function water:init()
    super.init(self)
    self.time = -1
    Wave:setArenaOffset(0, -129)
    self.watered = 0

end

function water:onStart()
    self:spawnBullet("watercan",Game.battle.soul.x,Game.battle.soul.y)
    self.pots = {}
    local potx = 220
    for i = 1, 5 do 
        potx = potx + 32
        self:spawnBullet("pot", potx, 268)
        table.insert(self.pots, {x = potx - 2, y = 254})
    end
    self.timer:after(1, function ()

        self.timer:everyInstant(6, function()
        local x = -20
        local y = MathUtils.random(0, Game.battle.arena.top)
        self:spawnBullet("homingstar", x, y, 0, 6,40,8,30,2)
        end)
        self.timer:everyInstant(5.5, function ()
        --local flower_count = MathUtils.round(MathUtils.random(1, 3))
        local flower_count = 2
        local selected_pots = {}
        local selected_count = 0

        while selected_count < flower_count do
            local pot_index = MathUtils.round(MathUtils.random(1, #self.pots))
            if not selected_pots[pot_index] then
                selected_pots[pot_index] = true
                selected_count = selected_count + 1
                local pot = self.pots[pot_index]
                self:spawnBullet("flower", pot.x, pot.y)
            end
        end    
    end)

    end)

    
    
end



function water:update()
    if self.watered == 5  then
    Game.battle:setState("DEFENDINGEND", "WAVEENDED")

    end

    super.update(self)
end

return water