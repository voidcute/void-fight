local item, super = Class(Item, "undertale/void_drawing")

function item:init()
    super.init(self)

    -- Display name
    self.name = "void's drawing"
    self.short_name = "Drawing"

    -- Item type (item, key, weapon, armor)
    self.type = "item"
    -- Whether this item is for the light world
    self.light = true

    -- Default shop sell price
    self.sell_price = 15
    -- Whether the item can be sold
    self.can_sell = true

    -- Item description text (unused by light items outside of debug menu)
    self.description = "Used to make punching attacks stronger for one battle."

    -- Light world check text
    self.check = {
        "Unique\n* Use outside of battle\nto look at the drawing.",
        "* Seems to be depicted an island.\n* It is filled with slimes."
    }

    -- Consumable target mode (ally, party, enemy, enemies, or none)
    self.target = "none"
    -- Where this item can be used (world, battle, all, or none)
    self.usable_in = "all"
    -- Item this item will get turned into when consumed
    self.result_item = nil
    -- Will this item be instantly consumed in battles?
    self.instant = false
end

function item:onWorldUse(target)
    Game.world:closeMenu()
    Game.world.timer:after(2 / 30, function()
        if Kristal.getLibConfig("magical-glass", "punch_card_exploit") then
            ImageViewerBroken("world/drawing")
        else
            Game.world:openMenu(ImageViewer("world/drawing"))
        end
    end)
    return false
end


return item