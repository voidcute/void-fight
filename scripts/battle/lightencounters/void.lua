local void, super = Class(LightEncounter)

function void:init()
    super.init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = "* Ridiculously powerful enemy \nvoid showed up!!!"
    self.music = "mus_wrongworld"
    self.void = self:addEnemy("void",SCREEN_WIDTH/2, 246)
    self.can_flee = false
    -- hurt when encounter???

    frisk = Game.battle:getPartyBattler("frisk")
    frisk:hurt(0,true)
end

    function void:onActionsEnd()
       if self.void.violence == true then
--[[          if self.void.health == 900 then
            Game.battle.enemies[1].wave_override ="basic" 
            elseif self.void.health == 800 then
            Game.battle.enemies[1].wave_override ="aiming"     
            end
--]]  
        elseif self.void.checks == 2 then
        Game.battle.enemies[1].wave_override ="basic2"  

        elseif self.void.violence == false then 
            if self.void.turn_count == 1 then

            elseif self.void.turn_count == 2 then
            
            elseif self.void.turn_count == 3 then

            elseif self.void.turn_count == 4 then

            elseif self.void.turn_count == 5 then

            elseif self.void.turn_count == 6 then

            elseif self.void.turn_count == 7 then

            elseif self.void.turn_count == 8 then 

            elseif self.void.turn_count == 9 then

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
        elseif self.void.turn_count == 3 then
            return "void.turn3"
        elseif self.void.turn_count == 4 then
            return "void.turn4"                        
        elseif self.void.turn_count == 5 then
            return "void.turn5"
        elseif self.void.turn_count == 6 then
            return "void.turn6"
        elseif self.void.turn_count == 7 then
            return "void.turn7"
        elseif self.void.turn_count == 8 then
            return "void.turn8"
        elseif self.void.turn_count == 9 then
            return "void.turn9"
        elseif self.void.turn_count == 10 then
            return "void.turn10"
        end
    

    end
    -- worst code of all time ??????
    function void:onTurnEnd()
        self.can_flee = false
    if  self.void.violence == false then
        self.void.turn_count = self.void.turn_count + 1
    elseif  self.void.violence == true then
        if  self.void.turn_count < 11 then
        self.void:registerAct("Apologize")
        self.void.turn_counted = self.void.turn_count 
        self.void.turn_count = 11
        end
        if self.void.health == 400 then
        self.void:removeAct("Apologize")
        self.void:registerAct("Listen")   
        end
        if self.void.health == 300 then
        self.void:removeAct("Apologize")
        self.void:registerAct("Flirt")
        self.void:registerAct("Hug")
        self.void:registerAct("Imitate")    
        end
        self.void:removeAct("Something")
        self.void.violence = false  

    end
    if self.void.checks == 2 then
        self.void.checks = 3
    end
        
end

return void