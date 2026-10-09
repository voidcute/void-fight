local Aiming, super = Class(LightWave)
function Aiming:init()
    super.init(self)
    self.time = 10
end
function Aiming:onStart()
    soul = Game.battle.soul
    Game.battle["soul_speed"] = 4
    -- Every 0.5 seconds...
    self.timer:after(8,function()
        self.timer:cancel(normal)
        star= self:spawnBullet("star", x, y-50, angle2, 0)
        star.graphics.grow = 16 / (60 * DTMULT)
        sound = Assets.newSound("chargeshot_charge")
        sound:setLooping(true)
        sound:play()
        end)




    normal = self.timer:every(20/30, function()
          for _, attacker in ipairs(self:getAttackers()) do
            x, y = attacker:getRelativePos(attacker.width/2, attacker.height/2) 
            angle1 = Utils.angle(x, y, Game.battle.soul.x-30, Game.battle.soul.y)
            angle2 = Utils.angle(x, y, Game.battle.soul.x, Game.battle.soul.y)
            angle3 = Utils.angle(x, y, Game.battle.soul.x+30, Game.battle.soul.y)
                self:spawnBullet("star", x, y, angle1, 7)
                self:spawnBullet("star", x, y, angle2, 7)
                self:spawnBullet("star", x, y, angle3, 7)
          end      
    end)
end
function Aiming:onEnd()
    sound:stop()

end
function Aiming:update()
    -- Code here gets called every frame

    super.update(self)
end

return Aiming