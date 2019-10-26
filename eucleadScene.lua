-----------------------------------------------------------------------------------------
--
-- eucleadScene.lua
--
-- module that contains all the functions used for Eucledian Measure
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
    -- composer.removeScene( "main_menu" )
    -- interfaceDisplayGroup:removeSelf()
    
end

-- show 
function scene:show( event )
    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then 
        -- off screen but about to come online
        
        

    elseif ( phase == "did" ) then
        -- code runs when entire screen is on

        print ("eculead screen open") -- Console Test
        
        -- LABELS 
        local label1 = display.newText("X :",75,150,nil,16)
        local label2 = display.newText("Y :",75,200,nil,16)
        local label3 = display.newText("Class :",63,100,nil,16)
        
        -- USER INPUTS
        -- X
        local numInputX
        local function textListener( event )
            if ( event.phase == "began" ) then
                -- User begins editing "numInputX"
            end
        end
         
        -- Create text field: x
        numInputX = native.newTextField( 200, 150, 180, 30 )
        numInputX.inputType = "number"
        numInputX:addEventListener( "userInputx", textListener )  
        
        -- Y
        local numInputY
        local function textListener( event )
            if ( event.phase == "began" ) then
                -- User begins editing "numInputX"
            end
        end
         
        -- Create text field: y
        numInputY = native.newTextField( 200, 200, 180, 30 )
        numInputY.inputType = "number"
        numInputY:addEventListener( "userInputx", textListener ) 

        -- Create Button

        local calculateButton = widget.newButton(
        {   
            height = 30,
            width = 100,
            top = 250,
            left = 110,
            id = "calculateButton",
            label = "Calculate",
            shape = "roundedRect",
            fillColor = { default={ 0.5,0.5,1.5,1 }, over={ 1, 0.2, 0.5, 1 } },
            onEvent = calculateEvent
        })
        local eucleadInputGroup = display.newGroup()
        eucleadInputGroup:insert(label1)
        eucleadInputGroup:insert(label2)
        eucleadInputGroup:insert(label3)
        eucleadInputGroup:insert(numInputX)
        eucleadInputGroup:insert(numInputY)
        eucleadInputGroup:insert(calculateButton)

        -- eucleadInputGroup.x = eucleadInputGroup.x + 10
        eucleadInputGroup.y = eucleadInputGroup.y + 200
        

    
    end
end

-- hide 
function scene:hide( event )
    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then 
        -- on screen but about to go offline

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