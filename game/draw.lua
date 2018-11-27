lg = love.graphics
local ypsc={585,615,645,675}

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
		--shadow
		lg.setColor(67,33,0,alpha)
		lg.print(ct,272,532)
		for i = 1, 4 do
			lg.print(c_disp[i],272,ypsc[i]+2)
		end
		--main text
		lg.setColor(250,250,250,alpha)
		lg.print(ct,270,530)
		for i = 1, 4 do
			lg.print(c_disp[i],270,ypsc[i])
		end
	end
end