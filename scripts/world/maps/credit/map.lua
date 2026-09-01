local room, super = Class(Map)

function room:onEnter()
    Game.world.player:remove()
    for _, follower in ipairs(Game.world.followers) do follower:remove() end
    Game.world:startCutscene("credit.credit")
end

return room