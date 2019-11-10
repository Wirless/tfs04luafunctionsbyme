function onStepIn(cid, item, pos)
	if (getTilePzInfo(pos) == FALSE) then
		if isPlayer(cid) == TRUE then
		doTargetCombatHealth(0, cid, COMBAT_PHYSICALDAMAGE, -10, -70, CONST_ME_NONE)
		end
	end
	doRemoveItem(item.uid, 1)
	return TRUE
end
