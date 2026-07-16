return{
    
    turn1 = function (cutscene)
    void = cutscene:getCharacter("void")  

    body = void:getSpritePart("body")
    eyes = void:getSpritePart("eyes")

    body:setSprite("enemies/void_ut/body_sweat")  
    eyes:setSprite("enemies/void_ut/eyes_sweat")
    cutscene:battlerText(void,"ah, sorry.\ni thought you was a ball\nso i bumped into you.")
    cutscene:battlerText(void,"what are you doing here?\ndidn't you read the sign?") 
    end,
    turn2 = function (cutscene)
    cutscene:battlerText(void,"hmm,[wait:5] you are a human right?")    
    end,
    turn3 = function (cutscene)

    end,
    turn4 = function (cutscene)
    end,
    turn5 = function (cutscene)
    end,
    turn6 = function (cutscene)
    end,
    turn7 = function (cutscene)
    end,
    turn8 = function (cutscene)
    end,
    turn9 = function (cutscene)
    end,
    turn10 = function (cutscene)
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
    hurt3 = function (cutscene)
        
        
    end,
    hurt4 = function (cutscene)
        
    end,
    hurt5 = function (cutscene)
        
    end,
    hurt6 = function (cutscene)
        
    end,
    hurt7 = function (cutscene)
        
    end,
    hurt8 = function (cutscene)
        
    end,
    hurt9 = function (cutscene)
        
    end,

    die = function (cutscene,enemy)
    cutscene:battlerText(void, "aaaaa.")

    end,
    slime = function (cutscene)      
    cutscene:battlerText(void, "uh what?\nwhat did you just say???")  
    end

            

}