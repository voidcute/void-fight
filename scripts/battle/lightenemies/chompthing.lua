local chompthing, super = Class(LightEnemyBattler)

function chompthing:init()
    super.init(self)

    -- Enemy name
    self.name = "chompthing"
    -- Sets the actor, which handles the enemy's sprites (see scripts/data/actors/chompthing.lua)
    self:setActor("chompthing")

    -- Enemy health
    self.max_health = 5000
    self.health = 5000
    -- Enemy attack (determines bullet damage)
    self.attack = 5
    -- Enemy defense (usually 0)
    self.defense = 0
    -- Enemy reward
    self.money = 0
    self.experience = 0
    
    -- self.spare_points = 1
    
    self.dialogue_bubble = "ut_large"

    -- List of possible wave ids, randomly picked each turn
    self.waves = {
        -- "basic",
        -- "aiming",
        -- "movingarena"
    }

    self.menu_waves = {
        -- "aiming"
    }

    -- Dialogue randomly displayed in the enemy's speech bubble
    self.dialogue = {
        "[wave:3][speed:0.5]....."
    }

    -- Check text (automatically has "ENEMY NAME - " at the start)
    self.check = "ATK 5 DEF 0\n* Cotton heart and button eye\n* You are the apple of my eye"

    -- Text randomly displayed at the bottom of the screen each turn
    self.text = {
        "* chompthing stands around\nabsentmindedly.",
        "* chompthing stands around\nabsentmindedly?"
    }
    -- Text displayed at the bottom of the screen when the enemy has low health
    self.low_health_text = "* The chompthing looks like it's\nabout to fall over."
    -- Register act called "Smile"
    
    -- Register party act with Noelle called "Tell Story"


    -- can be a table or a number. if it's a number, it determines the width, and the height will be 13 (the ut default).
    -- if it's a table, the first value is the width, and the second is the height
    self.gauge_size = 150

    self.damage_offset = {5, -70}
end

function chompthing:onDodge(battler, attacked)
    print("Missed!", battler and battler.chara.id or "nil", attacked)
end

function chompthing:onAct(battler, name)
        if name == "Check" then
        return "* you can't see this lol"
        end
end

return chompthing