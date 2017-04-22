
--[[
function onKill(cid, target)

local continue = true

if ehMonstro(target) then
   for i = 91001, (91000+maxTasks) do
       local sto = getPlayerStorageValue(cid, i)
       if type(sto) == "string" then
          local array = getArrayFromStorage(cid, i)
          if arrayHasContent(array) then
             for e, f in pairs(array) do
                 for a = 1, #f do
                     if tostring(f[a][1]) == getCreatureName(target) and tonumber(f[a][2]) >= 1 then
                        if getDamageMapPercent(cid, target) < 0.5 then
                           continue = false
                        elseif (pokes[getPlayerStorageValue(cid, 854787)] and getCreatureName(getCreatureSummons(cid)[1]) ~= getPlayerStorageValue(cid, 854787)) then
                           if npcsTask[tostring(e).."_1"] then
                              continue = false             --task clan
                           end
                        elseif e == "Agatha" and getCreatureName(target) == "Shiny Abra" and not isInRange(getThingPos(target), Agatha.fromPos, Agatha.toPos) then
                           continue = false    --alterado v1.9 agatha quest
                        end
                        if continue then
                           f[a][2] = f[a][2]-1
                           if f[a][2] == 0 then
                              sendMsgToPlayer(cid, 20, tostring(e)..": Quest Done!")
                           else   
                              sendMsgToPlayer(cid, 20, tostring(e)..": You need to kill more "..f[a][2].." "..f[a][1]..(f[a][2] == 1 and "." or "s."))
                           end
                           setStorageArray(cid, i, array)
                        end
                        continue = true
                     end
                 end
             end
          end
       end
   end
end   

return true
end
]]

local tasksss = {
    [1] = {name = "Rattata",  sto = 10212, count = 3, time_sto = 5457, time = 1*24*60*60, sto_count = 14129, money = 100, rewardid = 7621, rewardcount = 100, rewardexp = 10000,  text = "Congratulations! You finished this task. In 24h, you will be able to do it again."},
    [2] = {name = "Charizard",  sto = 10213, count = 5, time_sto = 5458, time = 1*24*60*60, sto_count = 14130, money = 100, rewardid = 7621, rewardcount = 100, rewardexp = 10000,  text = "Congratulations! You finished this task. In 24h, you will be able to do it again."},
}

function onKill(cid, target)
    doPlayerSendTextMessage(cid, "estou aqui")
    for _, t in ipairs(tasksss) do
        local total_count = t.count
        local m_sto = t.sto
        local count_sto = t.sto_count
        if getPlayerStorageValue(cid, m_sto) ~= -1 then
            if getCreatureName(target) == t.name then
                if (total_count - getPlayerStorageValue(cid, count_sto)) == 1 then
                    setPlayerStorageValue(cid, count_sto, getPlayerStorageValue(cid, count_sto) + 1)
                    doPlayerSendTextMessage(cid, 20, "You are killed ".. getPlayerStorageValue(cid, count_sto) .." " .. t.name .. " and finished the task!")
                    return true
                elseif (total_count - getPlayerStorageValue(cid, count_sto)) >= 1 then
                    setPlayerStorageValue(cid, count_sto, getPlayerStorageValue(cid, count_sto) + 1)
                    doPlayerSendTextMessage(cid, 20, "You are killed ".. getPlayerStorageValue(cid, count_sto) .." of ".. total_count .." " .. t.name .. " kills to finish the task.")
                    return true
                end
            end
        end
    end
    return true
end