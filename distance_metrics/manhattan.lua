-----------------------------------------------------------------------------------------
--
-- manhattan.lua
--
-- module that handles manhattan distance metric
--
-----------------------------------------------------------------------------------------

local general_functions = require ( 'general_functions' )

-- Formula:  |x2 - x1| + |y2 - y1|

function manhattan (x1, y1, x2, y2)
    c1 = math.abs(x2 - x1)
    c2 = math.abs(y2 - y1)
    output = c1 + c2
    return output
end

function manhattan_table(user_value_x, user_value_y, data_table)
    output_table = {}

    for k,v in ipairs(data_table) do
        _x = v.x
        _y = v.y
        _outcome = v.o  
        _man = manhattan(_x, _y, user_value_x, user_value_y)

        output_table[ #output_table +1 ] = { x = _x , y = _y , outcome = _outcome, man = _man}
    end

    return output_table
end

-- Test Eucledian Function

local function test_manhattan ()
    print (" ------------ Manhattan Function Test Running ----------- ")
    print ('1 -' .. ' a: ' .. manhattan(0,0,0,0) .. ' expected: 0') 
    print ('2 -' .. ' a: ' .. manhattan(1,1,2,1) .. ' expected: 1') 
    print ('3 -' .. ' a: ' .. manhattan(1,1,1,2) .. ' expected: 1') 
    print ('4 -' .. ' a: ' .. manhattan(4,3,4,5) .. ' expected: 2') 
    print ('5 -' .. ' a: ' .. manhattan(1,3,4,5) .. ' expected: 5') 
    print ('6 -' .. ' a: ' .. manhattan(3,3,4,5) .. ' expected: 3') 
    print ('7 -' .. ' a: ' .. manhattan(3,7,4,5) .. ' expected: 3')
    print ('8 -' .. ' a: ' .. manhattan(5,8,4,5) .. ' expected: 4')
    print ('9 -' .. ' a: ' .. manhattan(10,5,4,5) .. ' expected: 6') 

    local t = read_data_file()

    print (" ######## UNALTERED TABLE #######")
    print_table (t)
    local test_x = 4
    local test_y = 5
    local t_new = manhattan_table(test_x, test_y, t)
    print (" ######## UPDATED TABLE #######")
    print_table (t_new)
end

-- // UNCOMMENT TO TEST // 
-- test_manhattan()