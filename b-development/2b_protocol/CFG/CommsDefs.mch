MACHINE           
	CommsDefs
	
SETS
	STATE = {idle, conpending, conrequest, have_report, connected};
	MESSAGES = {con, true, false}

CONSTANTS
	buffsize
	
PROPERTIES
	buffsize = 100

END
