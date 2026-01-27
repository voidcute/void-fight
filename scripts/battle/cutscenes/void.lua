return{
    
    turn1 = function (cutscene)
    -- handling sprite parts
    void = cutscene:getCharacter("void")  
    body = void:getSpritePart("body")
    body:setSprite("enemies/void_ut/body_sweat")   
    eyes = void:getSpritePart("eyes")

    eyes:setSprite("enemies/void_ut/eyes_sweat")
    cutscene:battlerText(void,"ah, sorry.\ni thought you was a ball\nso i bumped into you.")
    cutscene:battlerText(void,"what are you doing here?\ndidn't you read the sign?")
    body:setSprite("enemies/void_ut/body")
    eyes:setSprite("enemies/void_ut/eyes")  
    
    end,
    turn2 = function (cutscene)
    cutscene:battlerText(void,"huh, why are you looking\nat me like that.")
    cutscene:battlerText(void,"colors? i'm not sure \nwhat you mean.")
    end,
    hurt1 = function (cutscene)
    void = cutscene:getCharacter("void")      
    body = void:getSpritePart("body")
    body:setSprite("enemies/void_ut/body_sweat")   
    eyes = void:getSpritePart("eyes")
    eyes:setSprite("enemies/void_ut/eyes_sweat")
    cutscene:battlerText(void, "ouch. that hurts.\nwhy did you hit me.")  
    cutscene:battlerText(void, "is it because \ni bumped into you?\ni am so sorry.")  

    end

            

}