MACHINE           Sender

INCLUDES	SecureNetwork

USES 		Bool_TYPE

VARIABLES         
	inval

INVARIANT         
	inval : MESSAGE

OPERATIONS

  rep <-- do_send =
	BEGIN
		ANY bb
		WHERE bb : MESSAGE
		THEN
			rep <-- send(bb)
		END
	END;

  rep <-- can_do_receive =
	inval, rep <-- receive 

END
