local ITEM_RUM_FLASK = 5553

local TYPE_EMPTY = 0
local TYPE_WATER = 1
local TYPE_BLOOD = 2
local TYPE_BEER = 3
local TYPE_SLIME = 4
local TYPE_LEMONADE = 5
local TYPE_MILK = 6
local TYPE_MANA_FLUID = 7
local TYPE_LIFE_FLUID = 10
local TYPE_OIL = 11
local TYPE_URINE = 13
local TYPE_COCONUT_MILK = 14
local TYPE_WINE = 15
local TYPE_MUD = 19
local TYPE_FRUIT_JUICE = 21
local TYPE_LAVA = 26
local TYPE_RUM = 27
local TYPE_SWAMP = 28
local TYPE_TEA = 35


local oilLamps = {[2046] = 2044}
local casks = {[1771] = TYPE_WATER, [1772] = TYPE_BEER, [1773] = TYPE_WINE}
local alcoholDrinks = {TYPE_BEER, TYPE_WINE, TYPE_RUM}
local poisonDrinks = {TYPE_SLIME, TYPE_SWAMP}

local drunk = createConditionObject(CONDITION_DRUNK)
setConditionParam(drunk, CONDITION_PARAM_TICKS, 60000)

local poison = createConditionObject(CONDITION_POISON)
setConditionParam(poison, CONDITION_PARAM_DELAYED, true) -- Condition will delay the first damage from when it's added
setConditionParam(poison, CONDITION_PARAM_MINVALUE, -50) -- Minimum damage the condition can do at total
setConditionParam(poison, CONDITION_PARAM_MAXVALUE, -120) -- Maximum damage
setConditionParam(poison, CONDITION_PARAM_STARTVALUE, -5) -- The damage the condition will do on the first hit
setConditionParam(poison, CONDITION_PARAM_TICKINTERVAL, 4000) -- Delay between damages
setConditionParam(poison, CONDITION_PARAM_FORCEUPDATE, true) -- Re-update condition when adding it(ie. min/max value)

local burn = createConditionObject(CONDITION_FIRE)
setConditionParam(burn, CONDITION_PARAM_DELAYED, true) -- Condition will delay the first damage from when it's added
setConditionParam(burn, CONDITION_PARAM_MINVALUE, -70) -- Minimum damage the condition can do at total
setConditionParam(burn, CONDITION_PARAM_MAXVALUE, -150) -- Maximum damage
setConditionParam(burn, CONDITION_PARAM_STARTVALUE, -10) -- The damage the condition will do on the first hit
setConditionParam(burn, CONDITION_PARAM_TICKINTERVAL, 10000) -- Delay between damages
setConditionParam(burn, CONDITION_PARAM_FORCEUPDATE, true) -- Re-update condition when adding it(ie. min/max value)

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local spill = getPlayerStorageValue(cid, 233334) + 1
	local increment = getPlayerStorageValue(cid, 233333) + 1
	local playername = getCreatureName(cid)
	if(doComparePositions(getCreaturePosition(cid), toPosition))then
		itemEx.uid = cid
	end
	
	 if(toPosition.x == 0) then
	  doPlayerSendCancel(cid, "Sorry, not possible.")
	  return true
	 end
	 
	if(toPosition.x == CONTAINER_POSITION) then
		toPosition = getThingPos(item.uid)
	end
		
	if(itemEx.uid == cid) then
		if(item.type == TYPE_EMPTY) then
			doPlayerSendCancel(cid, "It is empty.")
			return true
		end

		if(item.type == TYPE_MANA_FLUID) then
			if(not doPlayerAddMana(itemEx.uid, math.random(55, 85))) then
				return false
			end

			doCreatureSay(itemEx.uid, "Aaaah...", TALKTYPE_SAY)
			doSendMagicEffect(toPosition, CONST_ME_MAGIC_BLUE)
		elseif(item.type == TYPE_LIFE_FLUID) then
			if(not doCreatureAddHealth(itemEx.uid, math.random(40, 70))) then
				return false
			end

			doCreatureSay(itemEx.uid, "Aaaah...", TALKTYPE_SAY)
			doSendMagicEffect(toPosition, CONST_ME_MAGIC_BLUE)
		elseif(isInArray(alcoholDrinks, item.type)) then
			if(not doTargetCombatCondition(0, cid, drunk, CONST_ME_NONE)) then
				return false
			end

			doCreatureSay(cid, "Aaah...", TALKTYPE_SAY)
		elseif(isInArray(poisonDrinks, item.type)) then
			if(not doTargetCombatCondition(0, cid, poison, CONST_ME_NONE)) then
				return false
			end

			doCreatureSay(cid, "Urgh!", TALKTYPE_SAY)
		elseif(item.type == TYPE_LAVA) then
			if(not doTargetCombatCondition(0, cid, burn, CONST_ME_NONE)) then
				return false
			end
			doCreatureSay(cid, "Urgh!", TALKTYPE_SAY)
		else
			doCreatureSay(cid, "Gulp.", TALKTYPE_SAY)
		end

		if(item.itemid == 2006) then
			print(" ".. playername .." is drinking")
			setPlayerStorageValue(cid, 233333, increment)
		else
			print(" ".. playername .." is drinking")
			setPlayerStorageValue(cid, 233333, increment)
		end
		
		
		--local b = getPlayerStorageValue(cid, a.storage) + 1
        --doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Task (".. name:upper() .."): " .. (b == a.amount and "Completed!" or b .." / ".. a.amount))
        --setPlayerStorageValue(cid, a.storage, b)
		return true
	end

	if(not isCreature(itemEx.uid)) then
		if(item.type == TYPE_EMPTY) then
			if(isItemFluidContainer(itemEx.itemid) and itemEx.type ~= TYPE_EMPTY) then
				doChangeTypeItem(item.uid, itemEx.type)
				doChangeTypeItem(itemEx.uid, TYPE_EMPTY)
				return true
			end

			local tmp = casks[itemEx.itemid]
			if(tmp == nil) then
				tmp = getFluidSourceType(itemEx.itemid)
			end

			if(tmp) then
				doChangeTypeItem(item.uid, tmp)
				return true
			end

			doPlayerSendCancel(cid, "It is empty.")
			return true
		end

		local tmp = oilLamps[itemEx.itemid]
		if(item.type == TYPE_OIL and tmp ~= nil) then
			doTransformItem(itemEx.uid, tmp)
			doChangeTypeItem(item.uid, TYPE_NONE)
			return true
		end

		if(isItemFluidContainer(itemEx.itemid) and itemEx.type == TYPE_EMPTY) then
			doChangeTypeItem(itemEx.uid, itemEx.type)
			doChangeTypeItem(item.uid, TYPE_EMPTY)
			return true
		end

		if(hasProperty(itemEx.uid, CONST_PROP_BLOCKSOLID)) then
			return false
		end
	end

	if(item.type == TYPE_EMPTY) then
		doPlayerSendCancel(cid, "It is empty.")
		return true
	end

	doDecayItem(doCreateItem(POOL, item.type, toPosition))
	if(item.itemid == 2006) then
		print(" "..playername.." spilled")
		setPlayerStorageValue(cid, 233334, spill)
	else
		doChangeTypeItem(item.uid, TYPE_EMPTY)
	end
	return true
end
