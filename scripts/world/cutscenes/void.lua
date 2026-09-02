return {
    meeting = function(cutscene)
   
        if not Game:getFlag("void_fighted",false)  then
        cutscene:text("* Ball Club: Meet here!\n* Next meeting:\n* October 10th 10")  
        day = tonumber(os.date("%d"))
        month = tonumber(os.date("%m"))    
        hour = tonumber(os.date("%H"))
       local void = cutscene:getCharacter("void_ut")
       -- if day == 10 and month == 10 and hour == 22 or hour == 10
        --then
            cutscene:look(down)
            cutscene:wait(cutscene:playSound("escaped"))
            cutscene:setSpeaker(void)

            cutscene:text("* ah.[wait:5]\n* i'm late.[wait:5]\n* i'm late...")
            cutscene:text("* [wait:5]please forgive me!!!")
            cutscene:playSound("drive")
            cutscene:wait(cutscene:slideTo(void, Game.world.player.x, Game.world.player.y-30, 1))
            cutscene:playSound("snd_squeaky")
            cutscene:fadeOut(0)   
            cutscene:wait(2)
            cutscene:startLightEncounter("void")
            cutscene:fadeIn(0) 
            void:remove()
            Game:setFlag("void_fighted",true)
        else
        cutscene:text("* Ball Club: Meet here!\n* Next meeting:\n* October 10th 10")  
       -- end
        end


    end
    
}   