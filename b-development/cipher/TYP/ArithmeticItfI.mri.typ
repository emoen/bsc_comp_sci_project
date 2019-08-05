(main(?;?) == ?)
|
(given(Arithmetic_Ops));
(given_enum(Arithmetic_Ops(Arithmetic_Menu_OP , exp_op_OP , Quit_OP)));
(Arithmetic_Menu_OP : Arithmetic_Ops);
(exp_op_OP : Arithmetic_Ops);
(Quit_OP : Arithmetic_Ops);
(given(SCALAR));
(given(BOOL));
(given_enum(BOOL(FALSE , TRUE)));
(FALSE : BOOL);
(TRUE : BOOL);
(given(CHAR));
(given(STRING));
(true);
(prime : POW(NAT));
(exp : POW(NAT*NAT*NAT));
(Itf_token_io.TOKEN == SCALAR);
(SCALAR = NAT);
(SCALAR == NAT);
(STRING = seq(CHAR));
(STRING == seq(CHAR));
(string1 : POW(NAT*CHAR));
(string1 : seq(CHAR));
(string2 : POW(NAT*CHAR));
(string2 : seq(CHAR));
(string3 : POW(NAT*CHAR));
(string3 : seq(CHAR))|
(?)
