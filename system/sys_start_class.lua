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
    memY = 0,
    goalX = 0,
    goalY = 0,
    goalW = 0,
    goalH = 0
}) -- errite de Entity

function Player:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

function Player:init(name, pts, x, y, vx, vy, r, gx, gy, gw, gh)
    self:setCoord(x, y)
    self:setVelocite(vx, vy)
    self:setRadius(r)
    self:setName(name)
    self:setPts(pts)
    self:setMemory(system.getTime(), self:getX(), self:getY())
    self:setGoal(gx, gy, gw, gh)
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

function Player:getMemory()
    return self.memTime, self.memX, self.memY
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

function Player:setGoal(x, y, w, h)
    self.goalX = x
    self.goalY = y
    self.goalW = w
    self.goalH = h
end

function Player:getGoal()
    return self.goalX, self.goalY, self.goalW, self.goalH
end

function Player:isWin(b)
    local gx, gy, gw, gh = self:getGoal()
    local bx = b:getX()
    local by = b:getY()
    local br = b:getRadius()
    
    if ((bx + br >= gx or bx - br >= gx) and 
        (bx + br <= gx + gw or bx - br <= gx + gw) and 
        (by + br >= gy or by - br >= gy) and 
        (by + br <= gy + gh or by - br <= gy + gh)) then
        
        self:setPts(self:getPts() + 1)
        b:setCoord(svgWidth / 2, svgHeight / 2)
        b:setVelocite(0, 0)
    end
end

p = {
    Player:new(nil),
    Player:new(nil)
}

p[1]:init("player 1", 0, 100, svgHeight / 2, 0, 0, 25, 999, 231, 25, 150)
p[2]:init("player 2", 0, 924, svgHeight / 2, 0, 0, 25, 0, 231, 25, 150)

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
    local nvx = ((x + r >= 0 and x - r >= 0) and (x + r <= svgWidth and x - r <= svgWidth)) and vx or vx * -1
    local nvy = ((y + r >= 0 and y - r >= 0) and (y + r <= svgHeight and y - r <= svgHeight)) and vy or vy * -1
    
    return nvx, nvy
end

function Ball:playerCollision(x, y, vx, vy, r, player, acc)
    acc = acc or 1

    local px = player[acc]:getX()
    local py = player[acc]:getY()
    local pvx = player[acc]:getVx()
    local pvy = player[acc]:getVy()
    local pr = player[acc]:getRadius()
    
    local dx = x - px
    local dy = y - py
    local dist = math.sqrt(dx * dx + dy * dy)
    
    local angle = math.atan(dx, dy)
    
    local dirX = math.cos(angle)
    local dirY = math.sin(angle)
    
    local nvx = (dist > r + pr) and vx or (vx + pvx) * dirX
    local nvy = (dist > r + pr) and vy or (vy + pvy) * dirY
    
    return (acc < #player and vx == nvx and vy == nvy) and 
        self:playerCollision(x, y, nvx, nvy, r, player, acc + 1) or nvx, nvy
end

function Ball:update(player)
    local x = self:getX()
    local y = self:getY()
    local vx = self:getVx()
    local vy = self:getVy()
    local r = self:getRadius()
    
    local bvx, bvy = self:borderCollision(x, y, vx, vy, r)
    local pvx, pvy = self:playerCollision(x, y, vx, vy, r, player)
    
    local nvx = ((bvx ~= vx) and bvx or pvx) * frote
    local nvy = ((bvy ~= vy) and bvy or pvy) * frote
    
    self:setCoord(x + nvx, y + nvy)
    self:setVelocite(nvx, nvy)
    
    player[1]:isWin(self)
    player[2]:isWin(self)
end

ball = Ball:new(nil)

ball:init(svgWidth / 2, svgHeight / 2, 0, 0, 25)