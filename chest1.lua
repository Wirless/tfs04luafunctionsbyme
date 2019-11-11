 function onUse(cid, item, fromPosition, itemEx, toPosition)
	if getPlayerVocation(cid) == 5 or getPlayerVocation(cid) == 6 or getPlayerVocation(cid) == 1 or getPlayerVocation(cid) == 2 then -- check if player is sorcerer or druid then do this
		BAG = doPlayerAddItem(cid, 1988, 1)
		BAGG = doAddContainerItem(BAG, 1991, 1)
		doAddContainerItem(BAG, 2663, 1)
		doAddContainerItem(BAG, 2656, 1)
		doAddContainerItem(BAG, 5728, 1)
		doAddContainerItem(BAG, Cfleatherboots, 1)
		doAddContainerItem(BAG, 2456, 1)
		doAddContainerItem(BAG, 2546, 1)
		doAddContainerItem(BAGG, 2168, 1)
		doAddContainerItem(BAGG, Cfenergyring, 1)
		doAddContainerItem(BAGG, Cftimering, 1)
		BAG2 = doAddContainerItem(BAG, 2000, 1)
		doAddContainerItem(BAG2, Cfsuddendeathrune, 1)
		doAddContainerItem(BAG2, Cfultimatehealingrune, 1)
		doAddContainerItem(BAG2, Cffirebombrune, 1)
		doAddContainerItem(BAG2, Cfgreatfireballrune, 1)
		doAddContainerItem(BAG2, Cfdestroyfieldrune, 1)
		doAddContainerItem(BAG2, Cfmagicwallrune, 1)
		doAddContainerItem(BAG2, Cfexplosionrune, 1)
		doPlayerAddItem(cid, 2006, 7)
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Take the sorcerer eq.")
	else -- what if player is not sorcerer or druid?
		doPlayerSendCancel(cid, "You need to be druid or sorcerer to obtain the contents of this chest.")
	end -- end of if statement
	return true
end 