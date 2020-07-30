-- init

bound = 1

svgWidth = 1024
svgHeight = 612

render = function(view, tabVal)
    local rep = ''
    for k, v in pairs(tabVal) do
        rep = '{{'..k..'}}'
        view = string.gsub(view, rep, v)
    end
    return view
end

eventClick = function(x, y, w, h, callback, antiBound) -- fait un side effect sur bound
    local mX = svgWidth * screen.getMouseX()
    local mY = svgHeight * screen.getMouseY()
    antiBound = antiBound or true
    
    if (screen.getMouseState() == 1 and mX >= x and mX <= x + w and mY >= y and mY <= y + h) then
        if (antiBound == true) then
            if (bound == 1) then
                bound = (bound == 1) and 0 or 1
                callback(mX, mY)
            end
        else
            callback(mX, mY)
        end
    else
        if (antiBound == true and bound == 0) then
            bound = (bound == 1) and 0 or 1
        end
    end
end

eventHover = function(x, y, w, h, callback)
    local mX = svgWidth * screen.getMouseX()
    local mY = svgHeight * screen.getMouseY()
    
    if (mX >= x and mX <= x + w and mY >= y and mY <= y + h) then
        callback(mX, mY)
    end
end

switch = function(test, acc)
    test = test or nil
    acc = acc or nil
    
    return {
        case = function(val, act) return switch(test, (val == test) and act() or acc) end,
        plage = function(val1, val2, act) return switch(test, (test >= val1 and test <= val2) and act() or acc) end,
        default = function(act) return (acc == nil) and act() or acc end
    }
end