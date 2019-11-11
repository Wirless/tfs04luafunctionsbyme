local config =
{
makeExhaustion = 15, --make exhaust? put the exhaust time in seconds or false if it won't make exhaustion
exhaustionStorage = 51627, 
}


function onUse(cid, item, fromPosition, itemEx, toPosition, pos)
	if (exhaustion.get (cid, config.exhaustionStorage)) then
	print("".. getCreatureName(cid) .." is exhausted from trap")
	doPlayerSendCancel(cid, "You can use trap in ".. exhaustion.get(cid, config.exhaustionStorage).." seconds.")
	else
	print("".. getCreatureName(cid) .. " Planted Trap")
	TRAP = doCreateItem(2579, 1, getCreaturePosition(cid))
	doSetItemSpecialDescription(TRAP, "Trap created by: ".. getCreatureName(cid) .. "")
	exhaustion.set (cid, config.exhaustionStorage, config.makeExhaustion)
	end
	return true
end
	
