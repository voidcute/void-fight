return{
    
    turn1 = function (cutscene)
    void = cutscene:getCharacter("void")  
    hat = void:getSpritePart("hat")
    body = void:getSpritePart("body")
    eyes = void:getSpritePart("eyes")
    void_ox = void.x
    void_oy = void.y
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
    reset()
    eyes:setSprite("enemies/void_ut/eyes")
    eyes:slidePath({{0,0},{0,2},{2,0},{-2,0},{0,2},{0,0}}, {speed = 0.2, loop = true, relative = true})
    cutscene:battlerText(void,"none of my piece are\ngood enough to give...") 
    cutscene:battlerText(void,"it's ok.") 
    cutscene:battlerText(void,"i can give you\nnsomething else.[wait:5]\nplease wait here,[wait:5]\ni'll go get it") 
    reset()
    body:setSprite("enemies/void_ut/body")  
    cutscene:slideTo(eyes, eyes.x+300, eyes.y, 3)
    cutscene:slideTo(body, body.x+300, body.y, 3)
    cutscene:wait(3)
    end,
    turn5 = function (cutscene,EnemyBattler)
    hat.visible = false
    eyes.visible = false
    body.visible = false
    cutscene:wait(0.1)
    eyes.x  = eyes.x -300
    body.x  = body.x -300
    cutscene:wait(0.1)
    void.x = void.x + 400
    cutscene:wait(0.1)
    hat.visible = true
    eyes.visible = true
    body.visible = true
    Game.battle.encounter:addEnemy("Flowerpot", 637, 240)
    flowerpot = cutscene:getCharacter("Flowerpot")
    chomp = flowerpot:getSpritePart("chomp")
    pot = flowerpot:getSpritePart("pot")
    flower = flowerpot:getSpritePart("flower")
    pot.flip_x = true
    void:toggleOverlay(true)
    void:setSprite("bodyside")
    pot:setSprite("enemies/Flowerpot/potside")
    chomp.visible = false
    cutscene:slideTo(flowerpot, flowerpot.x - 200, flowerpot.y, 3)
    cutscene:slideTo(void, void.x - 200, void.y, 3)
    cutscene:wait(3)
    cutscene:slideTo(flowerpot, flowerpot.x - 20, flowerpot.y, 1)
    cutscene:wait(1)
    void:toggleOverlay(false)
    pot.flip_x = false
    pot:setSprite("enemies/Flowerpot/pot")
    eyes:slidePath({{0,0},{0,2},{2,0},{-2,0},{0,2},{0,0}}, {speed = 0.2, loop = true, relative = true})
    

    cutscene:battlerText(void,"i'm back!\ndid ya miss me?")  
    cutscene:battlerText(void,"huh? you look like \nyou've seen a ghost.")  
    cutscene:battlerText(void,"uh anyways i've got\nsomething for you.")   
    cutscene:battlerText(void,"a flower seed!")  
    cutscene:battlerText(void,"go ahead and water them.") 
    end,
    turn6 = function (cutscene)
     cutscene:battlerText(void,"you did it!\nnow let's take a look.")  
    void:toggleOverlay(true)
    void:setSprite("bodyside")
    chomp.visible = true
    chomp.scale_y = 0
    cutscene:wait(0.2)
    Game.battle.timer:tween(1, chomp, {scale_y = 1})
    cutscene:wait(1)
    void:setSprite("bodyside_uh")
    cutscene:battlerText(void,"uh... this isn't right.") 
    pot:setSprite("enemies/Flowerpot/potside")
    chomp:setSprite("enemies/Flowerpot/chompside")
    
    void:setSprite("bodyside_uh")
    cutscene:wait(1)
    cutscene:battlerText(void,"oh no.") 
    cutscene:slideTo(void, void.x+20, void.y, 1)
    cutscene:wait(1)
    void:setSprite("bodyside_shock")
    void.flip_x = true
    flowerpot.flip_x = false
    cutscene:slideTo(void, void.x+400, void.y, 2)
    cutscene:slideTo(flowerpot, flowerpot.x+550, flowerpot.y, 2)
    cutscene:wait(2)
    flowerpot.x = 1050
    void.x =  1000
   
      
    end,
    turn7 = function (cutscene)
    void.flip_x = false
    void.x = -100
    void.scale_x = 2
    void.scale_y = 2
    void:setSprite("bodyside_sad")
    void.y = void_oy
    cutscene:wait(cutscene:slideTo(void, void_ox, void.y, 2))
    cutscene:battlerText(void,"phew.[wait:5] that was close.") 
    cutscene:battlerText(void,"sigh...[wait:5]\nthey gave me the wrong one.") 
    
    void:toggleOverlay(false)
    body:setSprite("enemies/void_ut/body_bite")
    eyes:setSprite("enemies/void_ut/eye")
    cutscene:battlerText(void,"sorry about that.[wait:5]\ni almost put you in danger.") 
    cutscene:battlerText(void,"...") 
    cutscene:battlerText(void,"oh this?[wait:5] don't worry\nabout it.[wait:5] i will be fine.") 
    cutscene:battlerText(void,"i will go get the right\none this time.") 
    cutscene:slideTo(eyes, eyes.x+300, eyes.y, 3)
    cutscene:slideTo(body, body.x+300, body.y, 3)
    cutscene:wait(3)
    end,
    turn8 = function (cutscene)
    hat.visible = false
    eyes.visible = false
    body.visible = false
    cutscene:wait(0.1)
    eyes.x  = eyes.x -300
    body.x  = body.x -300
    cutscene:wait(0.1)
    void.x = void.x + 400
    cutscene:wait(0.1)
    hat.visible = true
    eyes.visible = true
    body.visible = true
    Game.battle.encounter:addEnemy("Flowerpot", 637, 240)
    flowerpot = cutscene:getCharacter("Flowerpot")
    chomp = flowerpot:getSpritePart("chomp")
    pot = flowerpot:getSpritePart("pot")
    pot.flip_x = true
    void:toggleOverlay(true)
    void:setSprite("bodyleft_bite")
    pot:setSprite("enemies/Flowerpot/potside")
    chomp.visible = false
    cutscene:slideTo(flowerpot, flowerpot.x - 200, flowerpot.y, 3)
    cutscene:slideTo(void, void.x - 200, void.y, 3)
    cutscene:wait(3)
    cutscene:slideTo(flowerpot, flowerpot.x - 20, flowerpot.y, 1)
    cutscene:wait(1)
    void:toggleOverlay(false)
    pot.flip_x = false
    pot:setSprite("enemies/Flowerpot/pot")
    eyes:slidePath({{0,0},{0,2},{2,0},{-2,0},{0,2},{0,0}}, {speed = 0.2, loop = true, relative = true})
    

    
    end,
    turn9 = function (cutscene)
    end,
    turn10 = function (cutscene)
    cutscene:battlerText(void,"uh...") 

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
    end,
    hurt5 = function (cutscene)
    Game:setFlag("void_violence",5)
    cutscene:battlerText(void, "...")  
    void:getSpritePart("body"):setSprite("enemies/void_ut/body_sweat")   
    void:getSpritePart("eyes"):setSprite("enemies/void_ut/eyes_frowning")
    cutscene:battlerText(void, "oh.[wait:5] are you...\ntrying to kill me?")   
    cutscene:battlerText(void, "no way...\nthis must be a\nmisunderstanding.") 
    cutscene:battlerText(void, "you wouldn't actually\ndo that right?") 
    end,
    hurt6 = function (cutscene)
    Game:setFlag("void_violence",6)

    end,
    hurt7 = function (cutscene)
    Game:setFlag("void_violence",7)
    cutscene:battlerText(void, "")   

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