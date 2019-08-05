
MACHINE           
	Client

SEES
	Bool_TYPE, CommsDefs

VARIABLES
	clientstate

INVARIANT         
	clientstate : STATE

INITIALISATION    
	clientstate := idle

OPERATIONS
		
  cinit =
	clientstate := idle;
		
  ok <-- client_con_request =
	IF clientstate = idle THEN
		clientstate := conpending ||
		ok := TRUE
	ELSE	ok := FALSE
	END;
	
  ok <-- client_con_report(response : BOOL) =
	IF clientstate = conpending THEN
		IF response = TRUE THEN
			clientstate := connected
		ELSE	clientstate := idle 
		END ||
		ok := TRUE
	ELSE	ok := FALSE
	END;

	state <-- query_cstate = state := clientstate
END
