
--- para adicionar a quest, alterar o nome do pokemon, alterar o sto_ini, sto, quantidade, sto_final e texto de conclusão da quest
local tasksss = {
       [1] = {name = "Voltorb", sto_ini= 2000200,  sto = 1000214, count = 20, sto_final = 1400131, text = "Muito obrigado por sua ajuda, nao conseguia mais correr!."},
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
function creatureSayCallback(cid, type, msg)
    if(not npcHandler:isFocused(cid)) then
        return false
    end
    local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
    local value = -1
    if (msgcontains(msg, "help") or msgcontains(msg, "Help")) and not value ~= -1 then
        value = 1
    end
    if value == -1 then
        selfSay('I don\'t have a this task!', cid)
        talkState[talkUser] = 0
        return true
    end
    local configss = tasksss[value]
    local final = configss.sto_final
    local name = configss.name
    local m_sto = configss.sto
    local total_count = configss.count
    local sto_ini = configss.sto_ini
    local rest = getPlayerStorageValue(cid, configss.sto)

    if getPlayerStorageValue(cid, final) <= 0 then -- verifica se o player está com a quest
        if getPlayerStorageValue(cid, sto_ini) <= 0 then -- verifica se o player não pegou está task
            selfSay('Otimo, mate {'.. total_count .. ' '.. name .. '} para nos!', cid)
            setPlayerStorageValue(cid, m_sto, total_count) --inicializa a quest com o total de monstros
            setPlayerStorageValue(cid,sto_ini, 1) --marca que o player possui a quest
            talkState[talkUser] = 0
        else
            if rest <= 0 then -- Verifica se o player matou todos os monstros nescessários
                --- recompensa de itens
                doPlayerAddItem(cid, 2152, 5) -- recompensa em dinheiro (2152-hundred dollar note)
                --- storages de conclusão
                setPlayerStorageValue(cid, total_count, 0) --zera a quantidade de monstros a serem mortos
                setPlayerStorageValue(cid, final, 10) -- marca quest como feita
                --- adicionar xp
                doPlayerAddExperience(cid, 1000) -- recompensa em xp
                doSendAnimatedText(getCreaturePosition(cid), 1000, 215) -- animação da recompensa em xp
                selfSay(configss.text, cid) -- texto de recompensa
                talkState[talkUser] = 0
            else
                selfSay('Voce precisa matar '..rest..' '..name..' para Ganhar sua recompensa.', cid)
                talkState[talkUser] = 0
            end
        end
    else
        selfSay('Obrigado por sua ajuda!', cid)
        talkState[talkUser] = 0
    end
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())