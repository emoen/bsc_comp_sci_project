(Arithmetic_Menu(?;?) == ?);
(Get_Arithmetic_Op(op;?) == (op : Arithmetic_Ops))
|
(given(Arithmetic_Ops));
(given_enum(Arithmetic_Ops(Arithmetic_Menu_OP , exp_op_OP , Quit_OP)));
(Arithmetic_Menu_OP : Arithmetic_Ops);
(exp_op_OP : Arithmetic_Ops);
(Quit_OP : Arithmetic_Ops);
(string1 : POW(NAT*CHAR));
(string1 : seq(CHAR))|
(?)
