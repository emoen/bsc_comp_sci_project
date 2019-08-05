MACHINE           
	Server

SEES
	Bool_TYPE, CommsDefs

VARIABLES
	sstate

INVARIANT
	sstate : STATE 

INITIALISATION 
	sstate := idle

OPERATIONS

sinit =
	sstate := idle;

	
  ok <-- conin =
	IF sstate = idle THEN
		sstate := conrequest ||
		ok := TRUE
	ELSE	ok := FALSE
	END;
		
  msg <-- server_con_report =
	IF sstate = conrequest THEN
		ANY pp
		WHERE pp : BOOL THEN
			IF pp = TRUE THEN
				sstate := connected ||
				msg := TRUE
			ELSE
				sstate := idle ||
				msg := FALSE
			END			
		END
	END
END
