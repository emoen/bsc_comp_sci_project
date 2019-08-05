(create_account(accNr , rep;?) == (rep : BOOL & accNr : NAT));
(bank_deposit(newBalance , rep;acc , amount) == (rep : BOOL & newBalance : NAT & acc : NAT & amount : NAT));
(deposit_to_network(?;acc , amount) == (acc : NAT & amount : NAT));
(deposit_to_ATM(?;acc , amount) == (acc : NAT & amount : NAT));
(bank_withdraw(ok;acc , amount) == (ok : BOOL & acc : NAT & amount : NAT));
(withdrawal_to_network(?;acc , amount) == (acc : NAT & amount : NAT));
(withdrawal_to_ATM(?;acc , amount) == (acc : NAT & amount : NAT));
(isaccount(rr;acc) == (rr : BOOL & acc : NAT));
(getbalance(bal;acc) == (bal : NAT & acc : NAT))
|
(maxAccounts : NAT);
(deposit_flag : NAT);
(withdraw_flag : NAT);
(accountNumber : POW(NAT));
(ATMBalance : POW(NAT*NAT));
(networkBalance : POW(NAT*NAT));
(totalBalance : POW(NAT*NAT));
(accountBalance : POW(NAT*NAT))|
(?)
