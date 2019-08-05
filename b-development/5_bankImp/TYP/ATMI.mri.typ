(connecting(?;?) == ?);
(shut_down(ok;?) == (ok : BOOL));
(create_account(accNr , rep;?) == (accNr : NAT & rep : BOOL));
(deposit(ok , newBalance;acc , amount) == (amount : NAT & acc : NAT & ok : BOOL & newBalance : NAT));
(withdraw(ok;acc , amount) == (amount : NAT & acc : NAT & ok : BOOL));
(isaccount(rr;acc) == (acc : NAT & rr : BOOL));
(getbalance(bal;acc) == (acc : NAT & bal : NAT))
|
(maxAccounts : NAT);
(pubDecrypt : NAT);
(con : BOOL);
(given(SCALAR \/ BOOL));
(outbufsize : NAT);
(outptr : NAT);
(in : NAT);
(inptr : NAT);
(con_Nvar : NAT);
(encrypt : POW(NAT*NAT));
(decrypt : POW(NAT*NAT))|
(?)
