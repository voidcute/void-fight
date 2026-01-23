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
    eyes:setSprite("enemies/void_ut/eyes")    
    end
}