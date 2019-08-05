MACHINE           
	Client

SEES
	Bool_TYPE, CommsDefs, Globals
	
INCLUDES 
	Server

VARIABLES
	cstate

INVARIANT         
	cstate : STATE

INITIALISATION    
	cstate := idle

OPERATIONS
		
  cinit =
	BEGIN
		cstate := idle
	END;
		
	conrq =
		IF
			cstate = idle
		THEN
			ANY
				ok
			WHERE
				ok : BOOL
			THEN
				ok <-- conin ||
				IF 
					ok = TRUE
				THEN
					cstate := connected
				END
			END 
	END;

		
	aa <-- ccreate_acc(balance) =
		PRE
			balance : NAT	&
			cstate = connected
		THEN
			aa <-- screate_acc(balance)
		END;
		
		
	/*new <-- pdeposit(acc, amount) =
		PRE
			acc : NAT & amount : NAT &
			cstate = connected		
		THEN
			new <-- pdeposit(acc, amount)
		END;
		*/
	ans <-- cwithdraw(acc, amount) =
		PRE
			acc : NAT & amount : NAT &
			cstate = connected			
		THEN
			ans <--	swithdraw(acc, amount)
		END;
	
	rr <-- cisaccount(acc) =
		PRE
			acc : NAT &
			cstate = connected			
		THEN
			rr <-- sisaccount(acc)
		END
END
