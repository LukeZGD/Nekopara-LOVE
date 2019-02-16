local audio_bgmvolc = 1
bgco = {x=0,y=0,oldx=0,oldy=0,scale=1}
cgco = {x=0,y=0,oldx=0,oldy=0,scale=1}

function getrandom_call()
	local random_call = love.math.random(1,7)
	local getcall
	if random_call == 1 then
		getcall = "azu"
	elseif random_call == 2 then
		getcall = "bani"
	elseif random_call == 3 then
		getcall = "koko"
	elseif random_call == 4 then
		getcall = "mei"
	elseif random_call == 5 then
		getcall = "shina"
	elseif random_call == 6 then
		getcall = "sigu"
	elseif random_call == 7 then
		getcall = "syo"
	end
	return getcall
end

function changeState(cstate,x)
	menu_alpha = 0
	menu_previous = nil
	if cstate ~= 'title' then 
		require(cstate)
	end
	
	local spcall = getrandom_call()
	if cstate == 'splash' then
		brandlogo = lg.newImage('data.xp3/image/brandlogo.png')
		title_bg = lg.newImage('images/title_bg.png')
		alpha = 0
		splash_call = {}
		splash_call[1] = love.audio.newSource('voice.xp3/コール音声/NEKO_WORKs/'..spcall..'_call_0001.ogg','static')
		
		
	elseif cstate == 'title' then
		splash_call[2] = love.audio.newSource('voice.xp3/コール音声/NEKOPARA/'..spcall..'_call_0003.ogg','static')
		alpha = 0
		menu_enable('title')
		splash_call[2]:play()
		if audio1 ~= 'bgm_title' then
			audioUpdate('bgm_title')
		end
		
	elseif cstate == 'game' and x == 1 then --new game
		cl = 1
		chapter = 1
	elseif cstate == 'game' and x == 2 then --load game
		loadgame()
	elseif cstate == 'game' and x == 3 then --change state to game from poemgame
		cl = cl + 2
	end
	
	--load game state and scripts
	if cstate == 'game' or cstate == 'newgame' then	
		--hideAll()
		alpha = 255
		--loadAll()
		bgUpdate(bg1, 'forceload')
		audioUpdate(audio1, 'forceload')
		cgUpdate(cg1, 'forceload')
		menu_enabled = false
		textbox_enabled = true
		xaload = -1
		require('01_01')
	end
	
	state = cstate
end

function timerCheck()
	local dt = love.timer.getDelta()
	if xaload == 0 then
		myTextStartTime = love.timer.getTime()
	end
	xaload = xaload + 1
end

function bgUpdate(bgx,type,arg1,arg2,arg3) --background changes
	if xaload == 0 or type == 'forceload' then
		if autoskip == 0 and type ~= 'forceload' then bgch2 = bgch end
		bgch = nil
		bgch = lg.newImage(bgx..'.png')
	end
	if type == 'bgco' then
		if not arg2 then arg2 = arg1 end
		if not arg3 then arg3 = 1 end
		bgco.oldx = bgco.x
		bgco.oldy = bgco.y
		bgco.x = arg1
		bgco.y = arg2
		bgco.scale = arg3
	end
	bg1 = bgx
end

function cgUpdate(cgx,type,arg1,arg2,arg3) --cg changes
	if cg1 ~= cgx or type == 'forceload' then
		if autoskip == 0 and type ~= 'forceload' then cgch2 = cgch end
		cgch = nil
		cgch = lg.newImage(cgx..'.png')
	end
	if type == 'cgco' then
		arg1 = cgco.x
		arg2 = cgco.y
		arg3 = cgco.scale
	end
	cg1 = cgx
end

function audioUpdate(audiox, arg1) --audio changes
	if (audio1 ~= audiox and audiox ~= 'volchange') or arg1 == 'forceload' then
		if audio_bgm then audio_bgm:stop() end
		audio_bgm = nil
		if audiox ~= '' and audiox ~= '0' then
			audio_bgmvolc = nil
			audio_bgm = love.audio.newSource('data.xp3/bgm/'..audiox..'.ogg', 'stream')
			audio_bgm:setLooping(true)
			audio_bgm:setVolume(settings.bgmvol)
			audio_bgm:play()
		end
		audio1 = audiox
	elseif audiox == 'volchange' then
		audio_bgmvolc = arg1
		audio_bgm:setVolume((settings.bgmvol*audio_bgmvolc)/100)
	end
end

function sfxplay(sfx) --sfx stuff
	if xaload == 0 then
		if sfxp then sfxp:stop() end
		sfxp = nil
		if sfx ~= '' then
			sfxp = love.audio.newSource('data.xp3/sound/'..sfx..'.ogg', 'static')
		end
		sfxp:setVolume(settings.sfxvol)
		sfxp:play()
	end
end

function voiceplay(svoice)
	if xaload == 0 then
		if voice then voice:stop() end
		voice = nil
		if svoice ~= '' then
			voice = love.audio.newSource('voice.xp3/'..svoice..'.ogg', 'static')
		end
		voice:setVolume(settings.vocvol)
		voice:play()
	end
end

function game_setvolume()
	if audio_bgm then
		audio_bgm:setVolume((settings.bgmvol*audio_bgmvolc)/100)
	end
	sfx_sys[1]:setVolume(settings.sfxvol/100)
	--sfx_sys[2]:setVolume(settings.sfxvol/100)
	sfx_sys[3]:setVolume(settings.sfxvol/100)
	if sfxp then sfxp:setVolume(settings.sfxvol) end
	if voice then voice:setVolume(settings.vocvol) end
end