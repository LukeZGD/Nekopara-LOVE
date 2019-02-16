local stext
local c_a = {}
local c_a1 = {70,140,210}
local tspd
local tagtimer = 0

function cw(p1, stext, tag)
	if p1 == 'bl' then
		ct = ''
	elseif p1 then
		ct = p1
	else
		ct = 'Error'
	end
	
	if stext == nil then stext = '' end
	
	--auto add quotation marks
	if p1 ~= 'bl' then
		stext = '"'..stext..'"'
	end
	
	--text drip for scripts
	if tag == 'fast' then
		tspd = 250
	elseif tag == 'slow' then
		tspd = 25
	else
		tspd = settings.textspd
	end
	textx = dripText(stext,tspd,myTextStartTime)
	
	if textx == stext then gui_ctc_t = true
	else gui_ctc_t = false end
	
	--word wrap
	slen = string.len(textx)
	
	for i = 1, 3 do
		c_a[i] = string.find(stext, '%s', c_a1[i])
		if c_a[i] == nil then c_a[i] = c_a1[i] + 3 end
	end
	
	c_disp[1] = string.sub(textx, 1, c_a[1])
	for i = 2, 4 do
		if slen >= c_a[i-1] then
			c_disp[i] = string.sub(textx, c_a[i-1]+1, c_a[i])
		end
	end
	
	if tag then
		tagtimer = tagtimer + (settings.textspd / 100)
		if tagtimer >= (settings.textspd + slen) / 4 then
			if tag == 'nw' or tag == 'nwfast' then
				scriptJump(cl+1)
			end
			tagtimer = 0
			if autotimer > 0 then autotimer = 0.01 end
		end
	else
		tagtimer = 0
	end
end

function scriptCheck()
	c_disp = {'','','',''}
	textx = ''
	loadstring('ch'..chapter..'script()')()
end

function pause(t)
	textbox_enabled = false
	autotimer = 0
	autoskip = 0
	local dt = love.timer.getDelta()
	tagtimer = tagtimer + dt
	if tagtimer >= t then
		scriptJump(cl+1)
		tagtimer = 0
		textbox_enabled = true
	end
end

function scriptJump(nu, fu, au)
	xaload = -1
	if nu then cl = nu end
	if au then
		autotimer = au
		autoskip = au
	end
	if fu and fu ~= '' then
		loadstring(fu..'()')()
	end		
end