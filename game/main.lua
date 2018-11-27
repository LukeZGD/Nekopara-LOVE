require 'draw'
require 'resources'
require 'menu'
require 'saveload'
require 'script'

function love.load()
	lg.setBackgroundColor(0,0,0)
	myTextStartTime = love.timer.getTime()
	autotimer = 0
	autoskip = 0
	sectimer = 0
	xaload = 0
	alpha = 255
	menu_enabled = false
	
	--os detection
	global_os, g_system = love.system.getOS()
	if g_system ~= 'Switch' and global_os ~= 'LOVE-OneLua' then
		love.window.setMode(1280, 720)
		love.window.setTitle('Nekopara Vol. 1')
		love.keyboard.setTextInput(false)
	end
	
	changeState('load')
end

function love.draw()
	if state == 'splash' or state == 'title' then --title (Title Screen)
		drawSplash()
	elseif state == 'game' then --game (Ingame)
		drawGame()
	end
end

function love.update(dt)
	sectimer = sectimer + dt
	if sectimer >= 1 then sectimer = 0 end
	
	--update depending on gamestate
	if state == 'load' then
		updateLoad(dt)
	elseif state == 'splash' or state == 'title' then
		updateSplash(dt)
	elseif state == 'game' or state == 'newgame' then
		updateGame(dt)
	end
	if menu_enabled then
		menu_update(dt)
	end
end

function love.keypressed(key)
	if menu_enabled ~= true then
		if state == 'game' and textbox_enabled then
			game_keypressed(key)
		end
	elseif menu_enabled then
		menu_keypressed(key)
	end
end

function love.gamepadpressed(joy, button)
	if button == 'dpup' then
		button = 'up'
	elseif button == 'dpdown' then
		button = 'down'
	elseif button == 'dpleft' then
		button = 'left'
	elseif button == 'dpright' then
		button = 'right'
	end
	love.keypressed(button)
end