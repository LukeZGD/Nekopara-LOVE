local skipspeed = 4
local bgalpha = 255
local cgalpha = 255
local textboxd = true

function drawGame()
	lg.setBackgroundColor(0,0,0)
	
	lg.setColor(255,255,255,alpha)
	lg.draw(bgch,bgco.x,bgco.y)
	lg.draw(cgch,cgco.x,cgco.y)
	lg.setColor(255,255,255,bgalpha)
	lg.draw(bgch2,bgco.oldx,bgco.oldy)
	lg.setColor(255,255,255,cgalpha)
	lg.draw(cgch2,cgco.oldx,cgco.oldy)
	
	drawCharacters()
	
	if textboxd then
		drawTextBox()
	end
	
	outlineText(cl,5,690)
	if autotimer > 0 then
		outlineText('Auto-Mode On',5,35)
	elseif autoskip > 0 then
		local skiptext
		if sectimer >= 0.75 then
			skiptext = 'Skipping >>>'
		elseif sectimer >= 0.5 then
			skiptext = 'Skipping >>'
		elseif sectimer >= 0.25 then
			skiptext = 'Skipping >'
		else
			skiptext = 'Skipping'
		end 
		outlineText(skiptext,5,35)
	end
	if menu_enabled then menu_draw() end
end

function updateGame(dt)
	scriptCheck()
	timerCheck()
	
	if bgch2 then
		bgalpha = math.max(bgalpha - dt*500, 0)
		if bgalpha == 0 then
			bgalpha = 255
			bgch2 = nil
		end
	end
	
	if cgch2 then
		cgalpha = math.max(cgalpha - dt*500, 0)
		if cgalpha == 0 then
			cgalpha = 255
			cgch2 = nil
		end
	end
	
	--auto next script
	if autotimer == 0 then
		autotimer = 0
	elseif autotimer <= settings.autospd then
		autotimer = autotimer + dt
	elseif autotimer >= settings.autospd then
		game_keypressed('a')
		autotimer = 0.01
	end
	
	if not menu_enabled then
		if autoskip > 0 and autoskip < skipspeed then
			autoskip = autoskip + 1
		elseif autoskip >= skipspeed then
			game_keypressed('a')
			autoskip = 1
		end
	end
end

function game_keypressed(key)
	if key == 'y' then --pause menu
		sfx_sys[1]:play()
		autotimer = 0
		menu_enable('pause')
	elseif key == 'b' then --auto on/off
		sfx_sys[1]:play()
		if autotimer == 0 then autotimer = 0.01 else autotimer = 0 end		
	elseif key == 'x' then
		sfx_sys[1]:play()
		if autoskip < 1 then autoskip = 1
		elseif autoskip > 0 then autoskip = 0 end
	elseif key == 'a' or key == 'l' or key == 'lbutton' then
		cl = cl + 1 --next script
		xaload = 0
		unitimer = 0
		collectgarbage()
		collectgarbage()
	elseif key == 'r' or key == 'rbutton' then
		scriptJump(cl)
	elseif key == 'select' or key == 'z' then
		textboxd = not textboxd
	end
end