return{
    
    turn1 = function (cutscene)
    void = cutscene:getCharacter("void")  
    hat = void:getSpritePart("hat")
    body = void:getSpritePart("body")
    eyes = void:getSpritePart("eyes")
    x = body.origin_x
    y = body.origin_y
    function reset()
    eyes:slidePath({{0,0}}, {time= 0,speed = 1, loop = false, relative = true, snap=true})
    cutscene:wait(0.01)
    end
    eyes:slidePath({{0,0}}, {speed = 0.2, loop = true, relative = true})
    body:setSprite("enemies/void_ut/body_sweat")  
    eyes:setSprite("enemies/void_ut/eyes_sweat")
    cutscene:battlerText(void,"ah, i'm so sorry.[wait:5]\ni was such in a hurry\ni bumped into you.")
    cutscene:battlerText(void,"i was so excited to \nsee someone here...")
    cutscene:battlerText(void,"...") 
    reset()
    eyes:setSprite("enemies/void_ut/eyes_confused")
    eyes:slidePath({{0,0},{0,2},{0,0}}, {speed = 0.2, loop = true, relative = true})
    cutscene:battlerText(void,"you don't look \nlike a ball...")  
    cutscene:battlerText(void,"what are you doing here?[wait:5]\ndidn't you read the sign?") 
    body:setSprite("enemies/void_ut/body")  
    reset()
    eyes:setSprite("enemies/void_ut/eyes")
    eyes:slidePath({{0,0},{0,2},{2,0},{-2,0},{0,2},{0,0}}, {speed = 0.2, loop = true, relative = true})
    cutscene:battlerText(void,"oh no,[wait:5]\nit's ok.") 
    cutscene:battlerText(void,"since you're the\nonly one here,[wait:5]\nyou're welcome to join.") 
    cutscene:wait(0.1)
    end,
    turn2 = function (cutscene)
    cutscene:battlerText(void,"huh?\n[wait:5]where are the others?")  
    cutscene:battlerText(void,"... i don't know.")
    cutscene:battlerText(void,"i've put signs all\nover this place.")   
    reset()
    eyes:setSprite("enemies/void_ut/eyes_frowning")
    eyes:slidePath({{0,0},{0,2},{0,0}}, {speed = 0.2, loop = true, relative = true})
    cutscene:battlerText(void,"but no one ever came...")  
    cutscene:battlerText(void,"i was so lonely,[wait:5]\nbut then you came.\nthank you so much.")  
    eyes:setSprite("enemies/void_ut/eyes_slime")
    cutscene:battlerText(void,"as a token of gratitude\ni'll give you a\npiece of myself.")  
    end,
    turn3 = function (cutscene)
    eyes:slidePath({{0,0}}, {speed = 0.2, loop = true, relative = true})
    body:setSprite("enemies/void_ut/body_sweat")  
    eyes:setSprite("enemies/void_ut/eyes_sweat")    
    cutscene:battlerText(void,"s.. sorry...\nthat wasn't supposed\nto happen...")  
    cutscene:battlerText(void,"i got mixed up and\ngave you wrong piece.")  
    cutscene:battlerText(void,"let me try again.")  
    eyes:setSprite("enemies/void_ut/eyes")
    eyes:slidePath({{0,0},{0,2},{2,0},{-2,0},{0,2},{0,0}}, {speed = 0.2, loop = true, relative = true})
    end,
    turn4 = function (cutscene)
    void = cutscene:getCharacter("void")  
    hat = void:getSpritePart("hat")
    body = void:getSpritePart("body")
    eyes = void:getSpritePart("eyes")
    reset()
    eyes:setSprite("enemies/void_ut/eyes")
    eyes:slidePath({{0,0},{0,2},{2,0},{-2,0},{0,2},{0,0}}, {speed = 0.2, loop = true, relative = true})
    cutscene:battlerText(void,"none of my piece are\ngood enough to give...") 
    cutscene:battlerText(void,"it's ok.") 
    cutscene:battlerText(void,"i can give you\nnsomething else.[wait:5]\nplease wait here,[wait:5]\ni'll go get it") 
    reset()


    cutscene:slideTo(eyes, eyes.x+300, eyes.y, 3)
    cutscene:slideTo(body, body.x+300, body.y, 3)
    cutscene:wait(3)
    end,
    turn5 = function (cutscene,EnemyBattler)
     
    hat.visible = false
    eyes.visible = false
    body.visible = false
    cutscene:wait(0.1)
    cutscene:slideTo(eyes, eyes.x-300, eyes.y, 0.1)
    cutscene:slideTo(body, body.x-300, body.y, 0.1)

    cutscene:wait(0.1)
    cutscene:slideTo(void, void.x+400, void.y, 0.1)
    cutscene:wait(0.1)
    hat.visible = true
    eyes.visible = true
    body.visible = true
    cutscene:slideTo(void, void.x-200, void.y, 3)
    
    cutscene:wait(3)
    eyes:slidePath({{0,0},{0,2},{2,0},{-2,0},{0,2},{0,0}}, {speed = 0.2, loop = true, relative = true})
    cutscene:battlerText(void,"i'm back!\ndid ya miss me?")  
    cutscene:battlerText(void,"huh? you look like \nyou've seen a ghost.")  
    cutscene:battlerText(void,"uh anyways i've got\nsomething for you.")   
    cutscene:battlerText(void,"a seed!...\n[wait:5]of something...[wait:5]\ni'm not really sure.")  
    cutscene:battlerText(void,"but i'm sure you\nwill be amazed by it.") 
    cutscene:battlerText(void,"go ahead and water them.") 


    end,
    turn6 = function (cutscene)
    cutscene:battlerText(void,"a.") 
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
    function reset()
    eyes:slidePath({{0,0}}, {time= 0,speed = 1, loop = false, relative = true, snap=true})
    cutscene:wait(0.01)
    end
    void:getSpritePart("body"):setSprite("enemies/void_ut/body_sweat")   
    void:getSpritePart("eyes"):setSprite("enemies/void_ut/eyes_sweat")
    cutscene:battlerText(void, "ouch.[wait:5] that hurts.[wait:5]\nwhy did you hit me?")  
    cutscene:battlerText(void, "is it because \ni bumped into you?[wait:5]\ni am so sorry.")  
    end,

    hurt2 = function (cutscene)
    Game:setFlag("void_violence",2) 
    void:getSpritePart("body"):setSprite("enemies/void_ut/body_sweat")   
    void:getSpritePart("eyes"):setSprite("enemies/void_ut/eyes_sweat")
    cutscene:battlerText(void, "ouch. why are you\nstill hitting me?[wait:5]\ni said i am sorry.")
    end,
    hurt3 = function (cutscene)
    Game:setFlag("void_violence",3)    
    void:getSpritePart("body"):setSprite("enemies/void_ut/body_uh")   
    cutscene:battlerText(void, "i'm not sure why\nare you doing this.")   
    cutscene:battlerText(void, "but can you stop\nhitting me please?")   
    cutscene:battlerText(void, "it would make things\neasier for me.")

    end,
    hurt4 = function (cutscene)
    Game:setFlag("void_violence",4)
    cutscene:battlerText(void, "...")  
    void:getSpritePart("body"):setSprite("enemies/void_ut/body_sweat")   
    void:getSpritePart("eyes"):setSprite("enemies/void_ut/eyes_frowning")
    cutscene:battlerText(void, "oh.[wait:5] are you...\ntrying to kill me?")   
    cutscene:battlerText(void, "no way...\nthis must be a\nmisunderstanding.") 
    cutscene:battlerText(void, "you wouldn't actually\ndo that right?") 
    end,
    hurt5 = function (cutscene)
    Game:setFlag("void_violence",5)
    cutscene:battlerText(void, "wait.[wait:5]\nwait![wait:5]\ni get it now.") 
    cutscene:battlerText(void, "you don't hate me,[wait:5]\nyou're just bored so\nyou hit me for fun.")
    cutscene:battlerText(void, "sorry for boring you.\nuh...[wait:5]do you like trivias?[wait:5]\ni have some to tell.")
    cutscene:battlerText(void, "like about slimes.[wait:5]\nthere's an island\nfull of them.\ni live there.")  
    cutscene:battlerText(void, "there are many types\nof slimes there.[wait:5]\nsome are friendly.[wait:5]\nsome are... aggressive.") 
    cutscene:battlerText(void, "don't worry about it,[wait:5]\nthey live at\nthe shoreline.")   
    cutscene:battlerText(void, "i can tell you more\nif you are interested.")
    end,
    hurt6 = function (cutscene)
    Game:setFlag("void_violence",6)
    cutscene:battlerText(void, "not interested huh?...[wait:5]")
    cutscene:battlerText(void, "but did you know that...[wait:5]\nwe are good friend\nwith plants?")
    cutscene:battlerText(void, "how did it happen?[wait:5]\nwell,[wait:5] long story short\nthey just showed up\none day.") 
    cutscene:battlerText(void, "apparently they was in\nconstant figthing\nwith undead humans?")   
    cutscene:battlerText(void, "they're tired of it \nand wanted to go\nto somewhere else.")   
    cutscene:battlerText(void, "we formed a relationship\nwith them.") 
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
    cutscene:battlerText(void, "please stop hitting me...[wait:5]\nif you keep doing that\ni will...")    
    cutscene:battlerText(void, "ugh...[wait:5]\nthis must be a NIGHTMARE.")
    cutscene:battlerText(void, "i was hoping to make\nsome new friends...[wait:5]\nbut now i am...")
    end,
    hurt9 = function (cutscene)
    Game:setFlag("void_violence",9)
    cutscene:battlerText(void,"i'm just annoying you...")
    cutscene:battlerText(void,"you are actually trying to\nkill me...")
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
    cutscene:battlerText(void, "you can't kill me.[wait:5]\nbecause i would run away.")
    cutscene:battlerText(void, "sorry[wait:5]...\ni must have wasted\nyour time.")   
    cutscene:battlerText(void, "i wanted to invite\nyou to the island.[wait:5]\nbut uh now i think\nthey will not like you.")   
    cutscene:battlerText(void, "you would be dead the \nmoment you enter there.")  
    cutscene:battlerText(void, "...[wait:5]\ndespite everything,[wait:5] i still\nhope that we can\nbe friend.")
    cutscene:battlerText(void, "anyways, i'm going home.")
    cutscene:battlerText(void, "see [color:red]you[color:reset] later.")
    cutscene:wait(cutscene:slideTo(void, void.x, void.y-300, 3))
    cutscene:after(function()
    Game.battle:setState("VICTORY")
    end)  
    end,
    
  --[[  slime = function (cutscene)      
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

    end,--]]


            

}