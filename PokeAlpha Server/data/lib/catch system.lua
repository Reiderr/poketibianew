failmsgs = {
"Sorry, you didn't catch that pokemon.",
"Sorry, your pokeball broke.",
"Sorry, the pokemon escaped.",
}

function doBrokesCount(cid, str, ball)   --alterado v1.9 \/
if not isCreature(cid) then return false end
local tb = {
{b = "poke", v = 0},
{b = "great", v = 0},
{b = "super", v = 0},
{b = "ultra", v = 0},
{b = "saffari", v = 0},
{b = "dark", v = 0},
{b = "magu", v = 0},
{b = "sora", v = 0},
{b = "yume", v = 0},
{b = "dusk", v = 0},
{b = "tale", v = 0},
{b = "moon", v = 0},
{b = "net", v = 0},
{b = "premier", v = 0},
{b = "tinker", v = 0},
{b = "fast", v = 0},
{b = "heavy", v = 0},
}
for _, e in ipairs(tb) do
    if e.b == ball then
       e.v = 1
       break
    end
end
local strings = getPlayerStorageValue(cid, str)

local t = "normal = (.-), great = (.-), super = (.-), ultra = (.-), saffari = (.-), dark = (.-), magu = (.-), sora = (.-), yume = (.-), dusk = (.-), tale = (.-), moon = (.-), net = (.-), premier = (.-), tinker = (.-), fast = (.-), heavy = (.-);"
local t2 = ""
for n, g, s, u, s2, d, magu, sora, yume, dusk, tale, moon, net, premier, tinker, fast, heavy in strings:gmatch(t) do
    t2 = "normal = "..(n+tb[1].v)..", great = "..(g+tb[2].v)..", super = "..(s+tb[3].v)..", ultra = "..(u+tb[4].v)..", saffari = "..(s2+tb[5].v)..", dark = "..(d+tb[6].v)..", magu = "..(magu+tb[7].v)..", sora = "..(sora+tb[8].v)..", yume = "..(yume+tb[9].v)..", dusk = "..(dusk+tb[10].v)..", tale = "..(tale+tb[11].v)..", moon = "..(moon+tb[12].v)..", net = "..(net+tb[13].v)..", premier = "..(premier+tb[14].v)..", tinker = "..(tinker+tb[15].v)..", fast = "..(fast+tb[16].v)..", heavy = "..(heavy+tb[17].v)..";"    
end

setPlayerStorageValue(cid, str, strings:gsub(t, t2))
end

function sendBrokesMsg(cid, str, ball, poke, catched)
if not isCreature(cid) then return true end
local strings = getPlayerStorageValue(cid, str)
if type(strings) == "number" or type(strings) ~= "string" or not string.find(strings, "magu") then  --alterado v1.9 
   setPlayerStorageValue(cid, str, "normal = 0, great = 0, super = 0, ultra = 0, saffari = 0, dark = 0;") 
   strings = getPlayerStorageValue(cid, str)   --alterado v1.9 
end 
local t = "normal = (.-), great = (.-), super = (.-), ultra = (.-), saffari = (.-), dark = (.-), magu = (.-), sora = (.-), yume = (.-), dusk = (.-), tale = (.-), moon = (.-), net = (.-), premier = (.-), tinker = (.-), fast = (.-), heavy = (.-);"
local msg = {}
local countN, countG, countS, countU, countS2 = 0, 0, 0, 0, 0
local maguCount, soraCount, yumeCount, duskCount, taleCount, moonCount, netCount, premierCount, tinkerCount, fastCount, heavyCount = 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
table.insert(msg, "Voc�"..(catched == false and " j�" or "").." gastou: ")

