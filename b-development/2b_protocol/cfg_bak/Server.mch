MACHINE           
	Server

SEES
	Bool_TYPE, CommsDefs, Globals
	
INCLUDES
	Bank(10)

VARIABLES
	sstate

INVARIANT
	sstate : STATE

INITIALISATION 
	sstate := idle

OPERATIONS

	sinit =
		BEGIN
			sstate := idle
		END;
	
	ok <-- conin =
		IF
			sstate = idle
		THEN
			ANY
				pp
			WHERE
				pp : BOOL
			THEN
				ok := pp ||
				IF 
					pp = TRUE
				THEN
					sstate := connected
				END
			END
		END;
		
	aa <-- screate_acc(balance) =
		PRE
			balance : NAT	&
			sstate = connected			
		THEN
			aa <-- create_acc(balance)
		END;
		
	/*new <-- sdeposit(acc, amount) =
		PRE
			acc : NAT & amount : NAT &
			sstate = connected		
		THEN
			new <-- deposit(acc, amount)
		END;
		*/
	ans <-- swithdraw(acc, amount) =
		PRE
			acc : NAT & amount : NAT &
			sstate = connected			
		THEN
			ans <--	withdraw(acc, amount)
		END;
	
	rr <-- sisaccount(acc) =
		PRE
			acc : NAT &
			sstate = connected			
		THEN
			rr <-- isaccount(acc)
		END
END
