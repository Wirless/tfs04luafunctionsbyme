--amirage
function onThink(cid)
	if(exhaustion.get(cid, 266666)) then
	doRemoveCondition(cid, CONDITION_PARALYZE)
	else
	print("this will spam into console")
end
