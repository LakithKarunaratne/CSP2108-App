-----------------------------------------------------------------------------------------
--
-- Euclidean.lua
--
-- module that handles Euclidean distance metric
--
-----------------------------------------------------------------------------------------
local general_functions = require ( 'general_functions' )


-- √ ( (x1 - x2)^2 + (y1 - y2)^2 )

function euclid (x1, y1, x2, y2)
    c1 = math.pow((x1 - x2),2)
    c2 = math.pow((y1 - y2),2)
    output = math.sqrt (c1 + c2)
    return output
end

function eucledian_table(user_value_x, user_value_y, data_table)
    output_table = {}

    for k,v in ipairs(data_table) do
        _x = v.x
        _y = v.y
        _outcome = v.o  
        _euc = euclid(_x, _y, user_value_x, user_value_y)
        output_table[ #output_table +1 ] = { x = _x , y = _y , outcome = _outcome, euc = _euc}
    end

    return output_table
end

-- Test Eucledian Function

local function test_euclead ()
    print (" ------------ Eucleadian Function Test ----------- ")
    print ('1 -' .. ' a: ' .. euclid(0,0,0,0) .. ' expected: 0') -- 0
    print ('2 -' .. ' a: ' .. euclid(1,1,2,1) .. ' expected: 1') -- 1
    print ('3 -' .. ' a: ' .. euclid(1,1,1,2) .. ' expected: 1') -- 1
    print ('4 -' .. ' a: ' .. euclid(1,1,4,1) .. ' expected: 3') -- 3
    print ('5 -' .. ' a: ' .. euclid(1,1,1,4) .. ' expected: 3') -- 3
    print ('6 -' .. ' a: ' .. euclid(3,2,1,4) .. ' expected: 2.828') -- 2.828

    local t = read_data_file()

    print (" ######## UNALTERED TABLE #######")
    print_table (t)
    local test_x = 4
    local test_y = 5
    local t_new = eucledian_table(test_x, test_y, t)
    print (" ######## UPDATED TABLE #######")
    print_table (t_new)
end

-- // UNCOMMENT TO TEST // 
-- test_euclead()