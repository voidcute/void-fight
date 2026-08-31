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
    cutscene:battlerText(void,"oh wait.[wait:5]\nyou are a human right?[wait:10]\nthis will be interesting.")    

    end,
    turn3 = function (cutscene)

    end ,
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
    cutscene:battlerText(void, "ouch.[wait:5] that hurts.[wait:5]\nwhy did you hit me?")  
    cutscene:battlerText(void, "is it because \ni bumped into you?[wait:5]\ni am so sorry.")  
    end,

    hurt2 = function (cutscene)
    cutscene:battlerText(void, "ouch. why are you\nstill keep hitting me?[wait:5]\ni said i'm sorry.")
    end,
    hurt3 = function (cutscene)
    cutscene:battlerText(void, "...")  
    cutscene:battlerText(void, "oh.[wait:5] are you...\ntrying to kill me?")     
    cutscene:battlerText(void, "so you must be\none of those human.")
    cutscene:battlerText(void, "thinking we are just\nsome creature for\nyou to farm EXP.") 
    cutscene:battlerText(void, "you shouldn't do that.")   
    end,
    hurt4 = function (cutscene)
    cutscene:battlerText(void, "human. i don't know\nwhere you get \nthis idea from.")   
    cutscene:battlerText(void, "but can you like\njust stop doing it?")   
    cutscene:battlerText(void, "unbeliveable i know.[wait:5]\nit would make things\neasier for everyone.")
    end,
    hurt5 = function (cutscene)
    cutscene:battlerText(void, "do you find this\nfun or what?[wait:5]") 
    cutscene:battlerText(void, "if so i can tell you\nsome fun trivias.")
    cutscene:battlerText(void, "like about gardening!\nhave you ever heard of\ntalking plants?")

    end,
    hurt6 = function (cutscene)
    cutscene:battlerText(void, "not interested huh...[wait:5]\nand what's with the look?\nyou heard of it already?")
    cutscene:battlerText(void, "but did you know that...[wait:5]\ni come from a place where\nplants and slimes are\ngood friends?!")
    cutscene:battlerText(void, "plants feeding the slimes\nwith their 'fleshes',[wait:5]\nslimes watering the plants\nwith their 'mucus'.")
    cutscene:battlerText(void, "i can tell you more\nif you stop hitting me.")
    end,
    hurt7 = function (cutscene)
    cutscene:battlerText(void, "still not interested huh...[wait:5].\nokay okay i will switch \nto a different topic.[wait:5]\ni bet you've never\nseen a talking sign.")   
    cutscene:battlerText(void, "that's right![wait:5]\na takling sign![wait:5]\nthey run a theater![wait:5]\ntheir acting skill are\nout of this world!")
    cutscene:battlerText(void, "they can perform \nany act that you\ncan think of!\nthey are even better than\nme at making faces.")
    cutscene:battlerText(void, "i can tell you more\nif you stop hitting me...")
    end,
    hurt8 = function (cutscene)
    cutscene:battlerText(void, "please stop hitting me...[wait:5]\nif you keep do that\ni will...")    
    cutscene:battlerText(void, "ugh. this must be\na NIGHTMARE.[wait:5]\ni was hoping to make\nsome new friends...[wait:5]\nand now i am...[wait:5]")
    end,
    hurt9 = function (cutscene)
    cutscene:battlerText(void, "maybe i'm just a\nslime after all.\nonly exist for EXP.\ni'm just annoying you.")
    cutscene:battlerText(void, "i guess it's inevitable.\ngo ahead and get\nthat EXP.[wait:5]\nit's all you wanted right?")
   
    end,

    die = function (cutscene)
    Game.battle.music:stop()
    cutscene:wait(5)
    cutscene:battlerText(void, "ok.[wait:5] so the truth is...\n")   
    cutscene:battlerText(void, "i don't give any\nEXP or even G.[wait:5]\nit doesn't exist from\nwhere i come from.")  
    cutscene:battlerText(void, "in fact,[wait:5] you can't\neven kill me.\nbecause i will run away.\nit's not like you\ncan kill a dream anyway.")
    cutscene:battlerText(void, "oh sorry[wait:5].\ni must have wasted\nyour time.[wait:5]\nanyway i'm going home.")   
    cutscene:battlerText(void, "i was going to invite\nyou to my place.[wait:5]\nbut yeah now i think\nthey will not like you.")   
    cutscene:battlerText(void, "you would be dead the \nmoment you enter there.")  
    cutscene:battlerText(void, "...[wait:5]\ni still somehow hope you\nhave a change of heart.")
    cutscene:battlerText(void, "strange isn't?[wait:5]\nit has always\nbeen like this")
    cutscene:battlerText(void, "human and us don't have\na good history together.")     
    cutscene:battlerText(void, "maybe it will\nchange one day...")  
    cutscene:wait(cutscene:slideTo(void, void.x, void.y-300, 3))
    cutscene:after(function()
    Game.battle:setState("VICTORY")
    end)  
    end,

    slime = function (cutscene)      
    cutscene:battlerText(void, "uh what?\nwhat did you just say???")  
    end,


            

}