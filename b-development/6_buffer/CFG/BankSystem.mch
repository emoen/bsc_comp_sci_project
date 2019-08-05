MACHINE           BankSystem

INCLUDES
	Globals

SEES
	Bool_TYPE

VARIABLES         
	accountBalance, totalBalance,
	networkBalance, networkAccount,
	ATMBalance, ATMAccount,
	accountNumber

INVARIANT
	accountNumber <: ACCOUNTS &         

/*The balance as it is stored in the bank */
	accountBalance : accountNumber --> NAT &

/*There may be some balance in the network */
	networkAccount : iseq(accountNumber) &
	networkBalance : accountNumber --> NAT &
	ran(networkAccount) = dom(networkBalance) & 


/*There may be some balance in the ATM machine */
	ATMAccount : iseq(accountNumber) &
	ATMBalance : accountNumber --> NAT &
	ran(ATMAccount) = dom(ATMBalance) &

/* The answere balance, a virtual balance which is only updated
	after a 'handshake' between the ATM and the bank */
	totalBalance : accountNumber --> NAT &

/* No money is lost during a transaction */
	!(aa).(aa : accountNumber =>
		totalBalance(aa) = accountBalance(aa) 
			+ networkBalance(aa) + ATMBalance(aa) )
INITIALISATION
	accountNumber, accountBalance, 
	networkAccount, networkBalance,
	ATMAccount, ATMBalance, totalBalance := {}, {}, <>, {}, <>, {}, {}

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
	IF accountBalance(acc) < MAXINT - amount THEN
		networkBalance := {acc} <<| networkBalance ||
		networkAccount := networkAccount /|\ (networkAccount~(acc)-1) ^
					networkAccount \|/ networkAccount~(acc) ||

		accountBalance(acc) := accountBalance(acc) + amount ||

		totalBalance(acc) := totalBalance(acc) + amount ||

		newBalance := accountBalance(acc) + amount ||
		rep := TRUE
	ELSE 
		rep := FALSE ||
		newBalance := 0
	END;

  deposit_to_network(acc :accountNumber & amount : NAT1) =
	PRE
		acc /: ran(networkAccount) &
		acc /: dom(networkBalance) 
	THEN
		ATMBalance := {acc} <<| ATMBalance ||
		ATMAccount := ATMAccount /|\ (ATMAccount~(acc)-1) ^
					ATMAccount \|/ ATMAccount~(acc) ||
		networkBalance(acc) := amount ||
		networkAccount := networkAccount <- acc
	END;

  deposit_to_ATM(acc :accountNumber & amount : NAT1) =
	PRE
		acc /: ran(ATMAccount) &
		acc /: dom(ATMBalance) 
	THEN
		ATMBalance(acc) := amount ||
		ATMAccount := ATMAccount <- acc
	END;

  ok <-- bank_withdraw(acc :accountNumber & amount : NAT) =
	PRE
		acc /: ran(networkAccount) &
		acc /: dom(networkBalance)
	THEN
		IF amount <= accountBalance(acc) THEN
			accountBalance(acc) := accountBalance(acc) - amount ||
	
			networkBalance(acc) := amount ||
			networkAccount := networkAccount <- acc ||

			ok := TRUE 
		ELSE	ok := FALSE
		END
	END;

  withdrawal_to_network(acc :accountNumber & amount : NAT) =
	PRE
		acc /: ran(ATMAccount) &
		acc /: dom(ATMBalance)
	THEN
		networkBalance := {acc} <<| networkBalance ||
		networkAccount := networkAccount /|\ (networkBalance~(acc)-1) ^
					networkBalance \|/ networkBalance~(acc) ||

		ATMBalance(acc) := amount ||
		ATMAccount := ATMAccount <- acc
	END;

  withdrawal_to_ATM(acc :accountNumber & amount : NAT) =
	BEGIN
/*or money_to_customer*/
		IF amount <= totalBalance(acc) THEN
			ATMBalance := {acc} <<| ATMBalance ||
			ATMAccount := ATMAccount /|\ (ATMBalance~(acc)-1) ^
						ATMBalance \|/ ATMBalance~(acc) ||		

			totalBalance(acc) := totalBalance(acc) - amount
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
