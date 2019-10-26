-----------------------------------------------------------------------------------------
--
-- training_data.lua
--
-- module that includes the Training data in a Lua Compatible Table format
-- NOTE : only use this if file import fails
-- 
-----------------------------------------------------------------------------------------

-- imports
local general = require ( "general_functions" )

-- This is the sample data in Lua Form
training_data_table = {
    {x=4,y=3,output='a'},
    {x=1,y=3,output='a'},
    {x=3,y=3,output='a'},
    {x=3,y=7,output='a'},
    {x=7,y=4,output='a'},
    {x=4,y=1,output='a'},
    {x=6,y=5,output='a'},
    {x=5,y=6,output='a'},
    {x=3,y=7,output='a'},
    {x=6,y=2,output='a'},
    {x=4,y=6,output='b'},
    {x=4,y=4,output='b'},
    {x=5,y=8,output='b'},
    {x=7,y=8,output='b'},
    {x=5,y=6,output='b'},
    {x=10,y=5,output='b'},
    {x=7,y=6,output='b'},
    {x=4,y=10,output='b'},
    {x=9,y=7,output='b'},
    {x=5,y=4,output='b'},
    {x=8,y=5,output='b'},
    {x=6,y=6,output='b'},
    {x=7,y=4,output='b'},
    {x=8,y=8,output='b'}
}


-- printTable(training_data_table,0)


print('============ Training Data Loaded ===============')
output = "Training Data Initialised from Lua,\n check console"
display.newText( output, 150, 30, Arial )
printTable(training_data_table)