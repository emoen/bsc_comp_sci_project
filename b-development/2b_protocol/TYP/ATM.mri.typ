(get_protocol_state(?;?) == ?);
(deposit(ans;acc , amount) == (ans : YESNO & acc : NAT & amount : NAT));
(withdraw(ans;acc , amount) == (ans : YESNO & acc : NAT & amount : NAT));
(create_acc(aa;?) == (aa : NAT));
(isaccount(rr;acc) == (rr : YESNO & acc : NAT))
|
(clientstate : STATE);
(accountNumber : POW(NAT));
(account : POW(NAT*NAT));
(sstate : STATE);
(given(MESSAGES));
(buffsize : NAT);
(clientcontents : POW(NAT*MESSAGES));
(clientcontents : seq(MESSAGES));
(servercontents : POW(NAT*MESSAGES));
(servercontents : seq(MESSAGES));
(report : BOOL);
(p_state : STATE);
(atm_state : STATE)|
(?)
