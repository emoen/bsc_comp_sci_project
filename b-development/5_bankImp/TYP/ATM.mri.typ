(connecting(?;?) == ?);
(shut_down(ok;?) == (ok : BOOL));
(create_account(accNr , rep;?) == (rep : BOOL & accNr : NAT));
(deposit(ok , newBalance;acc , amount) == (newBalance : NAT & ok : BOOL & acc : NAT & amount : NAT));
(withdraw(ok;acc , amount) == (ok : BOOL & acc : NAT & amount : NAT));
(isaccount(rr;acc) == (rr : BOOL & acc : NAT));
(getbalance(bal;acc) == (bal : NAT & acc : NAT))
|
(maxAccounts : NAT);
(pubDecrypt : NAT);
(con : BOOL)|
(?)
