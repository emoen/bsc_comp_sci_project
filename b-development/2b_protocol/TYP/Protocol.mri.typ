(pinit(?;?) == ?);
(pcon_request(ok_protocol , ok_client , ok_buffer;?) == (ok_buffer : BOOL & ok_client : BOOL & ok_protocol : BOOL));
(pcon_in(ok_protocol , ok_server , ok_buffer;?) == (ok_buffer : BOOL & ok_server : BOOL & ok_protocol : BOOL));
(pcon_report(ok_protocol , ok_server , ok_buffer;?) == (ok_buffer : BOOL & ok_server : BOOL & ok_protocol : BOOL));
(pcon_give_report(ok_protocol , ok_client , ok_buffer;?) == (ok_buffer : BOOL & ok_client : BOOL & ok_protocol : BOOL));
(prot_state(ps;?) == (ps : STATE));
(pcreate_acc(aa;?) == (aa : NAT));
(pdeposit(new;acc , amount) == (new : NAT & acc : NAT & amount : NAT));
(pwithdraw(ans;acc , amount) == (ans : YESNO & acc : NAT & amount : NAT));
(pisaccount(rr;acc) == (rr : YESNO & acc : NAT));
(query_pstate(rr;?) == (rr : STATE))
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
(p_state : STATE)|
(?)
