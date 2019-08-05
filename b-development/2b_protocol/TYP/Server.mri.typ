(sinit(?;?) == ?);
(conin(ok;?) == (ok : BOOL));
(server_con_report(msg;?) == (msg : BOOL));
(screate_acc(ans;?) == (ans : NAT));
(sdeposit(new;acc , amount) == (new : NAT & acc : NAT & amount : NAT));
(swithdraw(ans;acc , amount) == (ans : YESNO & acc : NAT & amount : NAT));
(sisaccount(rr;acc) == (rr : YESNO & acc : NAT))
|
(accountNumber : POW(NAT));
(account : POW(NAT*NAT));
(sstate : STATE)|
(?)
