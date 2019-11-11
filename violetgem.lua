 function onUse(cid, item, fromPosition, itemEx, toPosition)
		--doPlayerAddSkill(cid, 1, 1) -- club
		--doPlayerAddSkill(cid, 2, 1) -- sword
		--doPlayerAddSkill(cid, 3, 1) -- axe
		--doPlayerAddSkill(cid, 4, 1) -- distance
		--doPlayerAddSkill(cid, 5, 1) -- shielding
		--doPlayerAddSkill(cid, 6, 1) -- fishing
		local v = getCreatureMaxMana(cid) + 2
		setCreatureMaxMana(cid, v)
		doRemoveItem(item.uid, 1)
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You gain 2 max mana points!")
	return true
end 