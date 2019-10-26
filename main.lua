-----------------------------------------------------------------------------------------
--
-- main.lua
-- Author : Lakith Karunaratne
-- CSP2108 Assignment
-- 
-----------------------------------------------------------------------------------------
local composer = require ("composer")

-- local general_functions = require ( 'interfacing' )
-- local general_functions = require ( 'general_functions' )
-- local eucledian = require ( 'distance_metrics\\eucledian' )
-- local manhattan = require ( 'distance_metrics\\manhattan' )
-- local manhattan = require ( 'distance_metrics\\minkowski' )

local screen_x_center = display.contentCenterX
local screen_y_center = display.contentCenterY
local screen_width = display.actualContentWidth
local screen_height = display.actualContentHeight


-- scene loading options
-- local options = {
--     effect = "fade",
--     time = 1000,
--     params = {
--         sceneNumber = 1
--     }
-- }


-- load first screen
composer.gotoScene( "main_menu", { effect="fade", time=200 } )
