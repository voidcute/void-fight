function Mod:init()
    print("Loaded "..self.info.name.."!")
    self.voice_timer = 0
end
function Mod:preUpdate()
    self.voice_timer = Utils.approach(self.voice_timer, 0, DTMULT)
end