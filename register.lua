--Legendary Item Circulation System
--LICS -- ADD PREVENT DROP FROM AOL TO LEGENDARY ITEMS I BELIEVE ALSO MANIPULATE MATH RANDOM IN EACH DIRECTION TO CHECK WHEN IN TEST
-- Author: Kajsiusiak
-- Idea: TibiaLeaves
local iid = 1111 --  ITEM Identification Number e g winged helmet
function onDeath(cid, corpse, killer) -- function onDeath
	if isPlayer(cid) then -- IF PLAYER CHARACTER
	local dropitem = getPlayerSlotItem(cid, 1) --1 is for head
		if dropitem ~= false then -- IF DROPITEM ISNOT FALSE ( MEANING THAT ITEMLOSS IS BELOW 0% CHANCE ON CHARACTER
			if dropitem.itemid == iid then -- IF DROPITEMID = THE IDENTIFICATION NUMBER THEN
			local v = math.random[1,100] -- GENERATE RANDOM NUMBER
				if v <= 10 then -- IF IT IS BELOW 10(1-10) out of 100 then
				doPlayerRemoveItem(cid, dropitem, 1) --remove the item from helmet slot
				doAddContainerItem(corpse.uid, iid, 1) -- ADD THE LOST ITEM INTO DEAD BODY. (as it is making it drop
				elseif v >= 95 then -- if random number is above 95 (95-100)
				doPlayerRemoveItem(cid, iid, 1) --remove item from game permanently
				end
			end
		end
	end
return true
end
