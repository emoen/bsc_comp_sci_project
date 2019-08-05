(publicDecrypt_VAL_NVAR(vv;?) == (vv : NAT));
(publicDecrypt_STO_NVAR(?;vv) == (vv : NAT));
(publicDecrypt_MIN_NVAR(uu;vv) == (uu : NAT & vv : NAT));
(publicDecrypt_MAX_NVAR(uu;vv) == (uu : NAT & vv : NAT));
(publicDecrypt_PRE_INC_NVAR(bb;?) == (bb : BOOL));
(publicDecrypt_INC_NVAR(?;?) == ?);
(publicDecrypt_PRE_DEC_NVAR(bb;?) == (bb : BOOL));
(publicDecrypt_DEC_NVAR(?;?) == ?);
(publicDecrypt_PRE_ADD_NVAR(bb;vv) == (bb : BOOL & vv : NAT));
(publicDecrypt_ADD_NVAR(?;vv) == (vv : NAT));
(publicDecrypt_PRE_MUL_NVAR(bb;vv) == (bb : BOOL & vv : NAT));
(publicDecrypt_MUL_NVAR(?;vv) == (vv : NAT));
(publicDecrypt_PRE_SUB_NVAR(bb;vv) == (bb : BOOL & vv : NAT));
(publicDecrypt_SUB_NVAR(?;vv) == (vv : NAT));
(publicDecrypt_PRE_DIV_NVAR(bb;vv) == (bb : BOOL & vv : NAT));
(publicDecrypt_DIV_NVAR(?;vv) == (vv : NAT));
(publicDecrypt_PRE_MOD_NVAR(bb;vv) == (bb : BOOL & vv : NAT));
(publicDecrypt_MOD_NVAR(?;vv) == (vv : NAT));
(publicDecrypt_EQL_NVAR(bb;vv) == (bb : BOOL & vv : NAT));
(publicDecrypt_NEQ_NVAR(bb;vv) == (bb : BOOL & vv : NAT));
(publicDecrypt_GTR_NVAR(bb;vv) == (bb : BOOL & vv : NAT));
(publicDecrypt_GEQ_NVAR(bb;vv) == (bb : BOOL & vv : NAT));
(publicDecrypt_SMR_NVAR(bb;vv) == (bb : BOOL & vv : NAT));
(publicDecrypt_LEQ_NVAR(bb;vv) == (bb : BOOL & vv : NAT));
(publicDecrypt_SAV_NVAR(?;?) == ?);
(publicDecrypt_RST_NVAR(?;?) == ?);
(publicDecrypt_SAVN_NVAR(?;?) == ?);
(publicDecrypt_RSTN_NVAR(?;?) == ?)
|
(maxint : NAT);
(publicDecrypt_Nvar : NAT)|
(maxint)
