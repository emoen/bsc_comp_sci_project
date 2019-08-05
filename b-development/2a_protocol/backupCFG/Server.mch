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
		BEGIN
			sstate := idle
		END;
	
	ok <-- conin =
		IF
			sstate = idle
		THEN
			sstate := conpp ||
			ok := TRUE
		ELSE
			ok := FALSE
		END;
		
	msg <-- conrp(pp) =
		PRE 
			pp : BOOL 
		THEN
			IF 
				sstate = conpp 
			THEN
				IF 
					pp = TRUE 
				THEN
					sstate := connected ||
					msg := TRUE
				ELSE
					sstate := idle ||
					msg := FALSE
				END			
			END
		END
END
