return{
    
    turn1 = function (cutscene)
    void = cutscene:getCharacter("void")  

    body = void:getSpritePart("body")
    eyes = void:getSpritePart("eyes")

    body:setSprite("enemies/void_ut/body_sweat")  
    eyes:setSprite("enemies/void_ut/eyes_sweat")

    cutscene:battlerText(void,"ah, sorry.[wait:5]\ni thought you was a ball\nso i bumped into you.")
    cutscene:battlerText(void,"what are you doing here?[wait:5]\ndidn't you read the sign?") 
    end,
    turn2 = function (cutscene)
    body:setSprite("enemies/void_ut/body")  
    eyes:setSprite("enemies/void_ut/eyes")
    cutscene:battlerText(void,"you are \na human right?[wait:5]\nit's quite rare from \nwhere i come from.")    

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
    cutscene:battlerText(void, "ouch. that hurts.\nwhy did you hit me?")  
    cutscene:battlerText(void, "is it because \ni bumped into you?\ni am so sorry.")  
    end,

    hurt2 = function (cutscene)
    cutscene:battlerText(void, "ouch. why are you\nstill keep hitting me?\ni said i'm sorry.")
    end,
    hurt3 = function (cutscene)
    cutscene:battlerText(void, "...")  
    cutscene:battlerText(void, "oh. are you...\ntrying to kill me?")     
    cutscene:battlerText(void, "so you must be\none of those human.")
    cutscene:battlerText(void, "thinking we are just\nsome creature for\nyou to farm EXP.") 
    cutscene:battlerText(void, "you shouldn't do that.")   
    end,
    hurt4 = function (cutscene)
    cutscene:battlerText(void, "human. i don't know\nwhere you get \nthis idea from.")   
    cutscene:battlerText(void, "but maybe can you like\njust stop doing it?")   
    end,
    hurt5 = function (cutscene)
    cutscene:battlerText(void, "please stop...\nif you keep hitting me\ni will...")         
    end,
    hurt6 = function (cutscene)
    cutscene:battlerText(void, "...")         
    end,
    hurt7 = function (cutscene)
    cutscene:battlerText(void, "...")         
    end,
    hurt8 = function (cutscene)
    cutscene:battlerText(void, "...")         
    end,
    hurt9 = function (cutscene)
    cutscene:battlerText(void, "aaaaa.")

    end,

    die = function (cutscene)
    Game.battle.music:stop()
    cutscene:battlerText(void, "ok. so the truth is...\n")   
    cutscene:battlerText(void, "i don't give any EXP.\nit doesn't exist\nfrom where i come from")  
    cutscene:battlerText(void, "in fact, you can't\neven kill me.\nbecause i will run away.")
    cutscene:battlerText(void, "i still somehow hope\nyou have a change of heart.")
    cutscene:battlerText(void, "strange isn't?\nit have always\nbeen like this.")
    cutscene:battlerText(void, "human and us don't have\na good history together.")     
    cutscene:battlerText(void, "maybe it will change one day.")  
    cutscene:battlerText(void, "oh sorry.\ni must have wasted your time.\nanyway i'm going to home.")   
    cutscene:battlerText(void, "i was going to invite\nsomeone to my place.\nbut you? yeah i think\nthey will not like you.")   
    cutscene:battlerText(void, "you would be dead the \nmomment you enter there.")  
    cutscene:wait(cutscene:slideTo(void, void.x, void.y-300, 3))
    cutscene:after(function() -- after the cutscene is done
    Game.battle:returnToWorld() -- Remove the battle scene
    end)
    
    end,

    slime = function (cutscene)      
    cutscene:battlerText(void, "uh what?\nwhat did you just say???")  
    end,


            

}