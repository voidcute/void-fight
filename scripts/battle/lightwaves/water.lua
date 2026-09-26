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
    self:spawnPotchomp()

    self.roto1 = self.timer:every(1.5, function()
        local x = -20
        local y = MathUtils.random(0, Game.battle.arena.top)
        local bullet = self:spawnBullet("roto", x, y, 0, 3)

        -- Dont remove the bullet offscreen, because we spawn it offscreen
        bullet.remove_offscreen = false
    end)
   self.timer:after(10, function()
        self.timer:cancel(self.roto1)
        self.roto2 = self.timer:every(2, function()
            local x = -20
            local y1 = MathUtils.random(0, Game.battle.arena.top)
            local y2 = MathUtils.random(390, Game.battle.arena.bottom)
            local bullet = self:spawnBullet("roto", x, y1, 0, 3)
            local bullet = self:spawnBullet("roto", x, y2, 0, 3.1)

            bullet.remove_offscreen = false
        end)
    end)
    self.roto3 = self.timer:after(30, function()
        self.timer:cancel(self.roto2)
        self.timer:every(4, function()
            local x = -20
            local y1 = MathUtils.random( Game.battle.arena.top, Game.battle.arena.bottom)
            local bullet = self:spawnBullet("roto", x, y1, 0, 3, 30, 12,2)
            bullet.remove_offscreen = false
            
        end)
    end)
    
    
end

function water:spawnPotchomp()
    self.timer:after(1, function()
        local soul_x = Game.battle.soul.x
        local pot = self.pots[1]
        local closest_distance = math.abs(soul_x - pot.x)
        for i = 2, #self.pots do
            local distance = math.abs(soul_x - self.pots[i].x)
            if distance < closest_distance then
                pot = self.pots[i]
                closest_distance = distance
            end
        end
        self:spawnBullet("potchomp", pot.x, pot.y)
    end)
end

function water:update()
    if self.watered == 5 then
    Game.battle:setState("DEFENDINGEND", "WAVEENDED")
    end

    super.update(self)
end

return water