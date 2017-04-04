local s = {
--[action id] = {pos de volta}
[33694] = {id = 1}, -- saffron
[33693] = {id = 2}, -- cerulean
[33698] = {id = 3}, -- celadon
[33699] = {id = 4}, -- Lavender
[33695] = {id = 5}, -- vermillion
[33696] = {id = 6}, -- fuchsia
[33691] = {id = 7}, -- Cinnabar
[33697] = {id = 8}, -- viridian
[33692] = {id = 9}, -- pewter
[33690] = {id = 10}, -- pallet
}

function onStepIn(cid, item, pos)
if isSummon(cid) then
return false
end
--
local posi = {x=976, y=190, z=7} --posi�ao do Trade Center...
local pos = s[item.actionid]
local storage = 171877 
--
setPlayerStorageValue(cid, storage, pos.id)
--
if #getCreatureSummons(cid) >= 1 then
   for i = 1, #getCreatureSummons(cid) do
       doTeleportThing(getCreatureSummons(cid)[i], {x=posi.x - 1, y=posi.y, z=posi.z}, false)
   end
end 
doTeleportThing(cid, {x=posi.x, y=posi.y, z=posi.z}, false)  
return true
end