local Basic, super = Class(LightWave)

function Basic:init()
    super.init(self)
    self.time = 5
    self:setArenaSize(100)
end

function Basic:onStart()

    self.timer:every(0.5, function()

        local x = -20

        local y =  Game.battle.soul.y

        local bullet = self:spawnBullet("smilebullet", x, y, 0, 10)
        if not bullet.attacker then
            bullet.damage = 6
        end

        -- Dont remove the bullet offscreen, because we spawn it offscreen
        bullet.remove_offscreen = false
    end)
end

function Basic:update()
    -- Code here gets called every frame

    super.update(self)
end

return Basic