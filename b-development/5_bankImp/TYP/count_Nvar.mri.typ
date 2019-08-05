(count_VAL_NVAR(vv;?) == (vv : NAT));
(count_STO_NVAR(?;vv) == (vv : NAT));
(count_MIN_NVAR(uu;vv) == (uu : NAT & vv : NAT));
(count_MAX_NVAR(uu;vv) == (uu : NAT & vv : NAT));
(count_PRE_INC_NVAR(bb;?) == (bb : BOOL));
(count_INC_NVAR(?;?) == ?);
(count_PRE_DEC_NVAR(bb;?) == (bb : BOOL));
(count_DEC_NVAR(?;?) == ?);
(count_PRE_ADD_NVAR(bb;vv) == (bb : BOOL & vv : NAT));
(count_ADD_NVAR(?;vv) == (vv : NAT));
(count_PRE_MUL_NVAR(bb;vv) == (bb : BOOL & vv : NAT));
(count_MUL_NVAR(?;vv) == (vv : NAT));
(count_PRE_SUB_NVAR(bb;vv) == (bb : BOOL & vv : NAT));
(count_SUB_NVAR(?;vv) == (vv : NAT));
(count_PRE_DIV_NVAR(bb;vv) == (bb : BOOL & vv : NAT));
(count_DIV_NVAR(?;vv) == (vv : NAT));
(count_PRE_MOD_NVAR(bb;vv) == (bb : BOOL & vv : NAT));
(count_MOD_NVAR(?;vv) == (vv : NAT));
(count_EQL_NVAR(bb;vv) == (bb : BOOL & vv : NAT));
(count_NEQ_NVAR(bb;vv) == (bb : BOOL & vv : NAT));
(count_GTR_NVAR(bb;vv) == (bb : BOOL & vv : NAT));
(count_GEQ_NVAR(bb;vv) == (bb : BOOL & vv : NAT));
(count_SMR_NVAR(bb;vv) == (bb : BOOL & vv : NAT));
(count_LEQ_NVAR(bb;vv) == (bb : BOOL & vv : NAT));
(count_SAV_NVAR(?;?) == ?);
(count_RST_NVAR(?;?) == ?);
(count_SAVN_NVAR(?;?) == ?);
(count_RSTN_NVAR(?;?) == ?)
|
(maxint : NAT);
(count_Nvar : NAT)|
(maxint)
