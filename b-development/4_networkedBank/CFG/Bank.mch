/* Why does'nt the toolkit provide a set Z over the whole
set of integers, positive and negative?? 

Peculiarity: -0 is not defined as 0. and consequently it
does not analyse1
*/

MACHINE           
	Bank

SEES 
	Bool_TYPE

INCLUDES
	Globals

DEFINITIONS
	RES == (accountNumber, account := {}, {})

VARIABLES         
	account, accountNumber

INVARIANT        
	accountNumber <: ACCOUNTS &
	account : accountNumber --> NAT &
	dom(account) = accountNumber
	
INITIALISATION    
	RES

OPERATIONS

  accNr, rep <-- create_account =
	IF accountNumber /= ACCOUNTS THEN
		rep := TRUE ||
		ANY acc
		WHERE 
			acc : ACCOUNTS - accountNumber 
		THEN
			accNr := acc ||
			accountNumber := accountNumber \/ {acc} ||
			account(acc) := 0
		END
	ELSE	rep := FALSE ||
		accNr := 0	
	END;

	ok, newBalance <-- deposit(acc , amount) =
		PRE
			acc : accountNumber & 
			amount : NAT1
		THEN
			IF account(acc) < MAXINT - amount THEN
				account(acc) := account(acc) + amount ||
/* how do I know that newBalance is not going to be twice the mount?
In ansii C this behaviour is undefined ( &'s within a if/while statement)
where assignment is done within an if test.
*/
				newBalance := account(acc) + amount ||
				ok := TRUE
			ELSE 
				ok := FALSE ||
				newBalance := 0
			END
		END;
		
	ok <--withdraw(acc, amount) =
		PRE
			acc : accountNumber &
			amount : NAT
		THEN
			IF 
				amount <= account(acc)
			THEN
				account(acc) := account(acc) - amount ||
				ok := TRUE 
			ELSE
				ok := FALSE
			END
		END;
	
	rr <-- isaccount(acc) =
		PRE
			acc : ACCOUNTS
		THEN
			IF acc : accountNumber
			THEN
				rr := TRUE
			ELSE
				rr := FALSE
			END
		END;
		
	bal <-- getbalance(acc) =
		PRE	
			acc : accountNumber
		THEN
			bal := account(acc)
		END
END
