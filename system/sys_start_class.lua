------------------------------- class Entity -------------------------------

Entity = {
    x = 0,
    y = 0,
    vx = 0,
    vy = 0,
    r = 0
}

function Entity:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

function Entity:init(x, y, vx, vy, r)
    self:setCoord(x, y)
    self:setVelocite(vx, vy)
    self:setRadius(r)
end

function Entity:setCoord(x, y)
    self.x = x
    self.y = y
end

function Entity:getX()
    return self.x
end

function Entity:getY()
    return self.y
end

function Entity:setRadius(r)
    self.r = r
end

function Entity:getRadius()
    return self.r
end

function Entity:setVelocite(vx, vy)
    self.vx = vx
    self.vy = vy
end

function Entity:getVx()
    return self.vx
end

function Entity:getVy()
    return self.vy
end

------------------------------- class Player -------------------------------

Player = Entity:new({
    name = "",
    pts = 0,
    memTime = 0,
    memX = 0,
    memY = 0
}) -- errite de Entity

function Player:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

function Player:init(name, pts, x, y, vx, vy, r)
    self:setCoord(x, y)
    self:setVelocite(vx, vy)
    self:setRadius(r)
    self:setName(name)
    self:setPts(pts)
    self:setMemory(system.getTime(), self:getX(), self:getY(), 0)
end

function Player:estimateVelocite()
    local nt = system.getTime()
    local nx = self:getX()
    local ny = self:getY()
    
    local t = nt - self:getMemTime()
    local x = nx - self:getMemX()
    local y = ny - self:getMemY()
    
    self:setVelocite(x / t, y / t)
    self:setMemory(nt, nx, ny)
end

function Player:setMemory(t, x, y)
    self.memTime = t
    self.memX = x
    self.memY = y
end

function Player:getMemTime()
    return self.memTime
end

function Player:getMemX()
    return self.memX
end

function Player:getMemY()
    return self.memY
end

function Player:setName(name)
    self.name = name
end

function Player:setPts(pts)
    self.pts = pts
end

function Player:getName()
    return self.name
end

function Player:getPts()
    return self.pts
end

p = {
    Player:new(nil),
    Player:new(nil)
}

p[1]:init("player 1", 0, 0, svgHeight / 2, 0, 0, 25)
p[2]:init("player 2", 0, 1024, svgHeight / 2, 0, 0, 25)

p[1]:estimateVelocite()
p[2]:estimateVelocite()

------------------------------- class Ball -------------------------------

Ball = Entity:new(nil) -- errite de Entity

function Ball:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

function Ball:borderCollision(x, y, vx, vy, r)
    local vx = ((x + r >= 0 and x - r >= 0) and (x + r <= svgWidth and x - r <= svgWidth)) and vx or vx * -1
    local vy = ((y + r >= 0 and y - r >= 0) and (y + r <= svgHeight and y - r <= svgHeight)) and vy or vy * -1
    
    self:setCoord(x + vx, y + vy)
    self:setVelocite(vx, vy)
end

function Ball:playerCollision(x, y, vx, vy, r)
    
end

function Ball:update()
    local x = self:getX()
    local y = self:getY()
    local vx = self:getVx()
    local vy = self:getVy()
    local r = self:getRadius()
    
    self:borderCollision(x, y, vx, vy, r)
    self:playerCollision(x, y, vx, vy, r)
end

ball = Ball:new(nil)

ball:init(svgWidth / 2, svgHeight / 2, 2, 2, 25)