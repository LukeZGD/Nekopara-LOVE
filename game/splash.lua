local s_timer = 0

function drawSplash()
	if state == 'splash' then --splash1 (Brand Logo)
		if s_timer <= 1 then
			lg.setBackgroundColor(255,255,255)
		else
			lg.setBackgroundColor(0,0,0)
		end
		lg.setColor(255,255,255,alpha)
		lg.draw(brandlogo)
		
	elseif state == 'title' then --title (Title Screen)
		lg.setBackgroundColor(255,255,255)
		lg.setColor(255,255,255,alpha)
		lg.draw(title_bg)
		lg.setColor(64,64,64,alpha)
		lg.print('Unofficial port by LukeeGD',10,690)
		menu_draw()
	end
	lg.setColor(0,0,0,255)
end

function updateSplash(dt)
	--splash screen s_timer
	s_timer = s_timer + dt
	
	if state == 'splash' then
		if s_timer <= 1 then
			alpha = math.min(alpha+dt*1000,255)
		elseif s_timer >= 1 and s_timer <= 1.03 then
			splash_call[1]:play()
		elseif s_timer >= 1.5 and s_timer <= 1.53 then
			audioUpdate('bgm_title')
		elseif s_timer > 2  and s_timer < 3 then
			alpha = math.max(alpha-dt*1000,0)
		elseif s_timer >= 3 then
			changeState('title')
		end
	elseif state == 'title' then
		alpha = math.min(alpha+dt*500,255)
	end
end

function splash_keypressed(key)
	if key == 'a' then
		changeState('title')
	end
end