(create_account(accNr , rep;?) == (accNr : NAT & rep : BOOL));
(deposit(ok , newBalance;acc , amount) == (amount : NAT & acc : NAT & ok : BOOL & newBalance : NAT));
(withdraw(ok;acc , amount) == (amount : NAT & acc : NAT & ok : BOOL));
(isaccount(rr;acc) == (acc : NAT & rr : BOOL));
(getbalance(bal;acc) == (acc : NAT & bal : NAT))
|
(maxAccounts : NAT);
(accountNumber : POW(NAT));
(account : POW(NAT*NAT));
(accNr_Narr : POW(NAT*NAT));
(count_Nvar : NAT)|
(?)
