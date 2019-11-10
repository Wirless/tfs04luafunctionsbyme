function onKill(cid, target, lastHit)
    if (isPlayer(cid) and isPlayer(target)) then
            if getPlayerIp(cid) ~= getPlayerIp(target) then
                local create = doPlayerAddItem(cid, 1990, 1)
                doPlayerSendTextMessage(cid, 24, "FRAGED: "..getPlayerName(target).."")
            end
    end
    return true
end