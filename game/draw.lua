lg = love.graphics

changeX = {}
for i = 1, 7 do
	changeX[i] = {x=0,y=0,z=0}
end
unitimer = 0
uniduration = 0.25

--compatiblity for LOVE 11 and above
local lgsetColor = lg.setColor
function lg.setColor(...)
	local args = {...}
	local ver = love.getVersion()
	if ver >= 11 then
		for i = 1, #args do
			if args[i] > 0 then
				args[i] = args[i] / 255
			end
		end
	end
	lgsetColor(args[1],args[2],args[3],args[4])
end

local lgdraw = lg.draw
function lg.draw(drawable, ...)
	local args = {...}
	if drawable then
		lgdraw(drawable,args[1],args[2],args[3],args[4],args[5])
	end
end

function outlineText(text,x,y,type,arg1)
	local addm = 1.5
	lg.setColor(67,33,0,alpha)
	lg.print(text,x-addm,y)
	lg.print(text,x,y-addm)
	lg.print(text,x+addm,y)
	lg.print(text,x,y+addm)
	lg.setColor(255,255,255,alpha)
	lg.print(text,x,y)
end

function dripText(text,charactersPerSecond,startTime)
	currentTime = love.timer.getTime()
	if (currentTime <= startTime) or startTime == 0 then return '' end
	if currentTime > startTime then myTextStartTime2 = love.timer.getTime() end
	if charactersPerSecond == nil then charactersPerSecond = 100 end
	return text:sub(1,math.min(math.floor((currentTime-startTime)*charactersPerSecond),text:len()))
end

function easeQuadOut(t,b,c,d)
	t = t / d
	return -(c) * t*(t-2) + b
end

function easeQuadInOut(t,b,c,d)
	t = t/(d/2)
	if (t < 1) then
		return c/2*t*t + b
	else
		return -c/2 * ((t-1) * (t-3) - 1) + b
	end
end
	
function easeCubicInOut(t,b,c,d)
	t = t/(d/2)
	if (t < 1) then
		return c/2*t*t*t + b
	else
		t = t - 2
		return c/2*(t*t*t + 2) + b
	end
end

function fadeOut(x)
	alpha = math.max(alpha - dt*1000, 0)
	if alpha == 0 then
		if x == 1 then
			changeState('')
		end
	end
end

function drawTextBox()
	if textbox_enabled and not menu_enabled and c_disp then
		lg.setColor(255,255,255,alpha/2.5)
		lg.draw(ui.window,0,520)
		outlineText(ct,270,530)
		outlineText(c_disp,270,585)
	end
end

function setCharacter(char)
	local set
	local chset
	local num
	if char == 'syo' then
		num = 1
	elseif char == 'bani' then
		num = 2
	elseif char == 'azu' then
		num = 3
	elseif char == 'mei' then
		num = 4
	elseif char == 'shina' then
		num = 5
	elseif char == 'koko' then
		num = 6
	elseif char == 'sigu' then
		num = 7
	end
	set = save_Set[num]
	chset = changeX[num]
	return set, chset
end

function updateCharacter(char,a,b,px,py,sx)
	local set, chset = setCharacter(char)
	
	if not b then b = '' end
	if not sx then sx = 1 end
	set.a = a
	set.b = b
	set.sx = sx
	
	if px and xaload == 0 then
		set.x = px
		--[[
		chset.x = set.x
		chset.y = px*3.2
		if chset.x < chset.y then
			chset.z = chset.y - chset.x
		elseif chset.x > chset.y then
			chset.z = chset.x - chset.y
		else
			chset.z = 0
		end
		]]
	end
	if py then set.y = py end
end

function hideCharacter(char)
	local set, chset = setCharacter(char)

	if xaload == 0 then
		set.x = -675
		--[[
		chset.x = set.x
		chset.y = -675
		chset.z = chset.x - chset.y
		]]
	end
end

function drawCharacters()
	for i, j in ipairs(save_Set) do
		if j.a and j.a == '' then
			j.draw = nil
		elseif j.a and j.a ~= '' and not j.draw then
			j.draw = lg.newImage(j.a)
		elseif j.draw then
			lg.draw(j.draw,j.x,j.y)
		end
	end
end