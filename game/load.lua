local l_timer = 94

function updateLoad()
	if l_timer < 100 then
		l_timer = l_timer + 1
	end
	
	--loading assets
	if l_timer == 95 then
		GenJyuuGothicX_Medium = lg.newFont('data.xp3/main/GenJyuuGothicX-Medium.ttf',22)
		--SourceHanSansCN_Bold = lg.newFont('data.xp3/main/SourceHanSansCN-Bold.otf',22)
		lg.setFont(GenJyuuGothicX_Medium)
		
	elseif l_timer == 96 then
		
	elseif l_timer == 97 then
		sfx_sys = {}
		sfx_sys[1] = love.audio.newSource('data.xp3/sound/sysse/sysse_ok.ogg', 'static')
		--sfx_sys[2] = love.audio.newSource('data.xp3/sound/sysse/sysse_select.ogg', 'static')
		sfx_sys[3] = love.audio.newSource('data.xp3/sound/sysse/sysse_cancel.ogg', 'static')
		
	elseif l_timer == 98 then
		ui = {}
		ui.config_bg = lg.newImage('images/ui/config_bg.png')
		ui.config_h = lg.newImage('images/ui/config_h.png')
		ui.exit_h = lg.newImage('images/ui/exit_h.png')
		ui.extra_h = lg.newImage('images/ui/extra_h.png')
		ui.load_h = lg.newImage('images/ui/load_h.png')
		ui.start_h = lg.newImage('images/ui/start_h.png')
		ui.saveload_bg = lg.newImage('images/ui/saveload_bg.png')
		ui.load_bg = lg.newImage('images/ui/load_bg.png')
		ui.save_bg = lg.newImage('images/ui/save_bg.png')
		ui.window = lg.newImage('images/ui/window.png')
		
	elseif l_timer == 100 then
		if love.filesystem.getInfo('settings.sav') then
			loadsettings()
			game_setvolume()
		else
			savesettings()
		end
		changeState('splash')
	end
end