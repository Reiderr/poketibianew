--[[
function onDeath(cid, corpse, deathList)
        
	--if not isCreature(cid) then return true end
	if isSummon(cid) or not deathList or getCreatureName(cid) == "Evolution" then return true end --alterado v1.8

	local givenexp = getWildPokemonExp(cid)
	---local killer = getItemAttribute(corpse.uid, "corpseowner") 
if givenexp > 0 then
for a = 1, #deathList do
local pk = deathList[a]
---
local list = getSpectators(getThingPosWithDebug(pk), 30, 30, false)
if isCreature(pk) then 
   local expTotal = math.floor(givenexp * getDamageMapPercent(pk, cid))
   local party = getPartyMembers(pk)
   if isInParty(pk) and getPlayerStorageValue(pk, 4875498) <= -1 then
      expTotal = math.floor(expTotal/#party)         --alterado v1.6.1
      for i = 1, #party do
          if isInArray(list, party[i]) then		     
if getPlayerLevel(pk) <= 50 then
             playerAddExp(party[i], expTotal * 2)
elseif getPlayerLevel(pk) >= 51 and getPlayerLevel(pk) <= 75 then
             playerAddExp(party[i], expTotal * 1.3)
elseif getPlayerLevel(pk) >= 76 and getPlayerLevel(pk) <= 100 then
             playerAddExp(party[i], expTotal * 8)
elseif getPlayerLevel(pk) >= 101 and getPlayerLevel(pk) <= 150 then
             playerAddExp(party[i], expTotal * 4)
elseif getPlayerLevel(pk) >= 151 and getPlayerLevel(pk) <= 250 then
             playerAddExp(party[i], expTotal * 2)
elseif getPlayerLevel(pk) >= 251 and getPlayerLevel(pk) <= 350 then
             playerAddExp(party[i], expTotal * 1)
elseif getPlayerLevel(pk) >= 351 then
             playerAddExp(party[i], expTotal * 5)
			 end
          end
      end
   elseif not isInParty(pk) then
if getPlayerLevel(pk) <= 50 then
playerAddExp(pk, math.floor(20 * givenexp * getDamageMapPercent(pk, cid)))
elseif getPlayerLevel(pk) >= 51 and getPlayerLevel(pk) <= 75 then
playerAddExp(pk, math.floor(9 * givenexp * getDamageMapPercent(pk, cid)))
elseif getPlayerLevel(pk) >= 76 and getPlayerLevel(pk) <= 100 then
playerAddExp(pk, math.floor(8 * givenexp * getDamageMapPercent(pk, cid)))
elseif getPlayerLevel(pk) >= 101 and getPlayerLevel(pk) <= 150 then
playerAddExp(pk, math.floor(7 * givenexp * getDamageMapPercent(pk, cid)))
elseif getPlayerLevel(pk) >= 151 and getPlayerLevel(pk) <= 250 then
playerAddExp(pk, math.floor(6 * givenexp * getDamageMapPercent(pk, cid)))
elseif getPlayerLevel(pk) >= 251 and getPlayerLevel(pk) <= 350 then
playerAddExp(pk, math.floor(5 * givenexp * getDamageMapPercent(pk, cid)))
elseif getPlayerLevel(pk) >= 351 then
playerAddExp(pk, math.floor(4 * givenexp * getDamageMapPercent(pk, cid)))
return true end	  
   end       
end
end
end

	if isNpcSummon(cid) then
		local master = getCreatureMaster(cid)
		doSendMagicEffect(getThingPos(cid), getPlayerStorageValue(cid, 10000))
		doCreatureSay(master, getPlayerStorageValue(cid, 10001), 1)
		doRemoveCreature(cid)
	return false
	end
if corpse.itemid ~= 0 then   --alterado v1.8
   doItemSetAttribute(corpse.uid, "level", getPokemonLevel(cid))
   doItemSetAttribute(corpse.uid, "gender", getPokemonGender(cid))  
end
return true
end
]]