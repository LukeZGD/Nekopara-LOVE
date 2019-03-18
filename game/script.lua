local stext
local tspd
local tagtimer = 0
history = {}

function wrap(str, limit)
	local here = 1
	local function check(sp, st, word, fi)
		if fi - here > limit then
			here = st
			return "\n"..word
		end
	end
	return str:gsub("(%s+)()(%S+)()", check)
end

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
	if autoskip > 0 then
		tspd = 10000
	elseif tag == 'fast' then
		tspd = 250
	elseif tag == 'slow' then
		tspd = 25
	else
		tspd = settings.textspd
	end
	textx = dripText(stext,tspd,myTextStartTime)
	c_disp = wrap(textx,70)
	
	local temptext = wrap(stext,70)
	local temptext2 = ct..': '..temptext
	if history[1] ~= temptext and history[1] ~= temptext2 then
		for i = 30, 1, -1 do
			history[i] = history[i-1]
		end
		if style_edited then
			history[1] = ''
		elseif ct == '' then
			history[1] = temptext
		else
			history[1] = temptext2
		end
	end
	
	local slen = string.len(stext)
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