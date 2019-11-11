local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

 
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)
	if(npcHandler.focus ~= cid) then
		return false
	end	
	
	

local npcPos = getCreaturePosition(getNpcId())
	
	if(msgcontains(msg, "vocation")) then
		if(getPlayerStorageValue(cid, 250)) <= 11 then
			npcHandler:say("Choose your vocation: Knight, Paladin, Druid, Sorcerer", cid)
			npcHandlerfocus = 1
		end
	elseif(msgcontains(msg, "knight")) and getPlayerVocation(cid) == 0 then
		count = getPlayerExperience(cid) - 368300
		if getPlayerLevel(cid) < 30 then
			doPlayerSetVocation(cid,8)
			doPlayerAddExperience(cid, -count)
			doPlayerAddSkill(cid, 1, 50) -- club
			doPlayerAddSkill(cid, 2, 50) -- sword
			doPlayerAddSkill(cid, 3, 50) -- axe
			--doPlayerAddSkill(cid, 4, 1) -- distance
			doPlayerAddSkill(cid, 5, 50) -- shielding
			doPlayerAddSkill(cid, 7, 6) -- mlvl
		else
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
		end
	elseif(msgcontains(msg, "paladin")) and getPlayerVocation(cid) == 0 then
		count = getPlayerExperience(cid) - 368300
		if getPlayerLevel(cid) < 30 then
			doPlayerSetVocation(cid,7)
			doPlayerAddExperience(cid, -count)
			doPlayerAddSkill(cid, 4, 55) -- distance
			doPlayerAddSkill(cid, 5, 30) -- shielding
			doPlayerAddSkill(cid, 7, 10) -- mlvl
		else
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
		end
	elseif(msgcontains(msg, "druid")) and getPlayerVocation(cid) == 0 then
		count = getPlayerExperience(cid) - 368300
		if getPlayerLevel(cid) < 30 then
			doPlayerSetVocation(cid,6)
			doPlayerAddExperience(cid, -count)
			doPlayerAddSkill(cid, 5, 5)
			doPlayerAddSkill(cid, 7, 30) -- mlvl
		else
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
		end
	elseif(msgcontains(msg, "sorcerer")) and getPlayerVocation(cid) == 0 then
		count = getPlayerExperience(cid) - 368300
		if getPlayerLevel(cid) < 30 then
			doPlayerSetVocation(cid, 5)
			doPlayerAddExperience(cid, -count)
			doPlayerAddSkill(cid, 5, 5)
			doPlayerAddSkill(cid, 7, 30) -- mlvl
		else
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
		end
		
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())