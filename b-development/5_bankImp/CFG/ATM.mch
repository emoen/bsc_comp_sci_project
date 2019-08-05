MACHINE           ATM

SEES	Bool_TYPE

INCLUDES
	Globals

VARIABLES         
	con, pubDecrypt

INVARIANT         
	con : BOOL &
	pubDecrypt : 1..6

INITIALISATION    
	con, pubDecrypt := FALSE, 6

OPERATIONS

  connecting = con :: BOOL;
	/*connect is a keywork in C*/

  ok <-- shut_down = 
	BEGIN
		ok :: BOOL ||
		con := FALSE
	END;

  accNr, rep <-- create_account =
	PRE
		con = TRUE
	THEN
		accNr :: 0..maxAccounts ||
		rep :: BOOL
	END;

  ok, newBalance <-- deposit(acc, amount) =
	PRE
		acc : 0..maxAccounts &
		amount : NAT1 &
		con = TRUE
	THEN
		ok :: BOOL ||
		newBalance :: NAT
	END;

  ok <-- withdraw(acc, amount) =
	PRE
	 	acc : 0..maxAccounts &
		amount : NAT1 &
		con = TRUE
	THEN
		ok :: BOOL 
	END;

  rr <-- isaccount(acc) =
	PRE
		acc : 0..maxAccounts &
		con = TRUE
	THEN
		rr :: BOOL
	END;

  bal <-- getbalance(acc) =
	PRE
		acc : 0..maxAccounts &
		con = TRUE
	THEN
		bal :: 0..MAXINT
	END
END
