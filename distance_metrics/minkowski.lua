-----------------------------------------------------------------------------------------
--
-- Minkowski.lua
--
-- module that handles Minkowski distance metric
--
-----------------------------------------------------------------------------------------

local general_functions = require ( 'general_functions' )

-- h √ (|Xi1-Xj2|^h + .. + |Xin-Xjm|^h)

-- We only consider distance between 2 points, number of attributes are only 2
-- (|X1 - X2|^h + |Y1 - Y2|^h) ^ 1/h
-- h : is the power applied to the function
-- h = 1 is manhattan while h = 2 is eucledian h = (max/very large int) is Chebyshev distance

function minkowski (x1, y1, x2, y2, h)
    -- h = h
    
    p1 = math.pow(math.abs(x1 - x2),h)
    p2 = math.pow(math.abs(y1 - y2),h)
    root = 1/h
    output = math.pow((p1 + p2),root)
    return output

end

function minkowski_table(user_value_x, user_value_y, _h, data_table)
    output_table = {}
    local h = _h
    for k,v in ipairs(data_table) do
        _x = v.x
        _y = v.y
        _outcome = v.o  
        _mink = minkowski(_x, _y, user_value_x, user_value_y, h)
        output_table[ #output_table +1 ] = { x = _x , y = _y , outcome = _outcome, mink = _mink}
    end

    return output_table
end

-- Test Minkowski Function

local function test_mink ()
    print (" ------------ Minkowski Function Test ----------- ")
    local h = 1
    print (" Minkowski Power Set to: " .. h)
    print ('1 -' .. ' a: ' .. minkowski(0,0,0,0,h) .. ' expected: 0') -- 0
    print ('2 -' .. ' a: ' .. minkowski(1,2,3,5,h) .. ' expected: 5') -- 1
    local h = 2
    print (" Minkowski Power Set to: " .. h)
    print ('3 -' .. ' a: ' .. minkowski(1,2,3,5,h) .. ' expected: 3.61') -- 1
    local h = 3
    print (" Minkowski Power Set to: " .. h)
    print ('4 -' .. ' a: ' .. minkowski(1,2,3,5,h) .. ' expected: 3.271') -- 1
    local h = 40
    print (" Minkowski Power Set to: " .. h)
    print ('5 -' .. ' a: ' .. minkowski(1,2,3,5,h) .. ' expected: 3.0007') -- 1

    local t = read_data_file()

    print (" ######## UNALTERED TABLE #######")
    print_table (t)
    local test_x = 3
    local test_y = 5
    local h = 3
    print (" local h power : " .. h)
    local t_new = minkowski_table(test_x, test_y, h, t)
    print (" ######## UPDATED TABLE #######")
    print_table (t_new)
end

-- // UNCOMMENT TO TEST // 
-- test_mink()