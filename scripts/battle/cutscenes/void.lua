return{
    
    turn1 = function (cutscene)
    void = cutscene:getCharacter("void")  
    body = void:getSpritePart("body")
    body:setSprite("enemies/void_ut/body_sweat")   
    eyes = void:getSpritePart("eyes")

    eyes:setSprite("enemies/void_ut/eyes_sweat")
    cutscene:battlerText(void,"ah, sorry.\ni thought you was a ball\nso i bumped into you.")
    cutscene:battlerText(void,"what are you doing here?\ndidn't you read the sign?") 
    end,
    turn2 = function (cutscene)
    body:setSprite("enemies/void_ut/body")  
    eyes:setSprite("enemies/void_ut/eyes")
    cutscene:battlerText(void,"huh, why are you looking\nat me like that.")
    cutscene:battlerText(void,"colors?.\nhmm, now that you \nmention it")
    end,
    hurt1 = function (cutscene)    
    void = cutscene:getCharacter("void")    
    body = void:getSpritePart("body")
    body:setSprite("enemies/void_ut/body_sweat")   
    eyes = void:getSpritePart("eyes")
    eyes:setSprite("enemies/void_ut/eyes_sweat")
    cutscene:battlerText(void, "ouch. that hurts.\nwhy did you hit me.")  
    cutscene:battlerText(void, "is it because \ni bumped into you?\ni am so sorry.")  
    end,

    hurt2 = function (cutscene)
    eyes:setSprite("enemies/void_ut/eyes")  
    cutscene:battlerText(void, "aaaa.")
    end,
    die = function (cutscene,enemy)
    cutscene:battlerText(void, "aaaaa.")

    end,
    slime = function (cutscene)        
    body:setSprite("enemies/void_ut/body_sweat")   
    eyes:setSprite("enemies/void_ut/eyes_confused")
    cutscene:battlerText(void, "uh what?\nwhat did you just say???")  

    end

            

}