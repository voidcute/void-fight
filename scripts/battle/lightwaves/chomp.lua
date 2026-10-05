local Chomp, super = Class(LightWave)

function Chomp:init()
    super.init(self)

    -- heh
    self.time = 16.7
    

    self:setArenaShape({
        {0, 0},
        {254, 0},
        {254, 142},
        {0, 142}
    })
end

function Chomp:onStart()

    soul = Game.battle.soul
    arena = Game.battle.arena
    soul.speed = 5
    self.timer:after(14, function ()
        self.timer:cancel(chase)
    end)
    self.timer:after(16, function()
        local chomp = Game.battle:getEnemyBattler("chompthing")
        if chomp then
            Game.battle:removeEnemy(chomp, true)
        end

        local top_teeth = {}
        local bottom_teeth = {}
        local original_arena_y = arena.y
        for i = 0, 6 do
            local x = i * arena.width / 5
            local top = self:spawnBulletTo(Game.battle.arena.mask, "teeth", x, -20, math.rad(90), 0)
            local bottom = self:spawnBulletTo(Game.battle.arena.mask, "teeth", x + 24, arena.height + 20, math.rad(-90), 0)
            table.insert(top_teeth, top)
            table.insert(bottom_teeth, bottom)
        end
            for _, top in ipairs(top_teeth) do
                Game.battle.timer:tween(0.5, top, {y = 20})
            end
            for _, bottom in ipairs(bottom_teeth) do
                Game.battle.timer:tween(0.5, bottom, {y = arena.height - 20})
            end
        self.timer:after(0.5, function()
        
        Game.battle.timer:tween(0.5, self.arena_shape[1], {[2] = 100})
        Game.battle.timer:tween(0.5, self.arena_shape[2], {[2] = 100})
        Game.battle.timer:tween(0.5, arena, {y = original_arena_y + 50})
            for _, bottom in ipairs(bottom_teeth) do
                Game.battle.timer:tween(0.5, bottom, {y = bottom.y - 100})
            end

        end)
        self.timer:after(0.67, function()
        Assets.playSound("bigchomp",1)
        end)
       
        
    end)

    void_bullet = self:spawnBullet("void_bullet", soul.x-30, soul.y)  -- gets rotation based on position
    
        local variants = {
        {top = 1, bottom = 3},
        {top = 4, bottom = 1},
        {top = 0, bottom = 4},
        {top = 2, bottom = 4},
        {top = 5, bottom = 0},
        {top = 3, bottom = 4},
        {top = 4, bottom = 2},
    }
    ovoidx =  void_bullet.x
    ovoidy =  void_bullet.y
    local cycle_count = 0
    start_cycle = function()
    cycle_count = cycle_count + 1

    local variant_index = math.random(1, 7)
    local variant = variants[variant_index]
    local removed_top = variant.top
    local removed_bottom = variant.bottom
    local target_bottom = math.random(0, 1) == 1
    local removed_tooth_x
    local removed_tooth_y
    if target_bottom then
        removed_tooth_x = arena:getLeft() + removed_bottom * arena.width / 5 + 24
        removed_tooth_y = arena:getBottom() - 10
    else
        removed_tooth_x = arena:getLeft() + removed_top * arena.width / 5
        removed_tooth_y = arena:getTop() + 10
    end
     
    local top_teeth = {}
    local bottom_teeth = {}
    local original_arena_y = arena.y
    local original_arena_height = arena.height
    for i = 0, 6 do
         x = i * arena.width / 5
        local top, bottom
       
        if i ~= removed_top then
            top = self:spawnBulletTo(Game.battle.arena.mask, "teeth", x, -20, math.rad(90),0)
            table.insert(top_teeth, top)
        end
        if i ~= removed_bottom then
            bottom = self:spawnBulletTo(Game.battle.arena.mask, "teeth", x+24, arena.height+20, math.rad(-90),0)
            table.insert(bottom_teeth, bottom)
        end
    end
    
        self.timer:after(1, function()
            if removed_tooth_x < void_bullet.x then
                void_bullet.sprite.flip_x= true
            else
                void_bullet.sprite.flip_x= false
            end
            Game.battle.timer:tween(0.25, void_bullet, {x = removed_tooth_x})
            self.timer:after(0.25, function()
                Game.battle.timer:tween(0.25, void_bullet, {y = removed_tooth_y})
            end)
        end)
        self.timer:after(0.5, function()
            for _, top in ipairs(top_teeth) do
                Game.battle.timer:tween(0.5, top, {y = 20})
            end
            for _, bottom in ipairs(bottom_teeth) do
                Game.battle.timer:tween(0.5, bottom, {y = arena.height - 20})
            end
        end)
        self.timer:after(1.5, function()
            Game.battle.timer:tween(0.5, self.arena_shape[1], {[2] = 100})
            Game.battle.timer:tween(0.5, self.arena_shape[2], {[2] = 100})
            Game.battle.timer:tween(0.5, arena, {y = original_arena_y + 50})
             if not target_bottom then
            Game.battle.timer:tween(0.5, void_bullet, {y = removed_tooth_y + 100})
             end
            for _, bottom in ipairs(bottom_teeth) do
                Game.battle.timer:tween(0.5, bottom, {y = bottom.y - 100})
            end
        end)
        self.timer:after(2, function()
            for _, top in ipairs(top_teeth) do
                Game.battle.timer:tween(0.5, top, {y = -20})
            end
            for _, bottom in ipairs(bottom_teeth) do
                Game.battle.timer:tween(0.5, bottom, {y = original_arena_height + 21})
            end
            Game.battle.timer:tween(0.5, self.arena_shape[1], {[2] = 0})
            Game.battle.timer:tween(0.5, self.arena_shape[2], {[2] = 0})
            Game.battle.timer:tween(0.5, arena, {y = original_arena_y})
            Game.battle.timer:tween(0.5, void_bullet, {y = ovoidy})
            if cycle_count < 6 then
                self.timer:after(0.5, start_cycle)
            end
        end)
    end
    start_cycle()
    
    -- Store starting arena position

    local void = Game.battle:getEnemyBattler("void")
    local chomp = Game.battle:getEnemyBattler("chompthing")
    if not void or not chomp then
        return
    end

    local void_y = void.y
    local chomp_y = chomp.y
    
    self.timer:everyInstant(3, function()
        dialogue =  TableUtils.pick({"help!","aaaaaa","get away!"})
        bubble = void:spawnSpeechBubble(dialogue)  
        bubble:setAuto(false)
        bubble:setAdvance(false)
        self.timer:after(2, function()       
        bubble:setAuto(true)
        end)
    end)

    chase = self.timer:everyInstant(8, function ()
            void.x = 1000
            chomp.x = 1050
            void.y = void.y - 80
            chomp.y = chomp.y - 75
            void.scale_x = 1
            void.scale_y = 1
            void.alpha = 0.5
            chomp.scale_x = 1
            chomp.scale_y = 1
            chomp.alpha = 0.5
            void.flip_x = false
            chomp.flip_x = true
            Game.battle.timer:tween(3, void, {x = void.x - 1150})
            Game.battle.timer:tween(3, chomp, {x = chomp.x - 1150})
            self.timer:after(4, function()
                chomp.x = -200
                void.x = -100
                self.timer:after(1, function()
                    void.flip_x = true
                    chomp.flip_x = false
                    void.scale_x = 2
                    void.scale_y = 2
                    void.alpha = 1
                    chomp.scale_x = 2
                    chomp.scale_y = 2
                    chomp.alpha = 1
                    void.y = void_y
                    chomp.y = chomp_y
                    Game.battle.timer:tween(3, void, {x = void.x + 1050})
                    Game.battle.timer:tween(3, chomp, {x = chomp.x + 1050})
                end)
            end)
        end)
        
    end

function Chomp:update()
    if bubble and void then
        bubble.x = void.x
        bubble.y = void.y - 60
    end
    
    -- Increment timer for arena movement

    -- Calculate the arena Y offset
    -- Move the arena
    if Game.battle and Game.battle.arena then
        Game.battle.arena:setShape(self.arena_shape)
    end
    super.update(self)
end

return Chomp