function onUse(cid, item, fromPosition, itemEx, toPosition)
	local miss = getPlayerStorageValue(cid, 266666) + 1
	local hit = getPlayerStorageValue(cid, 255555) + 1
	local playername = getCreatureName(cid)
	if(isPlayer(itemEx.uid)) then
		print("".. playername.." hit sd into ".. getCreatureName(itemEx.uid) .."")
		setPlayerStorageValue(cid, 255555, hit)
			return combat
		end
		-- would also work if not(isPlayer(itemEx.uid))
	if not(isPlayer(itemEx.uid)) then
		print(" ".. playername .." is using sd ")
		setPlayerStorageValue(cid, 266666, miss)
		end
		
end