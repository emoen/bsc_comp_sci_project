MACHINE           GlobalATM

SEES
	ATM

VARIABLES         
	accountNumber,
	transactionId

INVARIANT     
	accountNumber <: 1..100 &
	totalBalance : accountNumber --> NAT &

	transactionId <: 1..100 &

	!(aa).(aa : accountNumber =>
		totalBalance(aa) = accountBalance(aa) + ATMData(aa) )

INITIALISATION    
	accountNumber, transactionId := {}, {}

END
