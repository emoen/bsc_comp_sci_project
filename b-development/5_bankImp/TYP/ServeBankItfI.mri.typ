(main(?;?) == ?)
|
(given(ServeBank_Ops));
(given_enum(ServeBank_Ops(ServeBank_Menu_OP , startServer_OP , listenForUser_OP , Quit_OP)));
(ServeBank_Menu_OP : ServeBank_Ops);
(startServer_OP : ServeBank_Ops);
(listenForUser_OP : ServeBank_Ops);
(Quit_OP : ServeBank_Ops);
(given(SCALAR));
(given(BOOL));
(given_enum(BOOL(FALSE , TRUE)));
(FALSE : BOOL);
(TRUE : BOOL);
(given(CHAR));
(given(STRING));
(true);
(Itf_token_io.TOKEN == SCALAR);
(SCALAR = NAT);
(SCALAR == NAT);
(STRING = seq(CHAR));
(STRING == seq(CHAR));
(string1 : POW(NAT*CHAR));
(string1 : seq(CHAR))|
(?)
