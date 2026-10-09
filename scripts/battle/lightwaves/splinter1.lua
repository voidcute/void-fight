local wave, super = Class(LightWave)

function wave:init()
    super.init(self)

    self.time = 7
end

function wave:onStart()
    local x = MathUtils.random(Game.battle.arena.left, Game.battle.arena.right)


    self.timer:every(1, function()
        x = MathUtils.random(Game.battle.arena.left, Game.battle.arena.right)

       self:spawnBullet("splinterbig", x, Game.battle.arena.top)
    end)
end

return wave