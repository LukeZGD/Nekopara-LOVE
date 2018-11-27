function ch1script()
	if cl == 1 then
		pause(2)
		bgUpdate('data.xp3/bgimage/空_昼','bgco',0,0)
		audioUpdate('0')
	elseif cl == 2 then
		cw('Mover',"Thank you very much! I'm heading out now!")
		voiceplay('mob/hikko_0001')
	elseif cl == 3 then
		pause(1)
	elseif cl == 4 then
		sfxplay("se車の発車音")
		pause(10)

	elseif cl == 5 then
		audioUpdate('bgm_01')
		bgUpdate('data.xp3/bgimage/店舗外観_昼開店前')
		cgUpdate('data.xp3/rule/obi')
		cw('Kashou',"Phew, this should be most of the boxes then.")
	elseif cl == 6 then
		cw('bl',"I wiped the sweat off my forehead with my arm...")
	elseif cl == 7 then
		cw('bl',"... as the moving truck disappeared from view.")
	elseif cl == 8 then
		cw('bl',"Although it was early April and only the beginning of spring...")
	elseif cl == 9 then
		cw('bl',"... today's weather was quite nice. It was even a bit hot.")
	elseif cl == 10 then
		cw('Kashou',"Well, it's a good day for a new start.")
	elseif cl == 11 then
		cw('bl',"I turned my head to look at the empty bakery which didn't even have any signage yet.")
    elseif cl == 12 then
		cw('bl',"The brand-new exterior wall had a Western look with a predominantly white and brown motif.")
    elseif cl == 13 then
		cw('bl',"There was also a large window which let lots of sunlight in.")
    elseif cl == 14 then
		cw('bl',"And finally, there were the words that displayed the name of the bakery: \"La Soleil\".")
    elseif cl == 15 then
		cw('bl',"Instead of the proper French article, \"Le\", it was \"La Soleil\", meaning \"The Sun\".")
    elseif cl == 16 then
		cw('bl',"This was a nod towards the name of the shop of someone I admired.")
    elseif cl == 17 then
		cw('Kashou',"Now that I'm on my own, I'll have to do my best.")
	elseif cl == 18 then
		cw('bl',"I softly murmured to myself.")
	elseif cl == 19 then
		cw('bl',"From here on out, no one would tell me what to do.")
	elseif cl == 20 then
		cw('bl',"I was going to start completely anew despite the stature of my family's name and everything that had happened up until now.")
	elseif cl == 21 then
		cw('bl',"I alone would decide my path and take responsibility for what I do.")
	elseif cl == 22 then
		cw('bl',"In exchange for that freedom, I can't blame anyone else for what happens.")
	elseif cl == 23 then
		cw('bl',"Still...")
	elseif cl == 24 then
		cw('bl',"Although I was a bit worried...")
	elseif cl == 25 then
		cw('bl',"... the thought of what lay ahead made me break into a smile.")
	elseif cl == 26 then
		cw('Kashou',"All right.")
	elseif cl == 27 then
		cw('Kashou',"In any case, I'd better get all these things cleaned up.")
	elseif cl == 28 then
		cw('bl',"I took a deep breath and got my spirits back up.")
	elseif cl == 29 then
		cw('bl',"I stepped into the new-smelling bakery.")
	elseif cl == 30 then
		bgUpdate('images/white')
		cgUpdate('images/blank')
		audioUpdate('0')
		pause(2)
	elseif cl == 31 then
		sfxplay('se環境音店舗扉鈴')
		pause(4)
	elseif cl == 32 then
		bgUpdate('data.xp3/bgimage/店舗内観_昼')
		cw('Kashou',"Hmm? What's with this big box...?")
	elseif cl == 33 then
		bgUpdate('evimage.xp3/CG01a','bgco',-100,-350)
		audioUpdate('bgm_02')
		cw('bl',"In front of me was a large box I didn't recognize.")
	elseif cl == 34 then
		cw('bl',"In fact, there were two of them.")
	elseif cl == 35 then
		cw('bl',"\"Fragile!\" \"Delicate!\"")
	elseif cl == 36 then
		cw('bl',"\"Absolutely this side up!\" \"If thrown, your company will be in trouble!\"")
	elseif cl == 37 then
		cw('bl',"The warnings were going overboard. They were getting annoying.")
	elseif cl == 38 then
		cw('Kashou',"Even if these are baking supplies, I don't remember buying anything quite like this...")
	elseif cl == 39 then
		cw('bl',"First off, they were boxes that looked like they came from my house.")
	elseif cl == 40 then
		cw('bl',"If these were for the bakery, there's no way I wouldn't remember buying them.")
	elseif cl == 41 then
		cw('bl',"There were no tags from the moving company either.")
	elseif cl == 42 then
		cw('bl',"All there was were those warning labels.")
	elseif cl == 43 then
		cw('Kashou',"Well, I'll know for sure once I open the--")
	elseif cl == 44 then
		pause(1.5)
	elseif cl == 45 then
		sfxplay("seガタッと物音")
		pause(1)
	elseif cl == 46 then
		bgUpdate('evimage.xp3/CG01b','bgco',-100,-350)
		pause(0.5)
	elseif cl == 47 then
		sfxplay("seガタッと物音")
		pause(1.5)
	elseif cl == 48 then
		cw('Box',"Achoo!!")
		audioUpdate('0')
		voiceplay('ショコラ/syo_0001')
	elseif cl == 49 then
		bgUpdate('evimage.xp3/CG01b','bgco',0,-350)
		cw('Kashou',"Huh...?!")
	elseif cl == 50 then
		audioUpdate('bgm_10')
		bgUpdate('evimage.xp3/CG01a','bgco',0,-350)
		cw('Box',"......")
		voiceplay('ショコラ/syo_0002')
	elseif cl == 50 then
		cw('Kashou',"......")
	elseif cl == 51 then
		cw('Box',"M-Me~ow...?")
		voiceplay('ショコラ/syo_0003')
	elseif cl == 52 then
		cw('Kashou',"......")
	elseif cl == 53 then
		cw('Box',"......")
		voiceplay('ショコラ/syo_0004')
	elseif cl == 53 then
		pause(4)
	elseif cl == 54 then
		bgUpdate('evimage.xp3/CG01a','bgco',-110,-350)
		cw('Kashou',"Oh, it's just a cat, huh? Just a troublesome cat. Geez.")
	elseif cl == 55 then
		cw('Box',"Phew... thank goodness. Looks like that fooled him...")
		voiceplay('ショコラ/syo_0005')
	elseif cl == 56 then
		cw('Box',"That was close... Chocola'd better be careful, meow...")
		voiceplay('ショコラ/syo_0006')
	elseif cl == 57 then
		bgUpdate('evimage.xp3/CG01a','bgco',0,-350)
		cw('Kashou',"Like that would fool me! What are you doing, Chocola?!")
	elseif cl == 58 then
		sfxplay('seガムテープ剥がす音')
		pause(2)
	elseif cl == 59 then
		bgUpdate('evimage.xp3/CG01c','bgco',0,-110)
		cw('Chocola',"Eheheh... uhm, l-long time no see... right, Master...?")
		voiceplay('ショコラ/syo_0007')
	elseif cl == 60 then
		cw('Kashou',"We just saw each other at home yesterday, you know.")
	elseif cl == 61 then
		cw('Chocola',"Well, uhm... that is true, Chocola guesses... Ahaha...")
		voiceplay('ショコラ/syo_0008')
	elseif cl == 62 then
		bgUpdate('evimage.xp3/CG01d','bgco',0,-110)
		cw('Chocola',"Ah, more importantly than that, listen up! Those movers were really mean!")
		voiceplay('ショコラ/syo_0009')
	elseif cl == 63 then
		cw('Chocola',"So they were picking up Chocola, right?!")
		voiceplay('ショコラ/syo_0010')
	elseif cl == 64 then
		cw('Chocola',"And they said \"This box is heavy, so be careful with it!\"")
		voiceplay('ショコラ/syo_0011')
	elseif cl == 65 then
		cw('Chocola',"Chocola wanted to hiss at them all of a sudden. Chocola really did!")
		voiceplay('ショコラ/syo_0012')
	elseif cl == 65 then
		cw('Chocola',"Chocola did her best to control her temper, but Chocola was fuming, you know! Absolutely fuming!")
		voiceplay('ショコラ/syo_0013')
	elseif cl == 66 then
		cw('Kashou',"Well, compared to the rest of my things, you are heavy...")
	elseif cl == 67 then
		cw('bl', "She ignored what I said.")
	elseif cl == 68 then
		cw('bl',"Chocola puffed out her cheeks.")
	elseif cl == 69 then
		cw('bl',"You could say that she was always happy-go-lucky.")
	elseif cl == 70 then
		cw('bl',"Or rather she preoccupied herself with only what was in front of her.")
	elseif cl == 71 then
		cw('bl',"... Well, I guess that was how you'd describe Chocola.")
	elseif cl == 72 then
		cw('Kashou',"While I was getting ready to move, I did wonder why I didn't see you--")
	elseif cl == 73 then
		cw('Box2',"Achee!!")
		voiceplay('バニラ/bani_0001')
	elseif cl == 74 then
		cw('Box2',"Hmmm...")
		voiceplay('バニラ/bani_0002')
	elseif cl == 75 then
		cw('Kashou',"... Hey.")
	elseif cl == 76 then
		cw('Vanilla',"Long time no see, Master.")
		voiceplay('バニラ/bani_0003')
	elseif cl == 70 then
		cw('bl',"Or rather she preoccupied herself with only what was in front of her.")
	elseif cl == 70 then
		cw('bl',"Or rather she preoccupied herself with only what was in front of her.")
	elseif cl == 70 then
		cw('bl',"Or rather she preoccupied herself with only what was in front of her.")
	end
end