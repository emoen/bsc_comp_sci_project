MACHINE           Receiver

INCLUDES	SecureNetwork

USES 		Bool_TYPE

VARIABLES         
	inval

INVARIANT         
	inval : MESSAGE

/*
INITIALISATION
	inval := {} 
does not analyse!! Type of lhs and rhs disagree
*/


OPERATIONS

  rep <-- do_receive =
	inval, rep <-- receive;

  rep <-- can_do_send =
	BEGIN
		ANY bb
		WHERE bb : MESSAGE
		THEN
			rep <-- send(bb)
		END
	END
END
