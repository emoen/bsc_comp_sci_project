(con_VAL_NVAR(vv;?) == (vv : NAT));
(con_STO_NVAR(?;vv) == (vv : NAT));
(con_MIN_NVAR(uu;vv) == (uu : NAT & vv : NAT));
(con_MAX_NVAR(uu;vv) == (uu : NAT & vv : NAT));
(con_PRE_INC_NVAR(bb;?) == (bb : BOOL));
(con_INC_NVAR(?;?) == ?);
(con_PRE_DEC_NVAR(bb;?) == (bb : BOOL));
(con_DEC_NVAR(?;?) == ?);
(con_PRE_ADD_NVAR(bb;vv) == (bb : BOOL & vv : NAT));
(con_ADD_NVAR(?;vv) == (vv : NAT));
(con_PRE_MUL_NVAR(bb;vv) == (bb : BOOL & vv : NAT));
(con_MUL_NVAR(?;vv) == (vv : NAT));
(con_PRE_SUB_NVAR(bb;vv) == (bb : BOOL & vv : NAT));
(con_SUB_NVAR(?;vv) == (vv : NAT));
(con_PRE_DIV_NVAR(bb;vv) == (bb : BOOL & vv : NAT));
(con_DIV_NVAR(?;vv) == (vv : NAT));
(con_PRE_MOD_NVAR(bb;vv) == (bb : BOOL & vv : NAT));
(con_MOD_NVAR(?;vv) == (vv : NAT));
(con_EQL_NVAR(bb;vv) == (bb : BOOL & vv : NAT));
(con_NEQ_NVAR(bb;vv) == (bb : BOOL & vv : NAT));
(con_GTR_NVAR(bb;vv) == (bb : BOOL & vv : NAT));
(con_GEQ_NVAR(bb;vv) == (bb : BOOL & vv : NAT));
(con_SMR_NVAR(bb;vv) == (bb : BOOL & vv : NAT));
(con_LEQ_NVAR(bb;vv) == (bb : BOOL & vv : NAT));
(con_SAV_NVAR(?;?) == ?);
(con_RST_NVAR(?;?) == ?);
(con_SAVN_NVAR(?;?) == ?);
(con_RSTN_NVAR(?;?) == ?)
|
(maxint : NAT);
(con_Nvar : NAT)|
(maxint)
