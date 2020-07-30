-- controller

controllerMain = function()
    local val = {
        bx = ball:getX(),
        by = ball:getY(),
        br = ball:getRadius(),
        p1x = p[1]:getX(),
        p1y = p[1]:getY(),
        p2x = p[2]:getX(),
        p2y = p[2]:getY()
    }
    return render(viewMain, val)
end