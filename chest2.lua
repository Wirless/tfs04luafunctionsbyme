 function onUse(cid, item, fromPosition, itemEx, toPosition) -- palladin
	if getPlayerVocation(cid) == 7 or getPlayerVocation(cid) == 3 then -- check if player is sorcerer or druid then do this
		BAG = doPlayerAddItem(cid, 1988, 1)
		BAGG = doAddContainerItem(BAG, 1991, 1)
		doAddContainerItem(BAG, Cfcrossbow, 1)
		doAddContainerItem(BAG, Cfbolt, 1)
		doAddContainerItem(BAG, Cfknightarmor, 1)
		doAddContainerItem(BAG, Cfknightlegs, 1)
		doAddContainerItem(BAG, Cfleatherboots, 1)
		doAddContainerItem(BAG, Cfcrusaderhelmet, 1)
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
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Take the paladin eq.")
	else -- what if player is not sorcerer or druid?
		doPlayerSendCancel(cid, "You need to be paladin to obtain the contents of this chest.")
	end -- end of if statement
	return true
end 