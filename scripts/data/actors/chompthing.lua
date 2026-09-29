local actor, super = Class(Actor, "chompthing")

function actor:init()
    super.init(self)

    -- Display name (optional)
    self.name = "chompthing"

    -- Width and height for this actor, used to determine its center
    self.width = 27
    self.height = 45

    -- Hitbox for this actor in the overworld (optional, uses width and height by default)
    self.hitbox = {0, 25, 19, 14}

    -- Color for this actor used in outline areas (optional, defaults to red)
    self.color = {1, 0, 0}

    -- Whether this actor flips horizontally (optional, values are "right" or "left", indicating the flip direction)
    self.flip = nil

    -- Path to this actor's sprites (defaults to "")
    self.path = "enemies/chompthing"
    -- This actor's default sprite or animation, relative to the path (defaults to "")
    self.default = "idle"

    -- Sound to play when this actor speaks (optional)
    self.voice = nil
    -- Path to this actor's portrait for dialogue (optional)
    self.portrait_path = nil
    -- Offset position for this actor's portrait (optional)
    self.portrait_offset = nil

    -- Whether this actor as a follower will blush when close to the player
    self.can_blush = false

    -- Table of talk sprites and their talk speeds (default 0.25)
    self.talk_sprites = {}

    -- Table of sprite animations
    self.animations = {
        ["lightbattle_hurt"] = {"lightbattle/hurt", 1, true},
    }

    self.light_battle_width = 39
    self.light_battle_height = 81

    self:addLightBattlerPart("body", {
        ["sprite"] = function()
            local sprite = Sprite(self.path.."/body", 0,0)
            sprite.origin_y = 1
            return sprite
        end,
        ["init"] = function(part)
            part.wiggle_timer = 0
        end,
        ["update"] = function(part)
            part.wiggle_timer = part.wiggle_timer + DTMULT
            part.sprite.x = -6 + math.sin(part.wiggle_timer / 18) * 1.5
            part.sprite.y = 85 - (1 - math.cos(part.wiggle_timer / 18)) * 1.5
            part.sprite.rotation = math.sin(part.wiggle_timer / 18) * 0.04
        end
    })

     self:addLightBattlerPart("pot", {
        -- path, function that returns a path, or a function that returns a sprite object
        -- if one's not defined, get the default animation
        ["sprite"] = function()
            local sprite = Sprite(self.path.."/pot",0, 0)
            sprite.layer = 501           
            return sprite
        end
    })
end

return actor