MACHINE           GlobalATM2

SETS
	accountNumber;
	transactionId

VARIABLES         
	totalBalance

INVARIANT     
	totalBalance : accountNumber --> NAT 

INITIALISATION    
	totalBalance := {}

END