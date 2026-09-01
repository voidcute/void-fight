return{
credit = function(cutscene)
    local objects = {}
    local function text(str, x, y)
        local textobj = Text(str,(x or 0) + (SCREEN_WIDTH/2),y, {auto_size = true})
        textobj:setOrigin(0.5, 0)
        table.insert(objects, textobj)
        cutscene.world:addChild(textobj)
        return textobj

    end
    local function clear()
        for _, textobj in ipairs(objects) do textobj:remove() end
        objects = {}
    end

    text("thank you for playing void fight.", 0, 220)
    if not Game:getFlag("void_fighted")  then
    cutscene:wait(5)
    text("wait you didn't even fight them???", 0, 260)
    end
end
}