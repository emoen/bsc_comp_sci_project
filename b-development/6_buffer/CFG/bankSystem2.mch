
MACHINE           bankSystem2

INCLUDES
	Globals

SEES
	Bool_TYPE

VARIABLES         
	accountNumber, 
	accountBalance, totalBalance,
	networkBalance, ATMBalance,
	withdraw_flag, deposit_flag

INVARIANT
/*
The sets representing network and ATM are unreliable
and at any time the sets may be substituted with {}.
This should not cause any data from beinng lost.
This specification we assume that the network set
may be substituted with {} at any time, not the ATM.
This will allow atm to request operations on bank, and
bank to confirm or reject messages from ATM. */

	accountNumber <: ACCOUNTS &         

/*The balance as it is stored in the bank */
	accountBalance : accountNumber --> NAT &

/*a withdrawal or deposit is stored on the network, 
and only one transaction for a given accountnumber may
be on the network */
	networkBalance : accountNumber --> NAT &

/*As for network */
	ATMBalance : accountNumber --> NAT &


/* The answere balance, a virtual balance which is only updated
   after a 'handshake' between the ATM and the bank */

	totalBalance : accountNumber --> NAT &

  	withdraw_flag : NAT &
	deposit_flag : NAT &

/* No money is lost during a transaction */
	!(aa).(aa : accountNumber =>
		totalBalance(aa) = accountBalance(aa) + ATMBalance(aa) )
INITIALISATION
	accountNumber, accountBalance, 
	networkBalance, ATMBalance, totalBalance,
	withdraw_flag, deposit_flag := {}, {}, {}, {}, {}, 0, 0

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
			accountBalance(acc) := 0 ||

			totalBalance(acc) := 0
		END
	ELSE	rep := FALSE ||
		accNr := 0	
	END;

  newBalance, rep <-- bank_deposit(acc : accountNumber & amount : NAT1) =
	PRE
		deposit_flag = 2
	THEN
		IF accountBalance(acc) < MAXINT - amount THEN
			networkBalance := {acc} <<| networkBalance ||
			accountBalance(acc) := accountBalance(acc) + amount ||
			totalBalance(acc) := totalBalance(acc) + amount ||
			deposit_flag := 0 ||

			newBalance := accountBalance(acc) + amount ||
			rep := TRUE
		ELSE 
			rep := FALSE ||
			newBalance := 0
		END
	END;

  deposit_to_network(acc :accountNumber & amount : NAT1) =
	PRE
		acc /: dom(networkBalance) &
		deposit_flag = 1
	THEN
		ATMBalance := {acc} <<| ATMBalance ||
		networkBalance(acc) := amount ||
		deposit_flag := 2
	END;

  deposit_to_ATM(acc :accountNumber & amount : NAT1) =
	PRE
		acc /: dom(ATMBalance) &
		deposit_flag = 0
	THEN
		ATMBalance(acc) := amount ||
		deposit_flag := 1
	END;

  ok <-- bank_withdraw(acc :accountNumber & amount : NAT) =
	PRE
		acc /: dom(networkBalance) &
		withdraw_flag = 0
	THEN
/* double check of amount as the amount requested
for withdrawal may have been changed on the network, and
also the server should always be in control */
		IF amount <= accountBalance(acc) THEN
			accountBalance(acc) := accountBalance(acc) - amount ||	
			networkBalance(acc) := amount ||
			withdraw_flag := 1 ||

			ok := TRUE 
		ELSE	ok := FALSE
		END
	END;

  withdrawal_to_network(acc :accountNumber & amount : NAT) =
	PRE
		acc /: dom(ATMBalance) &
		withdraw_flag = 1
	THEN
		networkBalance := {acc} <<| networkBalance ||
		ATMBalance(acc) := amount ||
		withdraw_flag := 2
	END;

  withdrawal_to_ATM(acc :accountNumber & amount : NAT) =
/*or money_to_customer */
	PRE
		withdraw_flag = 2
	THEN
/*Do not care who chechs the withdrawal against the amount to withdraw */	
		IF amount <= totalBalance(acc) THEN
			ATMBalance := {acc} <<| ATMBalance ||
			totalBalance(acc) := totalBalance(acc) - amount ||
			withdraw_flag := 0
		END
	END;
  
  rr <-- isaccount(acc : ACCOUNTS) =
	BEGIN
		IF acc : accountNumber THEN
			rr := TRUE
		ELSE	rr := FALSE
		END
	END;
		
  bal <-- getbalance(acc : accountNumber) =
	bal := accountBalance(acc)

END
