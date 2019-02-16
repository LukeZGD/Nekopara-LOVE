local menu_items
local cX
local cY
local getcompare = {}
local pagenum = 1
local savenum = {}
local itemnames = {}
local saveindicator = {}
local chch
local cpick
local menu_fadeout
local menu_mtimer = 0
menu_alpha = 0

function menu_enable(m)
	menu_enabled = true
	menu_type = m
	
	if menu_type == 'savegame' or menu_type == 'loadgame' then
		itemnames = {}
		for i = 1, 6 do
			if pagenum > 1 then	
				chch = ((pagenum-1)*6)+i
			else
				chch = i
			end
			savenum[i] = chch
			itemnames[i] = 'Save File '..chch
			if love.filesystem.getInfo('save'..chch..'.sav') then
				saveindicator[i] = 1
			else
				saveindicator[i] = 0
			end
		end
	end
	
	if menu_type == 'mainyesno' then
		menutext = 'Are you sure you want to return to the title screen?'
		itemnames = {'Yes','No'}
		
	elseif menu_type == 'quityesno' then
		menutext = 'Are you sure you want to exit the game?'
		itemnames = {'Yes','No'}
	
	elseif menu_type == 'title' then
		menutext = ''
		itemnames = {'','','','',''}
		
	elseif menu_type == 'settings' then
		menutext = ''
		itemnames = {'Text Speed','Auto-Mode Speed','BGM Volume','SFX Volume','Voice Volume','Save Settings'}
	
	elseif menu_type == 'pause' then
		menutext = 'Game Menu'
		itemnames = {'Backlog','Save','Load','Title','Config','Exit','Return'}
		
	else
		menutext = ''
	end
	
	if menu_type == 'choice' then
		menu_items = #choices + 1
	else
		menu_items = #itemnames + 1
	end
	
	m_select(2)
end

function menu_draw()
	lg.setColor(255,255,255,menu_alpha)
	
	if menu_type == 'title' then
		lg.setColor(255,255,255)
		if m_selected == 2 then
			lg.draw(ui.start_h)
		elseif m_selected == 3 then
			lg.draw(ui.load_h)
		elseif m_selected == 4 then
			lg.draw(ui.config_h)
		elseif m_selected == 5 then
			lg.draw(ui.extra_h)
		elseif m_selected == 6 then
			lg.draw(ui.exit_h)
		end
		
	else
		lg.draw(ui.saveload_bg)
		
		lg.setColor(255,255,255,menu_alpha)
		if menu_type == 'settings' then
			lg.draw(ui.config_bg)
		elseif menu_type == 'savegame' or menu_type == 'loadgame' then
			if menu_type == 'savegame' then
				lg.draw(ui.save_bg)
			else
				lg.draw(ui.load_bg)
			end
		end
		lg.setColor(0,0,0,menu_alpha)
		lg.print('>',cX,cY)
		lg.print(menutext,140,90)
	end
	
	for i = 1, 8 do
		if menu_items >= i+1 and itemnames[i] then lg.print(itemnames[i],160,110+(50*i)) end
	end
	
	if menu_type == 'settings' then
		if menu_type == 'settings' then
			lg.print(settings.textspd, 410, 160)
			lg.print('(<)',380,160)
			lg.print('(>)',460,160)
			lg.print(settings.autospd..' sec.',410, 210)
			lg.print('(<)',380,210)
			lg.print('(>)',480,210)
			lg.print(settings.bgmvol*100,410, 260)
			lg.print('(<)',380,260)
			lg.print('(>)',460,260)
			lg.print(settings.sfxvol*100,410, 310)
			lg.print('(<)',380,310)
			lg.print('(>)',460,310)
			lg.print(settings.vocvol*100,410, 360)
			lg.print('(<)',380,360)
			lg.print('(>)',460,360)
		end
		lg.print('Press (<) and (>) to change settings.',140,580)
		
	elseif menu_type == 'savegame' or menu_type == 'loadgame' then
		lg.print('Page '..pagenum..' of 10 (<L - R>)',160,90)
		for i = 1, 6 do
			if saveindicator[i] == 1 then
				lg.setColor(0,255,0)
			else
				lg.setColor(255,0,0)
			end
			lg.rectangle('fill',310,120+(50*i),9,9)
		end
		
	elseif menu_type == 'help' then
		local keys = {}
		if global_os == 'LOVE-OneLua' then
			keys = {'Cross','Circle','Square','Triangle'}
		else
			keys = {'A','B','X','Y'}
		end
		lg.setColor(0,0,0)
		lg.print('Key Bindings:',160,120)
		lg.print(keys[1]..' - Advances through the game',160,160)
		lg.print(keys[2]..' - Exit Menu, Auto On/Off',160,190)
		lg.print(keys[3]..' - Skip On/Off',160,220)
		lg.print(keys[4]..' - Enter Game Menu',160,250)
		
	elseif menu_type == 'history' then
		lg.setColor(0,0,0)
		lg.print(cl,160,120)
		local c_disp_y = {185,215,245,275}
		lg.print(ct,250,150)
		if c_disp and global_os == 'LOVE-OneLua' then
			for i = 1, 4 do
				lg.print(c_disp[i],250,c_disp_y[i])
			end
		else
			lg.printf(textx,250,185,775)
		end
	end
end

