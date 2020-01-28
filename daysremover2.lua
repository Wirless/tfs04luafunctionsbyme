function onTime()
			db.executeQuery("UPDATE accounts SET golden_days = golden_days - 1 WHERE golden_days > 0;")
			local res = db.storeQuery("SELECT COUNT(*) FROM `golden_days` WHERE `Golden_days` >= 1")
			print(result.getNumber(res, "COUNT(*)"))
			print("golden days removed from all account")	
    return true
end