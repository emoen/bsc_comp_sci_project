MACHINE           
	CommsDefs
	
SETS
/*	CLIENT_STATE = {conpending};
	SERVER_STATE = {conrequest};
	PROTOCOL_STATE = {have_report};*/
	STATE = {idle, conpending, conrequest, have_report, connected};
	MESSAGES = {con, true, false}

CONSTANTS
	buffsize
	
PROPERTIES
	buffsize = 100

END
