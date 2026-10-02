local void, super = Class(LightBullet)

function void:init(x, y, dir, speed)
    -- Last argument = sprite path
    super.init(self, x, y, "bullets/void")

    self:setScale(1, 1)
    self.draw_children_above = 0
    -- Move the bullet in dir radians (0 = right, pi = left, clockwise rotation)
    self.physics.direction = dir or 0
    self.rotation = self.physics.direction
    -- Speed the bullet moves (pixels per frame at 30FPS)
    self.base_speed = speed or 0
    self.destroy_on_hit = false
    self.positions = {{self.x, self.y}}
    self.trail_timer = 0
    self.collider = nil
    self.target_x = nil
    self.target_y = nil
end
function void:onDamage()
    return{}
end

function void:draw()
    love.graphics.setLineWidth(15)
    if self.trail_timer < 120 and #self.positions > 1 then
        local points = {}
        for _, position in ipairs(self.positions) do
            table.insert(points, position[1] - self.x+10)
            table.insert(points, position[2] - self.y+10)
        end
        local alpha = math.min(1, (120 - self.trail_timer) / 30)
        love.graphics.setColor(0,191/255,1, alpha)
        love.graphics.line(points)
        love.graphics.setLineJoin("bevel")
        love.graphics.setLineStyle("rough")
        
    end

    super.draw(self)
end
function void:update()
    -- For more complicated bullet behaviours, code here gets called every update



    super.update(self)
    table.insert(self.positions, {self.x, self.y})
    self.trail_timer = self.trail_timer + DTMULT
    if self.trail_timer >= 120 then
        self.positions = {{self.x, self.y}}
        self.trail_timer = 0
    end

    local trail_colliders = {}
    if self.trail_timer < 120 then
        for index = 2, #self.positions do
            local previous = self.positions[index - 1]
            local current = self.positions[index]
            table.insert(trail_colliders, LineCollider(
                self,
                previous[1] - self.x + 10,
                previous[2] - self.y + 10,
                current[1] - self.x + 10,
                current[2] - self.y + 10
            ))
        end
    end
    self.collider = ColliderGroup(self, trail_colliders)

    local soul = Game.battle and Game.battle.soul
    if soul and soul.collidable then
        if self.collider and self.collider:collidesWith(soul.collider) then
            Game.battle["soul_speed"] = 0.5
        else
            Game.battle["soul_speed"] = 5
    
        end
    end
end

return void