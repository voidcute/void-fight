local actor, super = Class(Actor, "void_ut")

function actor:init()
    super.init(self)

    -- Display name (optional)
    self.name = "void"

    -- Width and height for this actor, used to determine its center
    self.width = 31
    self.height = 32

    -- Hitbox for this actor in the overworld (optional, uses width and height by default)
    self.hitbox = {4, 0, 24, 24}

    -- Color for this actor used in outline areas (optional, defaults to red)
    self.color = {1, 0, 0}

    -- Whether this actor flips horizontally (optional, values are "right" or "left", indicating the flip direction)
    self.flip = nil

    -- Path to this actor's sprites (defaults to "")
    self.path = "enemies/void_ut"
    -- This actor's default sprite or animation, relative to the path (defaults to "")
    self.default = "idle"

    -- Sound to play when this actor speaks (optional)
    self.voice = "void_5"
    -- Path to this actor's portrait for dialogue (optional)
    self.portrait_path = nil
    -- Offset position for this actor's portrait (optional)
    self.portrait_offset = nil

    -- Table of talk sprites and their talk speeds (default 0.25)
    self.talk_sprites = {}

    -- Table of sprite animations
    self.animations = {
        ["lightbattle_hurt"] = {"hurt", 1, true},
    }

    self.light_battle_width = 55
    self.light_battle_height = 66

    self:addLightBattlerPart("body", {
        -- path, function that returns a path, or a function that returns a sprite object
        -- if one's not defined, get the default animation
        ["create_sprite"] = function()
            local sprite = Sprite(self.path.."/body")
            sprite.layer = 500
            sprite:slidePath({{0,0},{0,1},{1,0},{0,-1},{-1,0},{0,0}}, {speed = 0.2, loop = true, relative = true})
            return sprite
        end,
    })

     self:addLightBattlerPart("eyes", {
        -- path, function that returns a path, or a function that returns a sprite object
        -- if one's not defined, get the default animation
        ["create_sprite"] = function()
            local sprite = Sprite(self.path.."/eyes",0, 1)
            sprite.layer = 501           
            sprite:slidePath({{0,0},{0,2},{2,0},{-2,0},{0,2},{0,0}}, {speed = 0.2, loop = true, relative = true})
            return sprite
        end
    })
    
     self:addLightBattlerPart("hat", {
        -- path, function that returns a path, or a function that returns a sprite object
        -- if one's not defined, get the default animation
        ["create_sprite"] = function()
            local sprite = Sprite(self.path.."/hat",0, 1)
            sprite:slidePath({{0,0},{0,1},{1,0},{0,-1},{-1,0},{0,0}}, {speed = 0.2, loop = true, relative = true})
            sprite.layer = 502
            return sprite
        end
    })

end
function actor:onTextSound(sound, node)
    if Mod.voice_timer == 0 then
        local snd = "voice/void"
        local pitch = 0.86 + Utils.random(0.34)
        Assets.playSound(snd, 1, pitch)
        Mod.voice_timer = 3
    end
    return true
end

return actor