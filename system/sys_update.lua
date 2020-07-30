screen.clear()

eventHover(0, 0, svgWidth / 2, svgHeight, function(mX, mY)
    p[1]:setCoord(mX, mY)
end)

eventHover(svgWidth / 2, 0, svgWidth / 2, svgHeight, function(mX, mY)
    p[2]:setCoord(mX, mY)
end)

ball:update()

result = controllerMain()
screen.setHTML(result)