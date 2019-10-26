-- This is to Graph the Contents into the Lua

-- display.newCircle( [parent,] xCenter, yCenter, radius )
-- display.newRect( [parent,] x, y, width, height )
-- display.newGroup()

-- function newDataPoint(x, y, def)
--     local temp = display.newCircle( x, y, 3 )
--     if (def == 1) then
--         temp:setFillColor( blue )
--     else
--         temp:setFillColor( yellow )
--     end
--     return temp;
-- end


function chart_background()
    local paint = { red }
    local rect = display.newRect( 200, 300, 300, 300 )
    rect.fill(paint)
end

local temp = chart_background() 

-- for each value, data point must go into the group

