return {
    meeting = function(cutscene)
        cutscene:text("* Ball Club: Meet here!\n* Next meeting:\n* October 10th 10PM (or 10 AM)")  
        day = tonumber(os.date("%d"))
        month = tonumber(os.date("%m"))    
        hour = tonumber(os.date("%H"))
       local void = cutscene:getCharacter("void_ut")
       -- if day == 10 and month == 10 and hour == 22 or hour == 10
        --then
            cutscene:look(down)
            cutscene:wait(cutscene:playSound("escaped"))
  
            cutscene:text("* Ah.[wait:5]\n* i'm late.[wait:5]\n* i'm late...")
            cutscene:text("* [wait:5]i'm void.")
            cutscene:playSound("drive")
            cutscene:wait(cutscene:slideTo(void, Game.world.player.x, Game.world.player.y-30, 1))
            cutscene:startLightEncounter("void")
       -- end
    end,
    boom = function (cutscene)
        local void = cutscene:getCharacter("void_ut")
        cutscene:text("* a")
        void:explode()
    
end
}   