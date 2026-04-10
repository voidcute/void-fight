local void, super = Class(LightEncounter)

function void:init()
    super.init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = "* Ridiculously powerful enemy \nvoid showed up!!!"
    self.music = "Strongerer_Monsters"
    self.void = self:addEnemy("void",SCREEN_WIDTH/2, 246)
    -- hurt when encounter???
    frisk = Game.battle:getPartyBattler("frisk")
    frisk:hurt(0,true)

end

    function void:onActionsEnd()
        if self.void.violence == true then
            if self.void.health == 900 then
            Game.battle.enemies[1].wave_override ="aiming" 
            elseif self.void.health == 800 then
            Game.battle.enemies[1].wave_override ="basic"     
            end
        elseif self.void.violence == false then 
            if self.void.turn_count == 1 then
            Game.battle.enemies[1].wave_override ="aiming"   
            elseif self.void.turn_count == 2 then
            Game.battle.enemies[1].wave_override ="basic"  
            end
            
        end
    end
    function void:getDialogueCutscene()
        super.init(self)
        if self.void.violence == true then
        if self.void.health == 900 then
            return "void.hurt1"
        elseif self.void.health == 800 then    
            return "void.hurt2"
        elseif self.void.health <= 100 then
            return "void.die"
        end
        elseif self.void.turn_count == 1 then
            return "void.turn1"
        elseif self.void.turn_count == 2 then
            return "void.turn2"
            
    end

    end
    
    function void:onTurnEnd()
    if  self.void.violence == false then
        self.void.turn_count = self.void.turn_count + 1
    else 
        self.void.violence = false  
    end

end

return void