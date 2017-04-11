--
-- Created by IntelliJ IDEA.
-- User: marco
-- Date: 10/04/2017
-- Time: 23:42
-- To change this template use File | Settings | File Templates.
--

function onStepIn(cid, item, pos)
    if isSummon(cid) then
        return false
    end
    --
    local posi = {x=1830, y=998, z=7} --posição inicla de Johto

    if #getCreatureSummons(cid) >= 1 then
        for i = 1, #getCreatureSummons(cid) do
            doTeleportThing(getCreatureSummons(cid)[i], {x=posi.x - 1, y=posi.y, z=posi.z}, false)
        end
    end
    doTeleportThing(cid, {x=posi.x, y=posi.y, z=posi.z}, false)
    return true
end

