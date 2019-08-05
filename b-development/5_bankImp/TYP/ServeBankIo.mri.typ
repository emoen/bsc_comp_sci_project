(ServeBank_Menu(?;?) == ?);
(Get_ServeBank_Op(op;?) == (op : ServeBank_Ops))
|
(given(ServeBank_Ops));
(given_enum(ServeBank_Ops(ServeBank_Menu_OP , startServer_OP , listenForUser_OP , Quit_OP)));
(ServeBank_Menu_OP : ServeBank_Ops);
(startServer_OP : ServeBank_Ops);
(listenForUser_OP : ServeBank_Ops);
(Quit_OP : ServeBank_Ops)|
(?)
