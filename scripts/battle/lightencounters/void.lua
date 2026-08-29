local void, super = Class(LightEncounter)

function void:init()
    super.init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = "* Ridiculously powerful enemy \nvoid showed up!!!"
    self.music = "Strongerer_Monsters"
    self.void = self:addEnemy("void",SCREEN_WIDTH/2, 246)
    -- hurt when encounter???
    self.can_flee = false
    frisk = Game.battle:getPartyBattler("frisk")
    frisk:hurt(0,true)
end

    function void:onActionsEnd()
        if self.void.violence == true then
            if self.void.health == 900 then
            Game.battle.enemies[1].wave_override ="basic" 
            elseif self.void.health == 800 then
            Game.battle.enemies[1].wave_override ="aiming"     
            end

            elseif self.void.checks == 2 then
            Game.battle.enemies[1].wave_override ="aiming"  

            elseif self.void.violence == false then 
            if self.void.turn_count == 1 then
            Game.battle.enemies[1].wave_override ="basic"   
            elseif self.void.turn_count == 2 then
            Game.battle.enemies[1].wave_override ="aiming"  
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
        elseif self.void.health == 700 then    
            return "void.hurt3"
        elseif self.void.health == 600 then    
            return "void.hurt4"
        elseif self.void.health == 500 then    
            return "void.hurt5"
        elseif self.void.health == 400 then    
            return "void.hurt6"
        elseif self.void.health == 300 then    
            return "void.hurt7"
        elseif self.void.health == 200 then    
            return "void.hurt8"
        elseif self.void.health == 100 then    
            return "void.hurt9"
        elseif self.void.health < 100 then
            return "void.die"
        end
        elseif self.void.checks == 2 then
        return "void.slime"
        elseif self.void.turn_count == 1 then
            return "void.turn1"
        elseif self.void.turn_count == 2 then
            return "void.turn2"
            
    end

    end
    -- worst code of all time ??????
    function void:onTurnEnd()
    if  self.void.violence == false then
        self.void.turn_count = self.void.turn_count + 1
    elseif  self.void.violence == true then
        if  self.void.turn_count < 11 then
        self.void.turn_counted = self.void.turn_count 
        self.void.turn_count = 11
        end
        self.void:removeAct("Apologize")
        self.void:registerAct("Apologize")
        self.void.violence = false  
    end
        
end

return void