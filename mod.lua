function Mod:init()
    print("Loaded "..self.info.name.."!")
    self.voice_timer = 0
end
function Mod:preUpdate()
    self.voice_timer = Utils.approach(self.voice_timer, 0, DTMULT)
end
function Mod:load(data, new_file)
    if new_file then
        Game.world:registerCall("Dimensional Box A", "cell.box_a")
        Game.world:registerCall("Dimensional Box B", "cell.box_b")
    end
end