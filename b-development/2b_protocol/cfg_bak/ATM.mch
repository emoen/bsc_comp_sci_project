MACHINE           ATM
	
SEES
	Globals
	
INCLUDES
	Client

OPERATIONS

	connect = conrq;

	ans <-- withdraw(acc, amount) =
		PRE
			acc : NAT &
			amount : NAT1
		THEN
				ans <-- cwithdraw(acc, amount)
		END;
		
	aa <-- create_acc(balance) =
		PRE
			balance : NAT
		THEN
			aa <-- ccreate_acc(balance)
		END;
	
	rr <-- isaccount(acc) =
		PRE
			acc : NAT
		THEN
			rr <-- cisaccount(acc)
		END		
END
