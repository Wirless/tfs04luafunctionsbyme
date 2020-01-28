function onTime()
			db.executeQuery("UPDATE accounts SET golden_days = golden_days - 1 WHERE golden_days > 0;")
			print("golden days removed from all account")	
    return true
end