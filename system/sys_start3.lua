-- class Player

Player = {
    x = 0,
    y = 0
}

function Player:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

function Player:init(x, y)
    self:setCoord(x, y)
end

function Player:setCoord(x, y)
    self.x = x
    self.y = y
end

function Player:getX()
    return self.x
end

function Player:getY()
    return self.y
end

p = {
    Player:new(nil),
    Player:new(nil)
}

p[1]:init(0, svgHeight / 2)
p[2]:init(1024, svgHeight / 2)

-- class Ball

Ball = {
    x = 0,
    y = 0,
    vx = 0,
    vy = 0,
    r = 0
}

function Ball:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

function Ball:init(x, y, vx, vy, r)
    self:setCoord(x, y)
    self:setVelocite(vx, vy)
    self:setRadius(r)
end

function Ball:setCoord(x, y)
    self.x = x
    self.y = y
end

function Ball:setVelocite(vx, vy)
    self.vx = vx
    self.vy = vy
end

function Ball:setRadius(r)
    self.r = r
end

function Ball:getX()
    return self.x
end

function Ball:getY()
    return self.y
end

function Ball:getVx()
    return self.vx
end

function Ball:getVy()
    return self.vy
end

function Ball:getRadius()
    return self.r
end

function Ball:borderCollision(x, y, vx, vy, r)
    local nx = (x + r >= 0 and x + r <= svgWidth) and x + vx or x
    local ny = (y + r >= 0 and y + r <= svgHeight) and y + vy or y
    
    self:setCoord(nx, ny)
end

function Ball:update()
    local x = self:getX()
    local y = self:getY()
    local vx = self:getVx()
    local vy = self:getVy()
    local r = self:getRadius()
    
    self:borderCollision(x, y, vx, vy, r)
end

ball = Ball:new(nil)

ball:init(svgWidth / 2, svgHeight / 2, 0, 0, 25)