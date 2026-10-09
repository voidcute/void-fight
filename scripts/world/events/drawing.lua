local drawing, super = Class(Event)
function drawing:init(data)
    super.init(self, data.x, data.y, data.width, data.height)

    self.object_id = "drawing"
    if not self:getFlag("got_glowshard", false) then
        self.sprite = Sprite("world/events/shine", 0, 0)
        self.sprite:setScale(2)
        self.sprite:play(10/30) -- image_speed = 0.1
        self:addChild(self.sprite)
    end
        if Game:getFlag("obtained", false) then
        self:remove()
    end
end

function drawing:onInteract(player, dir)
    local success, result_text = Game.inventory:tryGiveItem("undertale/void_drawing")
    -- "success" is whether it was given or not, "result_text" is nicely formatted dialogue we can just use
    Game.world:showText(result_text)
    if success then
        -- successfully picked up the item, remove this event and dont spawn it in the future
        self:remove()
        Game:setFlag("obtained", true)
    end
end

return drawing