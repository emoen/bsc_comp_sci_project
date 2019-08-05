(create_acc(aa;?) == (aa : NAT));
(deposit(ans;acc , amount) == (ans : NAT & acc : NAT & amount : NAT));
(withdraw(ans;acc , amount) == (ans : YESNO & acc : NAT & amount : NAT));
(isaccount(rr;acc) == (rr : YESNO & acc : NAT))
|
(maxAccounts : NAT);
(accountNumber : POW(NAT));
(account : POW(NAT*NAT))|
(maxAccounts)
