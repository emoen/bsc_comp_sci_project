MACHINE           ATM

SEES
	GlobalATM2

INCLUDES
	bankSystem4

VARIABLES
	accNr,         
	ATMData, 
	confirm_transaction, 
	req_deposit, req_withdraw

INVARIANT         
	ATMData : accountNumber --> NAT	&
	confirm_transaction <: transactionId 

	

INITIALISATION   
	accNr, ATMData, confirm_transaction := {},{},{}

OPERATIONS

  ok <-- request_deposit(acc : accNr & amount : NAT) =
	BEGIN
		ANY xx
		WHERE
			xx : transactionId &
			xx /: dom(req_deposit) &
			xx /: confirm_transaction
		THEN
			req_deposit := req_deposit \/ {xx |-> (acc |-> amount)} ||
			ok := send_request({xx |-> (acc |-> amount)})
		END
	END;

  ATM_deposit =
	BEGIN
		ANY xx, yy, zz 
		WHERE
			xx : transactionId &
			yy : accountNumber &
			zz : NAT &
			xx /: confirm_transaction &
			yy |-> zz /: ATMData &
			yy |-> zz /: networkData &
			xx |-> (yy |-> zz) : req_deposit
		THEN
			send_transaction(yy,zz) ||
			ATMData(yy) := zz ||
			totalBalance(yy) := totalBalance(yy) + zz	
		END
	END
END
