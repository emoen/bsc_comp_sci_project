(ATM_create_account(status;?) == (status : BOOL));
(ATM_deposit(status;acc , amount) == (status : BOOL & acc : NAT & amount : NAT));
(ATM_withdraw(status;acc , amount) == (status : BOOL & acc : NAT & amount : NAT));
(ATM_isaccount(status;acc) == (status : BOOL & acc : NAT));
(ATM_getbalance(status;acc) == (status : BOOL & acc : NAT));
(check_clientreq(num , ok , op;?) == (op : NAT & ok : BOOL & num : NAT))
|
(maxAccounts : NAT);
(accountNumber : POW(NAT));
(account : POW(NAT*NAT));
(creq : POW(NAT*NAT));
(creq : seq(NAT));
(ff : POW(NAT*NAT));
(ff : seq(NAT))|
(?)
