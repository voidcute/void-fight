local void, super = Class(LightEnemyBattler)
function void:init()
    super.init(self)

    -- Enemy name
    self.name = "void"
    -- Sets the actor, which handles the enemy's sprites (see scripts/data/actors/void.lua)
    self:setActor("void_ut")

    -- Enemy health
    self.max_health = 1000
    self.health = 1000
    -- Enemy attack (determines bullet damage)
    self.attack = 5
    -- Enemy defense (usually 0)
    self.defense = 0
    self.turn_count = 1
    self.turn_counted = 0
    -- Enemy reward
    self.money = 0
    self.experience = 0
    self.spare_points = 0    
    self.dialogue_bubble = "ut_round"
    self.dialogue_offset = {0, 10}
   
    -- List of possible wave ids, randomly picked each turn
    self.waves = {
        -- "explode",
        
        -- "movingarena"
    }



    -- Dialogue randomly displayed in the enemy's speech bubble


    -- Check text (automatically has "ENEMY NAME - " at the start)

    -- Text randomly displayed at the bottom of the screen each turn
    self.text = {
        "* void stands around\nabsentmindedly.",
        "* void stands around\nabsentmindedly?"
    }
    -- Text displayed at the bottom of the screen when the enemy has low health
    self.low_health_text = "* void is melting."
    self:registerAct("Something")

    self.gauge_size = 150
    self.damage_offset = {5, -70}
    self.act1 = 0
    self.acted = false
    self.violence = false
    self.can_die = false
    self.checks = 0

end


function void:hurt(amount, ...)
    if amount > 0 and self.health > 100   then
    self.violence = true
    super.hurt(self,100,...)
    elseif amount > 0 and self.health < 200 then
    self.violence = true
    super.hurt(self,99,...)
    elseif amount == 0 then 
    super.hurt(self,0,...)
    end
    --[[elseif amount > 60 then --and amount ~= 67 and amount ~= 66
        self.violence = true
        super.hurt(self,200,...)
    elseif amount == 66  then
      super.hurt(self,666666,...)
     elseif amount == 67  then
       super.hurt(self,670000,...)
    else
        super.hurt(self,0,...)]]

    end

    function void:onAct(battler, name)

        if name == "Check" and self.checks == 0 then
        self.checks =  1
        return "* void - ATK 100 DEF 100\n* This creature is definitely in the wrong time and space!"
        else if name == "Check" and self.checks == 1 then
        self.checks = 2   
        self:removeAct("Something")
        self:registerAct("Flirt")
        self:registerAct("Hug")
        self:registerAct("Imitate")
        return "* void - ATK 100 DEF 100\n* Stereotypical: Curvaceously attractive, but no brains..."  
        elseif name == "Check" and self.checks == 2 then
        self.checks = 3 
        return "* void - ATK 100 DEF 100\n* Stereotypical: Curvaceously attractive, but no brains..."  
        elseif name == "Something" then
        return TableUtils.pick{
        "* You wave,[wait:5] void waves(?) back at you.",
        "* You say hello,[wait:5] void says hi back.",
        "* You smile,[wait:5] void imitates your smile."}
        elseif name == "Apologize"  then
        self.turn_count = self.turn_counted 
        self:removeAct("Apologize")
        return "* You apologized to void."
        --[[elseif name == "Flirt" then
        self.acted = true
        self.act1 = self.act1 + 1

        if self.act1 == 1 then

        else
           return "*  " .. self.name .. " ."
        end
        
       
        else
        self:removeAct("Something")
        return "* "
        end]]
        end
    end

    
    return super.onAct(self,battler, name)
    
end
    -- first 3 turns
    function void:getEncounterText()
        
    if self.turn_count == 2 then
    return "* void wonders why are you here."
    elseif self.turn_count == 3 then
    return "* void looks at you curiously."
    end   
     return TableUtils.pick(self.text)  
        
end

--end
return void