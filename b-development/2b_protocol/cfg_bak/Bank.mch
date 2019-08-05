MACHINE           
	Bank(maxAccounts)

SEES
	Globals

CONSTRAINTS
	maxAccounts : 1 .. 200000

DEFINITIONS
	ACCOUNTS == 1 .. maxAccounts
	
VARIABLES         
	account, accountNumber

INVARIANT        
	accountNumber <: ACCOUNTS &
	account : accountNumber >-> NAT
	

INITIALISATION    
	accountNumber, account := {}, {}

OPERATIONS

  aa <-- create_acc(balance) =
		PRE
			balance : NAT & /* here balance should be NAT*/
			accountNumber /= ACCOUNTS
		THEN
			ANY acc
			WHERE acc : ACCOUNTS - accountNumber
			THEN
				aa := acc ||
				accountNumber := accountNumber \/ {acc} ||
				account(acc) := balance
			END
		END;

	deposit(acc, amount) =
		PRE
			acc : accountNumber &
			amount : NAT1
		THEN
			account(acc) := account(acc) + amount
		END;
		
	ans <--withdraw(acc, amount) =
		 PRE
		 		acc : accountNumber &
				amount : NAT1 
			THEN
				IF amount <= account(acc)
				THEN
					account(acc) := account(acc) - amount ||
					ans := yes
				ELSE
					ans := no
				END
			END;
	
	rr <-- isaccount(acc) =
		PRE
			acc : ACCOUNTS
		THEN
			IF acc : accountNumber
			THEN
				rr := yes
			ELSE
				rr := no
			END
		END
END
