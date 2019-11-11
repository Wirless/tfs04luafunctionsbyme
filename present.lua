 local itemlow = {Cftimering, Cfringofhealing, 2157}
 local itemmid = {2153, 2156, 2157,2160,2159,2158}
 local itemhigh = {Cfdemonarmor,Cfdemonlegs,Cfdemonhelmet}
 local option = {itemlow, itemmid, itemhigh}
 
 
 function onUse(cid, item, fromPosition, itemEx, toPosition)
  local x = math.random(0,2)
  local z = math.random(0,2)
  local m = math.random(0,5)
	--doPlayerAddItem(cid, itemid[, count/subtype = 1[, canDropOnMap = true[, slot = 0]]])
	if getPlayerItemCount(cid, 5080) >= 1 then
		if z == 0 then
		doPlayerAddItem(cid, itemlow[x], 1)
		doPlayerRemoveItem(cid,5080, 10)
		elseif z == 1 then
		doPlayerAddItem(cid, itemmid[m], 1)
		doPlayerRemoveItem(cid,5080, 1)
		else
		doPlayerAddItem(cid, itemhigh[x], 1)
		doPlayerRemoveItem(cid,5080, 1)
		end
	print("rolled item= "..x.."")
	print("rolled table= " ..z.."")
	end
	return true
end
	
	
	
	
	
	--if(getCreatureStorage(cid, 1038) == -1) then
	----	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You completed the full green djinn quest.")
	--	doSendMagicEffect(getPlayerPosition(cid),CONST_ME_MAGIC_RED)
	--	doCreatureSetStorage(cid, 1038, 1) 
	--	doRemoveItem(item.uid, 1)
--	else
	--	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have already completed the green djinn quest.")
	--end
	--return true
--end 