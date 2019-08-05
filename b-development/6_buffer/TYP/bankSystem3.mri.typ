(request_deposit(?;acc , amount) == (acc : NAT & amount : NAT));
(request_withdraw(?;acc , amount) == (acc : NAT & amount : NAT));
(ATM_deposit(?;?) == ?);
(Bank_deposit(?;?) == ?);
(ATM_withdraw(?;?) == ?);
(Bank_withdraw(?;?) == ?);
(network_goes_down(?;?) == ?);
(corrupt_network(?;?) == ?)
|
(maxAccounts : NAT);
(transactionId : POW(NAT));
(accountNumber : POW(NAT));
(confirm_withdrawal : POW(NAT));
(confirm_deposit : POW(NAT));
(req_withdraw : POW(NAT*(NAT*NAT)));
(req_deposit : POW(NAT*(NAT*NAT)));
(networkData : POW(NAT*NAT));
(ATMData : POW(NAT*NAT));
(totalBalance : POW(NAT*NAT));
(accountBalance : POW(NAT*NAT))|
(?)
