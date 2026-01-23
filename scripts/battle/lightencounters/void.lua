local void, super = Class(LightEncounter)

function void:init()
    super.init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = "* Ridiculously powerful enemy \nvoid showed up!!!"
    self.music = "Strongerer_Monsters"
    -- Add the void enemy to the encounter
    self.void = self:addEnemy("void",SCREEN_WIDTH/2, 246)
    -- hurt when encounter???
    --frisk = Game.battle:getPartyBattler("frisk")
    --frisk:hurt(5,true)

end
    function void:onActionsEnd()
        if self.void.hited == true then
            if self.void.hit == 1 then
            Game.battle.enemies[1].wave_override =  "basic"
            end
        elseif self.void.acted == true then
            if self.void.flirt == 1 then
            Game.battle.enemies[1].wave_override =  "basic"   
            end
         elseif Game.battle.turn_count == 1 then
           Game.battle:startCutscene("void", "turn1")
        
        end
    end
        
    

    function void:onTurnEnd()

     self.void.hited = false
     self.void.acted = false

    end
return void