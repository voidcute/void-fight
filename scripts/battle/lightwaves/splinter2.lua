local wave, super = Class(LightWave)

function wave:init()
    super.init(self)

    self.time = 8.5
end

function wave:onStart()
    local x = MathUtils.random(Game.battle.arena.left, Game.battle.arena.right)


    self.timer:every(0.9, function()
        x = MathUtils.random(Game.battle.arena.left, Game.battle.arena.right)

       bullet = self:spawnBullet("splinterbig", x, Game.battle.arena.top)

    end)
end

return wave