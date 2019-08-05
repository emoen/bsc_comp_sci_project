MACHINE           
	Client

SEES
	Bool_TYPE, CommsDefs

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
		
	ok <-- conrq =
		IF
			cstate = idle
		THEN
			cstate := conp ||
			ok := TRUE
		ELSE
			ok := FALSE
	END;
	
	ok <-- concf(response) =
		PRE
			response : BOOL 
		THEN
			IF
				cstate = conp
			THEN
				IF 
					response = TRUE
				THEN
					cstate := connected
				ELSE
					cstate := idle 
				END ||
				ok := TRUE
			ELSE	
				ok := FALSE
			END
		END
END
