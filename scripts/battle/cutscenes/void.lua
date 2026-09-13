return{
    
    turn1 = function (cutscene)
    void = cutscene:getCharacter("void")  

    body = void:getSpritePart("body")
    eyes = void:getSpritePart("eyes")
    x = body.origin_x
    y = body.origin_y
    function reset()
    eyes:slidePath({{0,0}}, {time= 0,speed = 1, loop = false, relative = true, snap=true})
    cutscene:wait(0.01)
    end
--  eyes:slidePath({{0,0}}, {speed = 0.2, loop = true, relative = true})
    body:setSprite("enemies/void_ut/body_sweat")  
    eyes:setSprite("enemies/void_ut/eyes_sweat")
    cutscene:battlerText(void,"ah, so sorry.[wait:5]\ni was such in a hurry\ni bumped into you.")
    cutscene:battlerText(void,"i was so excited to \nhave a new member and...")
    cutscene:battlerText(void,"...") 

    eyes:setSprite("enemies/void_ut/eyes_confused")
    reset()
    eyes:slidePath({{0,0},{0,2},{0,0}}, {speed = 0.2, loop = true, relative = true})
    cutscene:battlerText(void,"you don't look \nlike a ball...")  
    cutscene:battlerText(void,"what are you doing here?[wait:5]\ndidn't you read the sign?") 
    body:setSprite("enemies/void_ut/body")  
    eyes:setSprite("enemies/void_ut/eyes")
    reset()
    eyes:slidePath({{x,y}}, {speed = 1, loop = true, relative = true})
    eyes:slidePath({{0,0},{0,2},{2,0},{-2,0},{0,2},{0,0}}, {speed = 0.2, loop = true, relative = true})
    cutscene:battlerText(void,"oh no.[wait:5]\nit's ok.") 
    cutscene:battlerText(void,"since you're the\nonly one here,[wait:5]\nyou're welcome to join.") 

    end,
    turn2 = function (cutscene)
    cutscene:battlerText(void,"huh?\n[wait:5]where are the others?")  
    cutscene:battlerText(void,"... i don't know.")
    cutscene:battlerText(void,"i've put signs all\nover this place.")   
    reset()
    eyes:setSprite("enemies/void_ut/eyes_frowning")
    eyes:slidePath({{0,0},{0,2},{0,0}}, {speed = 0.2, loop = true, relative = true})
    cutscene:battlerText(void,"but no one ever came...")  
    cutscene:battlerText(void,"i was so lonely.[wait:5]\nbut then you came.")  
    end,
    turn3 = function (cutscene)
    reset()
    eyes:setSprite("enemies/void_ut/eyes")
    eyes:slidePath({{0,0},{0,2},{2,0},{-2,0},{0,2},{0,0}}, {speed = 0.2, loop = true, relative = true})
    cutscene:battlerText(void,"huh?[wait:5]\ni looks weird?\nhow come?") 
    cutscene:battlerText(void,"i looks colorful?\nah that.[wait:5]\ni'm not really \nfrom this place.") 
    cutscene:battlerText(void,"have you seen the place?\nit's a hot mess.\ni will melt if i stay\nhere for too long.") 
    cutscene:battlerText(void,"i'm from somewhere else.\n")     
    end,
    turn4 = function (cutscene)
    cutscene:battlerText(void,"oh wait.[wait:5]\nyou are a human right?.\nwith soul and parts.")       
    cutscene:battlerText(void,"...") 
    cutscene:battlerText(void,"i want to ask\nyou something.") 
    reset()
    eyes:slidePath({{0,0},{0,2},{0,0}}, {speed = 0.2, loop = true, relative = true})
    eyes:setSprite("enemies/void_ut/eyes_frowning")
    cutscene:battlerText(void,"i heard that human hate\nslimes.[wait:5] is that true?.")   
    eyes:setSprite("enemies/void_ut/eyes_slime")
    cutscene:battlerText(void,"no?[wait:5]\nphew that's a relief.")    
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
    cutscene:after(function()
    Game.battle:setState("VICTORY")
    end)  
    end,

    hurt1 = function (cutscene)    
    Game:setFlag("void_violence",1)
    void = cutscene:getCharacter("void")   
    body = void:getSpritePart("body")
    body:setSprite("enemies/void_ut/body_sweat")   
    eyes = void:getSpritePart("eyes")
    eyes:setSprite("enemies/void_ut/eyes_sweat")
    cutscene:battlerText(void, "ouch.[wait:5] that hurts.[wait:5]\nwhy did you hit me?")  
    cutscene:battlerText(void, "is it because \ni bumped into you?[wait:5]\ni am so sorry.")  
    end,

    hurt2 = function (cutscene)
    Game:setFlag("void_violence",2)
    cutscene:battlerText(void, "ouch. why are you\nstill hitting me?[wait:5]\ni said i am sorry.")
    end,
    hurt3 = function (cutscene)
    Game:setFlag("void_violence",3)    
    cutscene:battlerText(void, "i'm not sure why\nare you doing this.")   
    cutscene:battlerText(void, "but can you like just\nstop hitting me please?")   
    cutscene:battlerText(void, "it would make things\neasier for me.")

    end,
    hurt4 = function (cutscene)
    Game:setFlag("void_violence",4)
    cutscene:battlerText(void, "...")  
    cutscene:battlerText(void, "oh.[wait:5] are you...\ntrying to kill me?")     
    cutscene:battlerText(void, "so what i heard\nis true?...[wait:5]\nhuman hate slimes.[wait:5]\nthey would hunt us\nfor EXP.")
    cutscene:battlerText(void, "but that was a long\ntime ago...\nmaybe this is a\nmisunderstanding?") 
    end,
    hurt5 = function (cutscene)
    Game:setFlag("void_violence",5)
    cutscene:battlerText(void, "wait.[wait:5] wait![wait:5]\ni get it now.") 
    cutscene:battlerText(void, "you're bored.[wait:5]\nso you hit me\nfor fun.")
    cutscene:battlerText(void, "sorry for boring you.\nuh...[wait:5]do you like\nfun facts?\ni have some to tell.")
    cutscene:battlerText(void, "like about slimes.\nthere's an island\nfull of them.\ni come from there.")    
    cutscene:battlerText(void, "i can tell you more\nif you are interested.")
    end,
    hurt6 = function (cutscene)
    Game:setFlag("void_violence",6)
    cutscene:battlerText(void, "not interested huh?...[wait:5]")
    cutscene:battlerText(void, "but did you know that...[wait:5]\nwe are good friend\nwith plants?")
    cutscene:battlerText(void, "how did it happen?[wait:5]\nwell,[wait:5] long story short\nthey just showed up\none day.") 
    cutscene:battlerText(void, "apparently they was in\nconstant figthing\nwith undead humans?")   
    cutscene:battlerText(void, "they're tired of it and\nwanted to go\nsomewhere else.")   
    cutscene:battlerText(void, "they formed a relationship\nwith us.") 
    cutscene:battlerText(void, "they feed us\nwith their 'fleshes'.")
    cutscene:battlerText(void, "we water them\nwith their 'mucus'.")
    cutscene:battlerText(void, "i can tell you more\nif you are interested.")
    end,
    hurt7 = function (cutscene)
    Game:setFlag("void_violence",7)
    cutscene:battlerText(void, "still not interested?...[wait:5].\nokay okay i will switch \nto a different topic.")   
    cutscene:battlerText(void, "a friend told me that \nhumans like [color:yellow]ACT[color:reset]ing.")   
    cutscene:battlerText(void, "how do they know it?\nbecause they are\nan [color:yellow]ACT[color:reset]or.") 
    cutscene:battlerText(void, "they're are very\ngood at[color:yellow] ACT[color:reset]ing") 
    cutscene:battlerText(void, "humans would watch \ntheir [color:yellow]ACT[color:reset]s for hours,[wait:5]\nwithout getting bored.")  
    cutscene:battlerText(void, "i can tell you more\nif you are interested...") 

    end,
    hurt8 = function (cutscene)
    Game:setFlag("void_violence",8)
    cutscene:battlerText(void, "please stop hitting me...[wait:5]\nif you keep do that\ni will...")    
    cutscene:battlerText(void, "ugh...[wait:5]\nthis must be a NIGHTMARE.")
    cutscene:battlerText(void, "i was hoping to make\nsome new friends...[wait:5]\nbut now i am...")
    end,
    hurt9 = function (cutscene)
    Game:setFlag("void_violence",9)
    cutscene:battlerText(void,"i'm just annoying you...")
    cutscene:battlerText(void,"they was right...\nhuman hate slimes.")
    cutscene:battlerText(void,"i'm such an idiot\nfor thinking otherwise...")
    end,

    die = function (cutscene)
    Game:setFlag("void_violence",10)
    void = cutscene:getCharacter("void")  
    body = void:getSpritePart("body")
    eyes = void:getSpritePart("eyes")    
    Game.battle.music:stop()
    void:toggleOverlay(true)
    void:setSprite("hurt")
    cutscene:wait(3)
    cutscene:battlerText(void, "...")  
    void:toggleOverlay(false)
    cutscene:battlerText(void, ".....")  
    eyes:setSprite("enemies/void_ut/save")
    cutscene:battlerText(void, "ok.[wait:5] so the truth is...")   
    cutscene:battlerText(void, "i don't give any\nEXP or even G.[wait:5]\nit doesn't exist from\nwhere i come from.")  
    cutscene:battlerText(void, "in fact,[wait:5] you can't\neven kill me.\nbecause i will run away.\nit's not like you\ncan kill a dream anyway.")
    cutscene:battlerText(void, "oh sorry[wait:5].\ni must have wasted\nyour time.")   
    cutscene:battlerText(void, "i was going to invite\nyou to the island.[wait:5]\nbut yeah now i think\nthey will not like you.")   
    cutscene:battlerText(void, "you would be dead the \nmoment you enter there.")  
    cutscene:battlerText(void, "...[wait:5]\ni still somehow hope you\nhave a change of heart.")
    cutscene:battlerText(void, "strange isn't?[wait:5]\nit has always\nbeen like this.")
    cutscene:battlerText(void, "we don't have a good\nhistory with human.")     
    cutscene:battlerText(void, "maybe it will\nchange one day.")  
    cutscene:battlerText(void, "anyways, i'm going home.")
    cutscene:battlerText(void, "see [color:red]you[color:reset] later.[wait:5]\nor maybe not...")
    cutscene:wait(cutscene:slideTo(void, void.x, void.y-300, 3))

    end,

    slime = function (cutscene)      
    Game:setFlag("void_slime",1)
    void = cutscene:getCharacter("void")  
    body = void:getSpritePart("body")
    eyes = void:getSpritePart("eyes")
    if Game:getFlag("void_violence",0) >= 1 then
    eyes:setSprite("enemies/void_ut/eyes_frisk")  
    body:setSprite("enemies/void_ut/body_angry")
    cutscene:battlerText(void, "ok,[wait:5] rude.[wait:5]\nfirst you hit me and\nnow you are saying\ni am stupid.") 
    Game:setFlag("void_violence",11)
    else 
    eyes:setSprite("enemies/void_ut/eyes_confused")  
    body:setSprite("enemies/void_ut/body_sweat")
    cutscene:battlerText(void, "uh what?\nwhat did you just say???")   

    end

    end,


            

}