for n, g, s, u, s2, d, magu, sora, yume, dusk, tale, moon, net, premier, tinker, fast, heavy in strings:gmatch(t) do
    if tonumber(n) and tonumber(n) > 0 then 
       table.insert(msg, tostring(n).." Poke ball".. (tonumber(n) > 1 and "s" or "")) 
	   countN = tonumber(n)
    end
    if tonumber(g) and tonumber(g) > 0 then 
       table.insert(msg, (#msg > 1 and ", " or "").. tostring(g).." Great ball".. (tonumber(g) > 1 and "s" or "")) 
	   countG = tonumber(g)
    end
	if tonumber(s) and tonumber(s) > 0 then 
       table.insert(msg, (#msg > 1 and ", " or "").. tostring(s).." Ultra ball".. (tonumber(s) > 1 and "s" or "")) 
	   countS = tonumber(s)
    end
    if tonumber(u) and tonumber(u) > 0 then 
       table.insert(msg, (#msg > 1 and ", " or "").. tostring(u).." Ultra ball".. (tonumber(u) > 1 and "s" or "")) 
	   countU = tonumber(u)
    end
    if tonumber(s2) and tonumber(s2) > 0 then 
       table.insert(msg, (#msg > 1 and ", " or "").. tostring(s2).." Saffari ball".. (tonumber(s2) > 1 and "s" or "")) 
	   countS2 = tonumber(s2)
    end
	
	if tonumber(magu) and tonumber(magu) > 0 then 
       table.insert(msg, (#msg > 1 and ", " or "").. tostring(magu).." Magu ball".. (tonumber(magu) > 1 and "s" or "")) 
	   maguCount = tonumber(magu)
    end
	
	if tonumber(sora) and tonumber(sora) > 0 then 
       table.insert(msg, (#msg > 1 and ", " or "").. tostring(sora).." Sora ball".. (tonumber(sora) > 1 and "s" or "")) 
	   soraCount = tonumber(sora)
    end
	
	if tonumber(yume) and tonumber(yume) > 0 then 
       table.insert(msg, (#msg > 1 and ", " or "").. tostring(yume).." Yume ball".. (tonumber(yume) > 1 and "s" or "")) 
	   yumeCount = tonumber(yume)
    end
	
	if tonumber(dusk) and tonumber(dusk) > 0 then 
       table.insert(msg, (#msg > 1 and ", " or "").. tostring(dusk).." Dusk ball".. (tonumber(dusk) > 1 and "s" or "")) 
	   duskCount = tonumber(dusk)
    end
	
	if tonumber(tale) and tonumber(tale) > 0 then 
       table.insert(msg, (#msg > 1 and ", " or "").. tostring(tale).." Tale ball".. (tonumber(tale) > 1 and "s" or "")) 
	   taleCount = tonumber(tale)
    end
	
	if tonumber(moon) and tonumber(moon) > 0 then 
       table.insert(msg, (#msg > 1 and ", " or "").. tostring(moon).." Moon ball".. (tonumber(moon) > 1 and "s" or "")) 
	   moonCount = tonumber(moon)
    end
	
	if tonumber(net) and tonumber(net) > 0 then 
       table.insert(msg, (#msg > 1 and ", " or "").. tostring(net).." Net ball".. (tonumber(net) > 1 and "s" or "")) 
	   netCount = tonumber(net)
    end
	
	if tonumber(premier) and tonumber(premier) > 0 then 
       table.insert(msg, (#msg > 1 and ", " or "").. tostring(premier).." Premier ball".. (tonumber(premier) > 1 and "s" or "")) 
	   premierCount = tonumber(premier)
    end
	
	if tonumber(tinker) and tonumber(tinker) > 0 then 
       table.insert(msg, (#msg > 1 and ", " or "").. tostring(tinker).." Tinker ball".. (tonumber(tinker) > 1 and "s" or "")) 
	   tinkerCount = tonumber(tinker)
    end
	
	if tonumber(fast) and tonumber(fast) > 0 then 
       table.insert(msg, (#msg > 1 and ", " or "").. tostring(fast).." Fast ball".. (tonumber(fast) > 1 and "s" or "")) 
	   fastCount = tonumber(fast)
    end
	
	if tonumber(heavy) and tonumber(heavy) > 0 then 
       table.insert(msg, (#msg > 1 and ", " or "").. tostring(heavy).." Heavy ball".. (tonumber(heavy) > 1 and "s" or "")) 
	   heavyCount = tonumber(heavy)
    end
end
if #msg == 1 then
   return true
end
if string.sub(msg[#msg], 1, 1) == "," then
   msg[#msg] = " e".. string.sub(msg[#msg], 2, #msg[#msg])
end
table.insert(msg, " para"..(catched == false and " tentar" or "").." captura-lo.")
doPlayerSendTextMessage(cid, 27, table.concat(msg))
if catched then

local ballsCatchedString = countN .. "-" .. countG .. "-" .. countS .. "-" .. countU .. "-" .. countS2 .. "-" .. maguCount .. "-" .. soraCount .. "-" .. yumeCount .. "-" .. duskCount .. "-" .. taleCount .. "-" .. moonCount .. "-" .. netCount .. "-" .. premierCount .. "-" .. tinkerCount .. "-" ..fastCount .. "-" .. heavyCount
	 
	local list = getCatchList(cid)
    if not jaCapturou(cid, poke) then    
		  local expssss = 100
				for i = 1, #oldpokedexToCatch do
					if oldpokedexToCatch[i][1] == doCorrectString(poke) then
					   expssss = oldpokedexToCatch[i][4]
					   break
					end	
				end
		  doSendPlayerExtendedOpcode(cid, opcodes.OPCODE_CATCH, getPortraitClientID(poke) .. "-" .. expssss .. "-" .. poke .. "-" .. ballsCatchedString)
		  doPlayerAddExp(cid, expssss)
		  doSendAnimatedText(getThingPos(cid), expssss , 215)
		  doPlayerAddInKantoCatchs(cid, 1)
		  colocarNaListaDeCapturados(cid, poke)
	end
end
end                                                                 --alterado v1.9 /\
--------------------------------------------------------------------------------
function colocarNaListaDeCapturados(cid, poke)
	setPlayerStorageValue(cid, fotos[poke], 1)
end

function jaCapturou(cid, poke)
	local storage = getPlayerStorageValue(cid, fotos[poke])
		if storage ~= -1 then
		   return true
		end
	return false
end

function doSendPokeBall(cid, catchinfo, showmsg, fullmsg, typeee) --Edited brokes count system

	local name = catchinfo.name
	local pos = catchinfo.topos
	local topos = {}
		topos.x = pos.x
		topos.y = pos.y
		topos.z = pos.z
	local newid = catchinfo.newid
	local catch = catchinfo.catch
	local fail = catchinfo.fail
	local rate = catchinfo.rate
	local basechance = catchinfo.chance
	
	if pokes[getPlayerStorageValue(cid, 854788)] and name == getPlayerStorageValue(cid, 854788) then 
	   rate = 85
    end

	local corpse = getTopCorpse(topos).uid

	if not isCreature(cid) then
		doSendMagicEffect(topos, CONST_ME_POFF)
	return true
	end

	doItemSetAttribute(corpse, "catching", 1)

local level = getItemAttribute(corpse, "level") or 0
local levelChance = level * 0.02

	local totalChance = math.ceil(basechance * (1.2 + levelChance))
	local thisChance = math.random(0, totalChance)
	local myChance = math.random(0, totalChance)
	local chance = (1 * rate + 1) / totalChance
		chance = doMathDecimal(chance * 100)

	if rate >= totalChance then
		local status = {}
		      status.gender = getItemAttribute(corpse, "gender")
		      status.happy = 500

		doRemoveItem(corpse, 1)
		doSendMagicEffect(topos, catch)
		addEvent(doCapturePokemon, 3000, cid, name, newid, status, typeee)  
	return true
	end


	if totalChance <= 1 then totalChance = 1 end

	local myChances = {}
	local catchChances = {}


	for cC = 0, totalChance do
		table.insert(catchChances, cC)
	end

	for mM = 1, rate do
		local element = catchChances[math.random(1, #catchChances)]
		table.insert(myChances, element)
		catchChances = doRemoveElementFromTable(catchChances, element)
	end


	local status = {}
	      status.gender = getItemAttribute(corpse, "gender")
	      status.happy = 500

	doRemoveItem(corpse, 1)

	local doCatch = false

	for check = 1, #myChances do
		if thisChance == myChances[check] then
			doCatch = true
		end
	end

	if doCatch then
		doSendMagicEffect(topos, catch)
		addEvent(doCapturePokemon, 3000, cid, name, newid, status, typeee) 
	else
		addEvent(doNotCapturePokemon, 3000, cid, name, typeee) 
		doSendMagicEffect(topos, fail)
	end
end

function doCapturePokemon(cid, poke, ballid, status, typeee)  

	if not isCreature(cid) then
	return true
	end
	
	if not tonumber(getPlayerStorageValue(cid, 54843)) or getPlayerStorageValue(cid, 54843) == -1 then
		setPlayerStorageValue(cid, 54843, 1)
	else
		setPlayerStorageValue(cid, 54843, getPlayerStorageValue(cid, 54843) + 1)
	end

    if pokeballs[poke] then
       ballid = pokeballs[poke].on
    end	
    
local description = "Contains a "..poke.."."
local cap = getPlayerFreeCap(cid)
        if (cap <= 1 and not isInArray({5, 6}, getPlayerGroupId(cid))) or not hasSpaceInContainer(getPlayerSlotItem(cid, 3).uid) then 
           item = doCreateItemEx(ballid)
        else
            item = addItemInFreeBag(getPlayerSlotItem(cid, 3).uid, ballid, 1) 
        end

		doItemSetAttribute(item, "poke", poke)
		doItemSetAttribute(item, "hpToDraw", 0)
		doItemSetAttribute(item, "ball", typeee)
	    doSetAttributesBallsByPokeName(cid, item, poke)	
		if poke == "Hitmonchan" or poke == "Shiny Hitmonchan" then    
		   doItemSetAttribute(item, "hands", 0)
		end
		
		if getPlayerStorageValue(cid, storages.catchAnuncio) == 1 then -- anuncio de catch no catch channel
	       for _, oid in ipairs(getPlayersOnline()) do
		      doPlayerSendChannelMessage(oid, "Catch System", "O jogador ".. getCreatureName(cid) .." capturou um "..poke..".", TALKTYPE_CHANNEL_W, 20)
		   end
	    end
		----------- task clan ---------------------
        if pokes[getPlayerStorageValue(cid, 854788)] and poke == getPlayerStorageValue(cid, 854788) then
           sendMsgToPlayer(cid, 27, "Quest Done!")
           doItemSetAttribute(item, "unique", getCreatureName(cid))  
           doItemSetAttribute(item, "task", 1)
           setPlayerStorageValue(cid, 854788, 'done')
        end		       
		if pokeballs[poke:lower()] then
		   doTransformItem(item, pokeballs[poke:lower()].on)	
		end
	    doItemSetAttribute(item, "ehDoChao", false)		
		
		
        doPlayerSendTextMessage(cid, 27, "Congratulations, you caught a pokemon ("..poke..")!")
		if cap <= 1 then   
			doPlayerSendMailByName(getCreatureName(cid), item, 1)
			doPlayerSendTextMessage(cid, 27, "Since you are already holding six pokemons, this pokeball has been sent to your depot.")  
		end

	if #getCreatureSummons(cid) >= 1 then
		doSendMagicEffect(getThingPos(getCreatureSummons(cid)[1]), 173) 
			if catchMakesPokemonHappier then
				setPlayerStorageValue(getCreatureSummons(cid)[1], 1008, getPlayerStorageValue(getCreatureSummons(cid)[1], 1008) + 20)
			end
	else
		doSendMagicEffect(getThingPos(cid), 173) 
	end
	
	if typeee == "master" then
	   doItemSetAttribute(item, "unique", true) 
	end

---contagem caught de pokemons por tipo

	local storage = newpokedex[poke].stoCatch
	local stoCatch = newpokedex[poke].stoCatch + 100000
    local statement = getPlayerStorageValue(cid, newpokedex[poke].stoCatch + 100000) <= 0
	--
	if (pokes[poke].type == "grass" or pokes[poke].type2 == "grass") and statement then --verifica o tipo do pokemon, e se ele ainda não foi capturado
		local contador = 0

		if getPlayerStorageValue(cid, stoGrass) <= 0 then
			setPlayerStorageValue(cid, stoGrass, 0)
		end
		contador = getPlayerStorageValue(cid, stoGrass)
		doSendMsg(cid, "voce capturou um pokemon do tipo planta agora sao "..(contador+1).." pokemons desse tipo capturados")
		setPlayerStorageValue(cid, stoGrass, contador+1)
		setPlayerStorageValue(cid, stoCatch, 1)
	end


	if (pokes[poke].type == "fire" or pokes[poke].type2 == "fire") and statement then --verifica o tipo do pokemon, e se ele ainda não foi capturado
		local contador = 0
		if getPlayerStorageValue(cid, stoFire) <= 0 then-- alterar
			setPlayerStorageValue(cid, stoFire, 0) --alterar
		end
		contador = getPlayerStorageValue(cid, stoFire) --alterar
        doSendMsg(cid, "voce capturou um pokemon do tipo fogo agora sao "..(contador+1).." pokemons desse tipo capturados")
		setPlayerStorageValue(cid, stoFire, contador+1) --alterar
		setPlayerStorageValue(cid, stoCatch, 1)
    end

    if (pokes[poke].type == "water" or pokes[poke].type2 == "water") and statement then --verifica o tipo do pokemon, e se ele ainda não foi capturado
        local contador = 0
		doSendMsg(cid, "capturado")
        if getPlayerStorageValue(cid, stoWater) <= 0 then-- alterar
            setPlayerStorageValue(cid, stoWater, 0) --alterar
        end
        contador = getPlayerStorageValue(cid, stoWater) --alterar
		doSendMsg(cid, "voce capturou um pokemon do tipo agua agora sao "..(contador+1).." pokemons desse tipo capturados")
        setPlayerStorageValue(cid, stoWater, contador+1) --alterar
		setPlayerStorageValue(cid, stoCatch, 1)
    end

    if (pokes[poke].type == "poison" or pokes[poke].type2 == "poison") and statement then --verifica o tipo do pokemon, e se ele ainda não foi capturado
        local contador = 0
        if getPlayerStorageValue(cid, stoPoison) <= 0 then-- alterar
            setPlayerStorageValue(cid, stoPoison, 0) --alterar
        end
        contador = getPlayerStorageValue(cid, stoPoison) --alterar
		doSendMsg(cid, "voce capturou um pokemon do tipo veneno agora sao "..(contador+1).." pokemons desse tipo capturados")
        setPlayerStorageValue(cid, stoPoison, contador+1) --alterar
		setPlayerStorageValue(cid, stoCatch, 1)
    end

    if (pokes[poke].type == "dark" or pokes[poke].type2 == "dark") and statement then --verifica o tipo do pokemon, e se ele ainda não foi capturado
        local contador = 0
        if getPlayerStorageValue(cid, stoDark) <= 0 then-- alterar
            setPlayerStorageValue(cid, stoDark, 0) --alterar
        end
        contador = getPlayerStorageValue(cid, stoDark) --alterar
		doSendMsg(cid, "voce capturou um pokemon do tipo dark agora sao "..(contador+1).." pokemons desse tipo capturados")
        setPlayerStorageValue(cid, stoDark, contador+1) --alterar
		setPlayerStorageValue(cid, stoCatch, 1)
    end

    if (pokes[poke].type == "psychic" or pokes[poke].type2 == "psychic") and statement then --verifica o tipo do pokemon, e se ele ainda não foi capturado
        local contador = 0
        if getPlayerStorageValue(cid, stoPsy) <= 0 then-- alterar
            setPlayerStorageValue(cid, stoPsy, 0) --alterar
        end
        contador = getPlayerStorageValue(cid, stoPsy) --alterar
		doSendMsg(cid, "voce capturou um pokemon do tipo psy agora sao "..(contador+1).." pokemons desse tipo capturados")
        setPlayerStorageValue(cid, stoPsy, contador+1) --alterar
		setPlayerStorageValue(cid, stoCatch, 1)
    end

    if (pokes[poke].type == "bug" or pokes[poke].type2 == "bug") and statement then --verifica o tipo do pokemon, e se ele ainda não foi capturado
        local contador = 0
        if getPlayerStorageValue(cid, stoInseto) <= 0 then-- alterar
            setPlayerStorageValue(cid, stoInseto, 0) --alterar
        end
        contador = getPlayerStorageValue(cid, stoInseto) --alterar
		doSendMsg(cid, "voce capturou um pokemon do tipo psy agora sao "..(contador+1).." pokemons desse tipo capturados")
        setPlayerStorageValue(cid, stoInseto, contador+1) --alterar
		setPlayerStorageValue(cid, stoCatch, 1)
    end

    if (pokes[poke].type == "flying" or pokes[poke].type2 == "flying") and statement then --verifica o tipo do pokemon, e se ele ainda não foi capturado
        local contador = 0
        if getPlayerStorageValue(cid, stoFly) <= 0 then-- alterar
            setPlayerStorageValue(cid, stoFly, 0) --alterar
        end
        contador = getPlayerStorageValue(cid, stoFly) --alterar
		doSendMsg(cid, "voce capturou um pokemon do tipo voador agora sao "..(contador+1).." pokemons desse tipo capturados")
        setPlayerStorageValue(cid, stoFly, contador+1) --alterar
		setPlayerStorageValue(cid, stoCatch, 1)
    end

    if (pokes[poke].type == "normal" or pokes[poke].type2 == "normal") and statement then --verifica o tipo do pokemon, e se ele ainda não foi capturado
        local contador = 0
        if getPlayerStorageValue(cid, stoNormal) <= 0 then-- alterar
            setPlayerStorageValue(cid, stoNormal, 0) --alterar
        end
        contador = getPlayerStorageValue(cid, stoNormal) --alterar
		doSendMsg(cid, "voce capturou um pokemon do tipo normal agora sao "..(contador+1).." pokemons desse tipo capturados")
        setPlayerStorageValue(cid, stoNormal, contador+1) --alterar
		setPlayerStorageValue(cid, stoCatch, 1)
    end

    if (pokes[poke].type == "ghost" or pokes[poke].type2 == "ghost") and statement then --verifica o tipo do pokemon, e se ele ainda não foi capturado
        local contador = 0
        if getPlayerStorageValue(cid, stoGhost) <= 0 then-- alterar
            setPlayerStorageValue(cid, stoGhost, 0) --alterar
        end
        contador = getPlayerStorageValue(cid, stoGhost) --alterar
		doSendMsg(cid, "voce capturou um pokemon do tipo fantasma agora sao "..(contador+1).." pokemons desse tipo capturados")
        setPlayerStorageValue(cid, stoGhost, contador+1) --alterar
		setPlayerStorageValue(cid, stoCatch, 1)
    end

    if (pokes[poke].type == "fighting" or pokes[poke].type2 == "fighting") and statement then --verifica o tipo do pokemon, e se ele ainda não foi capturado
        local contador = 0
        if getPlayerStorageValue(cid, stoFight) <= 0 then-- alterar
            setPlayerStorageValue(cid, stoFight, 0) --alterar
        end
        contador = getPlayerStorageValue(cid, stoFight) --alterar
		doSendMsg(cid, "voce capturou um pokemon do tipo lutador agora sao "..(contador+1).." pokemons desse tipo capturados")
        setPlayerStorageValue(cid, stoFight, contador+1) --alterar
		setPlayerStorageValue(cid, stoCatch, 1)
    end

    if (pokes[poke].type == "rock" or pokes[poke].type2 == "rock") and statement then --verifica o tipo do pokemon, e se ele ainda não foi capturado
        local contador = 0
        if getPlayerStorageValue(cid, stoRock) <= 0 then-- alterar
            setPlayerStorageValue(cid, stoRock, 0) --alterar
        end
        contador = getPlayerStorageValue(cid, stoRock) --alterar
		doSendMsg(cid, "voce capturou um pokemon do tipo pedra agora sao "..(contador+1).." pokemons desse tipo capturados")
        setPlayerStorageValue(cid, stoRock, contador+1) --alterar
		setPlayerStorageValue(cid, stoCatch, 1)
    end

    if (pokes[poke].type == "ground" or pokes[poke].type2 == "ground") and statement then --verifica o tipo do pokemon, e se ele ainda não foi capturado
        local contador = 0
        if getPlayerStorageValue(cid, stoGround) <= 0 then-- alterar
            setPlayerStorageValue(cid, stoGround, 0) --alterar
        end
        contador = getPlayerStorageValue(cid, stoGround) --alterar
		doSendMsg(cid, "voce capturou um pokemon do tipo terra agora sao "..(contador+1).." pokemons desse tipo capturados")
        setPlayerStorageValue(cid, stoGround, contador+1) --alterar
		setPlayerStorageValue(cid, stoCatch, 1)
    end

    if (pokes[poke].type == "steel" or pokes[poke].type2 == "steel") and statement then --verifica o tipo do pokemon, e se ele ainda não foi capturado
        local contador = 0
        if getPlayerStorageValue(cid, stoSteel) <= 0 then-- alterar
            setPlayerStorageValue(cid, stoSteel, 0) --alterar
        end
        contador = getPlayerStorageValue(cid, stoSteel) --alterar
		doSendMsg(cid, "voce capturou um pokemon do tipo steel agora sao "..(contador+1).." pokemons desse tipo capturados")
        setPlayerStorageValue(cid, stoSteel, contador+1) --alterar
		setPlayerStorageValue(cid, stoCatch, 1)
    end

    if (pokes[poke].type == "ice" or pokes[poke].type2 == "ice") and statement then --verifica o tipo do pokemon, e se ele ainda não foi capturado
        local contador = 0
        if getPlayerStorageValue(cid, stoIce) <= 0 then-- alterar
            setPlayerStorageValue(cid, stoIce, 0) --alterar
        end
        contador = getPlayerStorageValue(cid, stoIce) --alterar
		doSendMsg(cid, "voce capturou um pokemon do tipo gelo agora sao "..(contador+1).." pokemons desse tipo capturados")
        setPlayerStorageValue(cid, stoIce, contador+1) --alterar
		setPlayerStorageValue(cid, stoCatch, 1)
    end

    if (pokes[poke].type == "electric" or pokes[poke].type2 == "electric") and statement then --verifica o tipo do pokemon, e se ele ainda não foi capturado
        local contador = 0
        if getPlayerStorageValue(cid, stoElectric) <= 0 then-- alterar
            setPlayerStorageValue(cid, stoElectric, 0) --alterar
        end
        contador = getPlayerStorageValue(cid, stoElectric) --alterar
		doSendMsg(cid, "voce capturou um pokemon do tipo eletrico agora sao "..(contador+1).." pokemons desse tipo capturados")
        setPlayerStorageValue(cid, stoElectric, contador+1) --alterar
		setPlayerStorageValue(cid, stoCatch, 1)
    end

    if (pokes[poke].type == "dragon" or pokes[poke].type2 == "dragon") and statement then --verifica o tipo do pokemon, e se ele ainda não foi capturado
        local contador = 0
        if getPlayerStorageValue(cid, stoDragon) <= 0 then-- alterar
            setPlayerStorageValue(cid, stoDragon, 0) --alterar
        end
        contador = getPlayerStorageValue(cid, stoDragon) --alterar
		doSendMsg(cid, "voce capturou um pokemon do tipo dragao agora sao "..(contador+1).." pokemons desse tipo capturados")
        setPlayerStorageValue(cid, stoDragon, contador+1) --alterar
		setPlayerStorageValue(cid, stoCatch, 1)
    end

---end incremento de caught por tipo



    sendBrokesMsg(cid, storage, typeee, poke, true)   
    setPlayerStorageValue(cid, storage, "normal = 0, great = 0, super = 0, ultra = 0, saffari = 0, dark = 0, magu = 0, sora = 0, yume = 0, dusk = 0, tale = 0, moon = 0, net = 0, premier = 0, tinker = 0, fast = 0, heavy = 0;") --alterado v1.9 /\

	doIncreaseStatistics(poke, true, true)

end



function doNotCapturePokemon(cid, poke, typeee)  

	if not isCreature(cid) then
	return true
	end

if not tonumber(getPlayerStorageValue(cid, 54843)) then
	local test = io.open("data/sendtobrun123.txt", "a+")
	local read = ""
	if test then
		read = test:read("*all")
		test:close()
	end
	read = read.."\n[csystem.lua] "..getCreatureName(cid).." - "..getPlayerStorageValue(cid, 54843)..""
	local reopen = io.open("data/sendtobrun123.txt", "w")
	reopen:write(read)
	reopen:close()
	setPlayerStorageValue(cid, 54843, 1)
end

	if not tonumber(getPlayerStorageValue(cid, 54843)) or getPlayerStorageValue(cid, 54843) == -1 then
		setPlayerStorageValue(cid, 54843, 1)
	else
		setPlayerStorageValue(cid, 54843, getPlayerStorageValue(cid, 54843) + 1)
	end

	doPlayerSendTextMessage(cid, 27, failmsgs[math.random(#failmsgs)])

	if #getCreatureSummons(cid) >= 1 then
		doSendMagicEffect(getThingPos(getCreatureSummons(cid)[1]), 166)
	else
		doSendMagicEffect(getThingPos(cid), 166)
	end
	
local storage = newpokedex[poke].stoCatch
doIncreaseStatistics(poke, true, false)
sendBrokesMsg(cid, str, ball, poke, false)

end



function getPlayerInfoAboutPokemon(cid, poke)
	poke = doCorrectString(poke)
	local a = newpokedex[poke]
	if not isPlayer(cid) then return false end
	if not a then
		print("Error while executing function \"getPlayerInfoAboutPokemon(\""..getCreatureName(cid)..", "..poke..")\", "..poke.." doesn't exist.")
	return false
	end
	local b = getPlayerStorageValue(cid, a.storage)

	if b == -1 then
		setPlayerStorageValue(cid, a.storage, poke..":")
	end

	local ret = {}
		if string.find(b, "catch,") then
			ret.catch = true
		else
			ret.catch = false
		end
		if string.find(b, "dex,") then
			ret.dex = true
		else
			ret.dex = false
		end
		if string.find(b, "use,") then
			ret.use = true
		else
			ret.use = false
		end
return ret
end


function doAddPokemonInOwnList(cid, poke)

	if getPlayerInfoAboutPokemon(cid, poke).use then return true end

	local a = newpokedex[poke]
	local b = getPlayerStorageValue(cid, a.storage)

	setPlayerStorageValue(cid, a.storage, b.." use,")
end

function isPokemonInOwnList(cid, poke)

	if getPlayerInfoAboutPokemon(cid, poke).use then return true end

return false
end

function doAddPokemonInCatchList(cid, poke)

	if getPlayerInfoAboutPokemon(cid, poke).catch then return true end

	local a = newpokedex[poke]
	local b = getPlayerStorageValue(cid, a.storage)

	setPlayerStorageValue(cid, a.storage, b.." catch,")
end

function getCatchList(cid)

local ret = {}

for a = 1000, 1251 do
	local b = getPlayerStorageValue(cid, a)
	if b ~= 1 and string.find(b, "catch,") then
		table.insert(ret, oldpokedex[a-1000][1])
	end
end

return ret

end


function getStatistics(pokemon, tries, success)

local ret1 = 0
local ret2 = 0

	local poke = ""..string.upper(string.sub(pokemon, 1, 1))..""..string.lower(string.sub(pokemon, 2, 30))..""
	local dir = "data/Pokemon Statistics/"..poke.." Attempts.txt"
	local arq = io.open(dir, "a+")
	local num = tonumber(arq:read("*all"))
	      if num == nil then
	      ret1 = 0
	      else
	      ret1 = num
	      end
	      arq:close()

	local dir = "data/Pokemon Statistics/"..poke.." Catches.txt"
	local arq = io.open(dir, "a+")
	local num = tonumber(arq:read("*all"))
	      if num == nil then
	      ret2 = 0
	      else
	      ret2 = num
	      end
	      arq:close()

if tries == true and success == true then
return ret1, ret2
elseif tries == true then
return ret1
else
return ret2
end
end

function doIncreaseStatistics(pokemon, tries, success)

local poke = ""..string.upper(string.sub(pokemon, 1, 1))..""..string.lower(string.sub(pokemon, 2, 30))..""

	if tries == true then
		local dir = "data/Pokemon Statistics/"..poke.." Attempts.txt"

		local arq = io.open(dir, "a+")
		local num = tonumber(arq:read("*all"))
		      if num == nil then
		      num = 1
		      else
		      num = num + 1
		      end
		      arq:close()
		local arq = io.open(dir, "w")
		      arq:write(""..num.."")
		      arq:close()
	end

	if success == true then
		local dir = "data/Pokemon Statistics/"..poke.." Catches.txt"

		local arq = io.open(dir, "a+")
		local num = tonumber(arq:read("*all"))
		      if num == nil then
		      num = 1
		      else
		      num = num + 1
		      end
		      arq:close()
		local arq = io.open(dir, "w")
		      arq:write(""..num.."")
		      arq:close()
	end
end

function doUpdateGeneralStatistics()
	
	local dir = "data/Pokemon Statistics/Pokemon Statistics.txt"
	local base = "NUMBER  NAME        TRIES / CATCHES\n\n"
	local str = ""

for a = 1, 251 do
	if string.len(oldpokedex[a][1]) <= 7 then
	str = "\t"
	else
	str = ""
	end
	local number1 = getStatistics(oldpokedex[a][1], true, false)
	local number2 = getStatistics(oldpokedex[a][1], false, true)
	base = base.."["..threeNumbers(a).."]\t"..oldpokedex[a][1].."\t"..str..""..number1.." / "..number2.."\n"
end
	
	local arq = io.open(dir, "w")
	      arq:write(base)
 	      arq:close()
end

function getGeneralStatistics()
	
	local dir = "data/Pokemon Statistics/Pokemon Statistics.txt"
	local base = "Number/Name/Tries/Catches\n\n"
	local str = ""

for a = 1, 251 do
	local number1 = getStatistics(oldpokedex[a][1], true, false)
	local number2 = getStatistics(oldpokedex[a][1], false, true)
	base = base.."["..threeNumbers(a).."] "..oldpokedex[a][1].."  "..str..""..number1.." / "..number2.."\n"
end
	
return base
end

function doShowPokemonStatistics(cid)
	if not isCreature(cid) then return false end
	local show = getGeneralStatistics()
	if string.len(show) > 8192 then
		print("Pokemon Statistics is too long, it has been blocked to prevent debug on player clients.")
		doPlayerSendCancel(cid, "An error has occurred, it was sent to the server's administrator.") 
	return false
	end
	doShowTextDialog(cid, math.random(2391, 2394), show)
end  