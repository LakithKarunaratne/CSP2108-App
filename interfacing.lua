-----------------------------------------------------------------------------------------
--
-- interfacing.lua
--
-- module that handles main menu
--
-----------------------------------------------------------------------------------------

local widget = require( "widget" )

local screen_x_center = display.contentCenterX
local screen_y_center = display.contentCenterY

-- Function to handle button events
local function openEuclead( event )
 
    if ( "ended" == event.phase ) then
        print( "Euclead was pressed and released" )
    end
end

-- Create the Buttons
local eucleadButton = widget.newButton(
    {   
        -- x = 10
        -- y = 10
        -- left = 100
        -- top = 50
        height = 50,
        width = 150,
        id = "eucleadButton",
        label = "Euclead",
        shape = "roundedRect",
        fillColor = { default={ 0.5,0.5,1.5,1 }, over={ 1, 0.2, 0.5, 1 } },
        onEvent = openEuclead
    }
)
eucleadButton.x = screen_x_center
eucleadButton.y = screen_y_center - 120

local manhattanButton = widget.newButton(
    {
        height = 50,
        width = 150,
        id = "manhattanButton",
        label = "Manhattan",
        shape = "roundedRect",
        fillColor = { default={ 0.5,0.5,1.5,1 }, over={ 1, 0.2, 0.5, 1 } },
        onEvent = openManhattan
    }
)
manhattanButton.x = screen_x_center 
manhattanButton.y = eucleadButton.y + 100

local minkButton = widget.newButton(
    {
        height = 50,
        width = 150,
        id = "minkButton",
        label = "Minkowski",
        shape = "roundedRect",
        fillColor = { default={ 0.5,0.5,1.5,1 }, over={ 1, 0.2, 0.5, 1 } },
        onEvent = openMink
    }
)
minkButton.x = screen_x_center 
minkButton.y = manhattanButton.y + 100 

-- add to display group

local interfaceDisplayGroup = display.newGroup()
interfaceDisplayGroup:insert(eucleadButton)
interfaceDisplayGroup:insert(manhattanButton)
interfaceDisplayGroup:insert(minkButton)
