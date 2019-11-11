function onUse(cid, item, fromPosition, itemEx, toPosition, target)
	local miss = getPlayerStorageValue(cid, 266666) + 1
	local hit = getPlayerStorageValue(cid, 255555) + 1
	local playername = getCreatureName(cid)
	if(isPlayer(itemEx.uid)) then
		print("".. playername.." hit sd into ".. getCreatureName(itemEx.uid) .."")
		setPlayerStorageValue(cid, 255555, hit)
			return combat
		
	elseif not(isPlayer(itemEx.uid)) then
		print(" ".. playername .." is using sd ")
		setPlayerStorageValue(cid, 266666, miss)
		return combat
		
	else
		return combat
		end
		--invisible creatures return error RET_CANONLYHITCREATURES
end