--default save values
settings = {textspd=100,autospd=4,bgmvol=0.5,sfxvol=1,vocvol=1}
cl = 1
bg1 = 'images/bk'
audio1 = '0'
cg1 = 'images/blank'
ct = ''
chapter = 1
savevalue = ''
savenumber = 1

function savegame(x)	
	local savedata = "cl="..cl.."\
bg1='"..bg1.."'\
audio1='"..audio1.."'\
cg1='"..cg1.."'\
ct='"..ct.."'\
chapter="..chapter.."\
bgco={x="..bgco.x..",y="..bgco.y..",scale="..bgco.scale.."}\
cgco={x="..cgco.x..",y="..cgco.y..",scale="..cgco.scale.."}"
	
	love.filesystem.write("save"..savenumber..".sav", savedata)
end

function loadgame(x)
	local savfile
	if global_os == 'LOVE-OneLua' then
		love.filesystem.load("save"..savenumber..".sav")
	else
		savfile = loadstring(love.filesystem.read("save"..savenumber..".sav"))
		savfile()
	end
end

function savesettings()
	local settingsfile = "settings={textspd="..settings.textspd..",autospd="..settings.autospd..",bgmvol="..settings.bgmvol..",sfxvol="..settings.sfxvol..",vocvol="..settings.vocvol.."}"
	love.filesystem.write("settings.sav", settingsfile)
end

function loadsettings()
	if global_os == 'LOVE-OneLua' then
		love.filesystem.load('settings.sav')
	else
		local settingsfile = loadstring(love.filesystem.read('settings.sav'))
		if pfile then pfile() end
		if settingsfile then settingsfile() end
	end
end