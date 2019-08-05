MACHINE           bankSystem3

INCLUDES
	Globals

SEES
	Bool_TYPE

VARIABLES         
	accountNumber, 
	accountBalance, totalBalance, 
	ATMData, networkData, 
	transactionId,
	req_deposit,
	req_withdraw,
	confirm_deposit, confirm_withdrawal

INVARIANT
	accountNumber <: ACCOUNTS &         
	accountBalance : accountNumber --> NAT &
	totalBalance : accountNumber --> NAT & 
	ATMData : accountNumber --> NAT &
	networkData : accountNumber --> NAT &

	transactionId <: 1..100 &

	req_deposit : transactionId --> (accountNumber * NAT) &
	req_withdraw : transactionId --> (accountNumber * NAT) &
	
	confirm_transaction <: transactionId &

	!(aa).(aa : accountNumber =>
		totalBalance(aa) = accountBalance(aa) + ATMData(aa) )

INITIALISATION
	accountNumber,
	accountBalance, totalBalance, 
	ATMData, networkData,
	transactionId,
	req_deposit, req_withdraw,
	confirm_deposit, confirm_withdrawal := {},{},{},{},{},{},{},{},{},{}

OPERATIONS

  request_deposit(acc : accountNumber & amount : NAT ) =
	BEGIN
		ANY xx
		WHERE 
			xx : transactionId &
			xx /: dom(req_deposit) &
			xx /: confirm_transaction
		THEN
			req_deposit := req_deposit \/ {xx |-> (acc |-> amount)} 
		END
	END;

  request_withdraw(acc : accountNumber & amount : NAT ) =
	BEGIN
		ANY xx
		WHERE 
			xx : transactionId &
			xx /: dom(req_withdraw) &
			xx /: confirm_transaction
		THEN
			req_withdraw := req_withdraw \/ {xx |-> (acc |-> amount)}
		END
	END;

  ATM_deposit =
	BEGIN
		ANY xx, yy,zz
		WHERE 
			xx : transactionId &
			yy : accountNumber &
			zz : NAT &
			xx /: confirm_transaction &
			yy |-> zz /: ATMData &
			yy |-> zz /: networkData &
			xx |-> (yy |-> zz) : req_deposit

		THEN
			networkData(yy) := zz ||
			ATMData(yy) := zz ||
			totalBalance(yy) := totalBalance(yy) + zz 
		END
	END;

  Bank_deposit =
	BEGIN
		ANY xx, yy, zz
		WHERE 
			xx : transactionId &
			yy : accountNumber &
			zz : NAT &
			xx /: confirm_transaction &
			xx |-> yy : ATMData &
			yy |-> zz : networkData &
			xx |-> (yy |-> zz) : req_deposit &
			ATMData(yy) = networkData(yy)
		THEN
			networkData := networkData - {yy |-> zz} ||
			ATMData := ATMData - {yy |-> zz} ||
			accountBalance(yy) := accountBalance(yy) + zz ||
			confirm_transaction := confirm_transaction \/ {xx}
		END
	END;

  ATM_withdraw =
	BEGIN
		ANY xx, yy, zz
		WHERE
			xx : transactionId &
			yy : accountNumber &
			zz : NAT &
			xx /: confirm_transaction &
			xx |-> yy /: ATMData &
			yy |-> zz /: networkData &
			xx |-> (yy |-> zz) : req_withdraw &
			zz <= accountBalance(yy)
		THEN
			networkData(yy) := zz ||
			ATMData(yy) := zz ||
			totalBalance(yy) := totalBalance(yy) - zz 
		END
	END;

  Bank_withdraw = 
	BEGIN
		ANY xx, yy, zz
		WHERE
			xx : transactionId &
			yy : accountNumber &
			zz : NAT &
			xx /: confirm_transaction &
			xx |-> (yy |-> zz) : req_withdraw &
			yy |-> zz : networkData &
			zz <= accountBalance(yy) &
			ATMData(yy) = networkData(yy)
		THEN
			networkData := networkData - {yy |-> zz} ||
			ATMData := ATMData - {yy |-> zz} ||
			accountBalance(yy) := accountBalance(yy) - zz ||
			confirm_transaction := confirm_transaction \/ {xx}
		END
	END;


  network_goes_down =
	networkData := {};

  corrupt_network =
	BEGIN
		ANY xx, vv WHERE
			xx : accountNumber &
			xx : dom(networkData) &
			vv : NAT
		THEN
			networkData(xx) := networkData(xx) - vv
		END
	END
END