function menu_update(dt)
	if menu_fadeout then
		menu_alpha = math.max(menu_alpha - dt*1000, 0)
		if menu_alpha == 0 then
			menu_enabled = false
			menu_previous = nil
			menu_fadeout = false
		end
	else
		menu_alpha = math.min(menu_alpha + dt*1000, 255)
	end
end

function menu_confirm()
	sfx_sys[1]:play()
	
	if menu_type == 'title' then --title screen options
		menu_previous = 'title'
		
		if m_selected == 2 then
			changeState('game',1)
			menu_previous = nil
		elseif m_selected == 3 then
			pagenum = 1
			menu_enable('loadgame')
		elseif m_selected == 4 then
			pagenum = 1
			menu_enable('settings')
		elseif m_selected == 5 then
			--menu_enable('help')
		elseif m_selected == 6 then
			love.event.quit()
		end
		
	elseif menu_type == 'loadgame' then --load game confirm
		savenumber = savenum[m_selected-1]
		if love.filesystem.getInfo('save'..savenumber..'.sav') then
			changeState('game',2)
		end
		
	elseif menu_type == 'savegame' then  --save game confirm 
		savenumber = savenum[m_selected-1]
		savegame()
		menu_enable(menu_previous)
	
	elseif menu_type == 'pause' then --pause menu options
		menu_previous = menu_type
		if m_selected == 2 then
			--menu_enable('history')
		elseif m_selected == 3 then
			pagenum = 1
			menu_enable('savegame')
		elseif m_selected == 4 then
			pagenum = 1
			menu_enable('loadgame')
		elseif m_selected == 5 then
			menu_enable('mainyesno')
		elseif m_selected == 6 then
			pagenum = 1
			menu_enable('settings')
		elseif m_selected == 7 then
			menu_enable('quityesno')
		elseif m_selected == 8 then
			menu_fadeout = true
		end
		
	elseif menu_type == 'mainyesno' then
		if m_selected == 2 then
			changeState('title')
		elseif m_selected == 3 then
			menu_enable('pause')
		end
		
	elseif menu_type == 'quityesno' then
		if m_selected == 2 then
			love.event.quit()
		elseif m_selected == 3 then
			menu_enable(menu_previous)
		end
		
	elseif menu_type == 'settings' then
		if m_selected <= 3 then
			menu_keypressed('left')
		elseif m_selected == 7 then
			savesettings()
			game_setvolume()
			menu_enable(menu_previous)
		end
	end
end

function m_select(arg)
	if arg then m_selected = arg end
	cpick = itemnames[m_selected-1]
	cX = 135
	cY = 110+(50*(m_selected-1))
end

function menu_keypressed(key)
	if key == 'down' then
		--sfx_sys[2]:play()
		if m_selected <= menu_items-1 then
			m_selected = m_selected + 1
		else
			m_selected = 2
		end
		m_select()
		
	elseif key == 'up' then
		--sfx_sys[2]:play()
		if m_selected >= 3 then
			m_selected = m_selected - 1
		else
			m_selected = menu_items
		end
		m_select()
		
	elseif key == 'a' then
		menu_confirm()
		
	elseif key == 'b' then
		sfx_sys[3]:play()
		if menu_type == 'pause' then
			menu_fadeout = true
		elseif menu_type ~= 'title' and menu_type ~= 'pause' then
			menu_enable(menu_previous)
		end
		menu_previous = nil
		
	elseif key == 'left' then
		if menu_type == 'settings' and m_selected <= 6 then
			if cpick == 'Text Speed' then
				if settings.textspd > 250 then
					settings.textspd = 250
				elseif settings.textspd > 50 then
					settings.textspd = settings.textspd - 25
				end
			elseif cpick == 'Auto-Mode Speed' and settings.autospd > 1 then
				settings.autospd = settings.autospd - 1
				
			elseif cpick == 'BGM Volume' and settings.bgmvol > 0 then
				settings.bgmvol = settings.bgmvol - 0.1
				
			elseif cpick == 'SFX Volume' and settings.sfxvol > 0 then
				settings.sfxvol = settings.sfxvol - 0.1
				
			elseif cpick == 'Voice Volume' and settings.vocvol > 0 then
				settings.vocvol = settings.vocvol - 0.1
				
			end
		end
		
	elseif key == 'right' then
		if menu_type == 'settings' and m_selected <= 6 then
			if cpick == 'Text Speed' and settings.textspd < 250 then
				settings.textspd = settings.textspd + 25
				
			elseif cpick == 'Auto-Mode Speed' and settings.autospd < 15 then
				settings.autospd = settings.autospd + 1
				
			elseif cpick == 'BGM Volume' and settings.bgmvol < 1 then
				settings.bgmvol = settings.bgmvol + 0.1
				
			elseif cpick == 'SFX Volume' and settings.sfxvol < 1 then
				settings.sfxvol = settings.sfxvol + 0.1
				
			elseif cpick == 'Voice Volume' and settings.vocvol < 1 then
				settings.vocvol = settings.vocvol + 0.1
			end
		end
	
	elseif key == 'lbutton' or key == 'l' then
		if (menu_type == 'savegame' or menu_type == 'loadgame' or menu_type == 'settings') and pagenum > 1 then
			pagenum = pagenum - 1
			menu_enable(menu_type)
		end
		
	elseif key == 'rbutton' or key == 'r' then
		if ((menu_type == 'savegame' or menu_type == 'loadgame') and pagenum < 10) or (menu_type == 'settings' and pagenum < 2) then
			pagenum = pagenum + 1
			menu_enable(menu_type)
		end
	end
end