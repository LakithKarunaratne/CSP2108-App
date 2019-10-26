-----------------------------------------------------------------------------------------
--
-- main_menu.lua
--
-- module that handles main menu in composer
--
-----------------------------------------------------------------------------------------

local composer = require ('composer')
local widget = require( "widget" )

local screen_x_center = display.contentCenterX
local screen_y_center = display.contentCenterY
local screen_width = display.actualContentWidth
local screen_height = display.actualContentHeight

local scene = composer.newScene()

-- create 
function scene:create( event )
    local sceneGroup = self.view
    -- runs the initial code but has not appeared yet
end

-- show 
function scene:show( event )
    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then 
        -- off screen but about to come online

    elseif ( phase == "did" ) then
        -- code runs when entire screen is on

        print ("main menu screen open") -- Console Test
        
        -- ## CODE STARTS HERE ## --

        -- Function to handle button events
        local function openEuclead( event )
        
            if ( "ended" == event.phase ) then
                print( "Euclead was pressed and released" )
                composer.gotoScene( "eucleadScene", { effect="fade", time=200 } )
                composer.purgeScene("name_Of_The_Scene")
            end
        end

        -- Create the Buttons
        local eucleadButton = widget.newButton(
            {   
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
        
    
    end
end

-- hide 
function scene:hide( event )
    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then 
        -- on screen but about to go offline
        display.remove(interfaceDisplayGroup)
        interfaceDisplayGroup = nil

    elseif ( phase == "did" ) then
        -- code runs when offline
    end
end

-- destroy
function scene:destroy( event )
    local sceneGroup = self.view
    -- code here runs prior to termination
    
end

---- EVENT LISTNERS

scene:addEventListener( "create",scene )
scene:addEventListener( "show",scene )
scene:addEventListener( "hide",scene )
scene:addEventListener( "destroy",scene )

return scene