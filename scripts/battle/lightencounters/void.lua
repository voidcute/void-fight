local void, super = Class(LightEncounter)

function void:init()
    super.init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = "* Ridiculously powerful enemy \nvoid showed up!!!"
    self.music = "Strongerer_Monsters"
    -- Add the void enemy to the encounter
    self.void = self:addEnemy("void",SCREEN_WIDTH/2, 246)
    -- hurt when encounter???
    frisk = Game.battle:getPartyBattler("frisk")
    frisk:hurt(1,true)
    self.turn_count = 1
end

    function void:onActionsEnd()
        if self.void.violence == true then
            if self.void.health <= 900 then
            Game.battle.enemies[1].wave_override ="basic" 
            end
        elseif self.void.violence == false then 
            if self.turn_count == 1 then
            Game.battle.enemies[1].wave_override ="basic"   
            end
            
        end
    end
    function void:getDialogueCutscene()
        super.init(self)
        local void = self.void
        if self.void.violence == true then
        if void.health <= 900 then
            return "void.hurt1"
        end
        elseif self.turn_count == 1 then
            return "void.turn1"
        elseif self.turn_count == 2 then
            return "void.turn2"
    end

    end
    
    function void:onTurnEnd()
    if  self.void.violence == false then
        self.turn_count = self.turn_count + 1
    else 
        self.void.violence = false  
    end
end
return void