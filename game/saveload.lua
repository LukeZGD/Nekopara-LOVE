--default save values
local save_Set_temp = {a="",b="",px=0,py=0,sx=1}
save_Set = {}
for i = 1,7 do
	save_Set[i] = save_Set_temp
end
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
	local save_Set_data = "\nsave_Set={"
	for i = 1, 7 do
		save_Set_data = save_Set_data.."\n{a='"..save_Set[i].a.."',\n"
		save_Set_data = save_Set_data.."b='"..save_Set[i].b.."',\n"
		save_Set_data = save_Set_data.."px="..save_Set[i].px..",\n"
		save_Set_data = save_Set_data.."py="..save_Set[i].py..",\n"
		save_Set_data = save_Set_data.."sx="..save_Set[i].sx.."\n},"
	end
	save_Set_data = save_Set_data.."\n}"
	
	local savedata = "cl="..cl.."\
bg1='"..bg1.."'\
audio1='"..audio1.."'\
cg1='"..cg1.."'\
ct='"..ct.."'\
chapter="..chapter.."\
bgco={x="..bgco.x..",y="..bgco.y..",scale="..bgco.scale.."}\
cgco={x="..cgco.x..",y="..cgco.y..",scale="..cgco.scale.."}"..save_Set_data
	
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