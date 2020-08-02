-- controller

controllerMain = function()
    eventHover(0, 0, svgWidth / 2, svgHeight, function(mX, mY)
        p[1]:setCoord(mX, mY)
    end)

    eventHover(svgWidth / 2, 0, svgWidth / 2, svgHeight, function(mX, mY)
        p[2]:setCoord(mX, mY)
    end)

    p[1]:estimateVelocite()
    p[2]:estimateVelocite()
    
    ball:update(p)
    
    local val = {
        bx = ball:getX(),
        by = ball:getY(),
        br = ball:getRadius(),
        p1x = p[1]:getX(),
        p1y = p[1]:getY(),
        p2x = p[2]:getX(),
        p2y = p[2]:getY(),
        p1r = p[1]:getRadius(),
        p2r = p[2]:getRadius()
    }
    
    return render(viewMain, val)
end

controllerTest = function()
    return string.format("p2 : vx = %.2f vy = %.2f", p[2]:getVx(), p[2]:getVy())
end

controllerScore = function(p)
    local val = {
        p = p:getName(),
        score = p:getPts()
    }
    return render(viewScore, val)
end