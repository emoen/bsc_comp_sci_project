(accNr_TST_IDX_NARR(bb;ii) == (bb : BOOL & ii : NAT));
(accNr_MAX_IDX_NARR(vv;ii , jj) == (vv : NAT & ii : NAT & jj : NAT));
(accNr_MIN_IDX_NARR(vv;ii , jj) == (vv : NAT & ii : NAT & jj : NAT));
(accNr_VAL_NARR(vv;ii) == (vv : NAT & ii : NAT));
(accNr_STO_NARR(?;ii , vv) == (ii : NAT & vv : NAT));
(accNr_ADD_NARR(?;ii , vv) == (ii : NAT & vv : NAT));
(accNr_MUL_NARR(?;ii , vv) == (ii : NAT & vv : NAT));
(accNr_SUB_NARR(?;ii , vv) == (ii : NAT & vv : NAT));
(accNr_DIV_NARR(?;ii , vv) == (ii : NAT & vv : NAT));
(accNr_MOD_NARR(?;ii , vv) == (ii : NAT & vv : NAT));
(accNr_EQL_NARR(bb;ii , vv) == (bb : BOOL & ii : NAT & vv : NAT));
(accNr_NEQ_NARR(bb;ii , vv) == (bb : BOOL & ii : NAT & vv : NAT));
(accNr_GTR_NARR(bb;ii , vv) == (bb : BOOL & ii : NAT & vv : NAT));
(accNr_GEQ_NARR(bb;ii , vv) == (bb : BOOL & ii : NAT & vv : NAT));
(accNr_SMR_NARR(bb;ii , vv) == (bb : BOOL & ii : NAT & vv : NAT));
(accNr_LEQ_NARR(bb;ii , vv) == (bb : BOOL & ii : NAT & vv : NAT));
(accNr_SCH_LO_EQL_NARR(bb , ii;jj , kk , vv) == (ii : NAT & bb : BOOL & jj : NAT & kk : NAT & vv : NAT));
(accNr_SCH_LO_NEQ_NARR(bb , ii;jj , kk , vv) == (ii : NAT & bb : BOOL & jj : NAT & kk : NAT & vv : NAT));
(accNr_SCH_LO_GEQ_NARR(bb , ii;jj , kk , vv) == (ii : NAT & bb : BOOL & jj : NAT & kk : NAT & vv : NAT));
(accNr_SCH_LO_GTR_NARR(bb , ii;jj , kk , vv) == (ii : NAT & bb : BOOL & jj : NAT & kk : NAT & vv : NAT));
(accNr_SCH_LO_LEQ_NARR(bb , ii;jj , kk , vv) == (ii : NAT & bb : BOOL & jj : NAT & kk : NAT & vv : NAT));
(accNr_SCH_LO_SMR_NARR(bb , ii;jj , kk , vv) == (ii : NAT & bb : BOOL & jj : NAT & kk : NAT & vv : NAT));
(accNr_SCH_HI_EQL_NARR(bb , ii;jj , kk , vv) == (ii : NAT & bb : BOOL & jj : NAT & kk : NAT & vv : NAT));
(accNr_SCH_HI_NEQ_NARR(bb , ii;jj , kk , vv) == (ii : NAT & bb : BOOL & jj : NAT & kk : NAT & vv : NAT));
(accNr_SCH_HI_GEQ_NARR(bb , ii;jj , kk , vv) == (ii : NAT & bb : BOOL & jj : NAT & kk : NAT & vv : NAT));
(accNr_SCH_HI_GTR_NARR(bb , ii;jj , kk , vv) == (ii : NAT & bb : BOOL & jj : NAT & kk : NAT & vv : NAT));
(accNr_SCH_HI_LEQ_NARR(bb , ii;jj , kk , vv) == (ii : NAT & bb : BOOL & jj : NAT & kk : NAT & vv : NAT));
(accNr_SCH_HI_SMR_NARR(bb , ii;jj , kk , vv) == (ii : NAT & bb : BOOL & jj : NAT & kk : NAT & vv : NAT));
(accNr_SRT_ASC_NARR(?;ii , jj) == (ii : NAT & jj : NAT));
(accNr_SRT_DSC_NARR(?;ii , jj) == (ii : NAT & jj : NAT));
(accNr_REV_NARR(?;ii , jj) == (ii : NAT & jj : NAT));
(accNr_RHT_NARR(?;ii , jj , nn) == (ii : NAT & jj : NAT & nn : NAT));
(accNr_LFT_NARR(?;ii , jj , nn) == (ii : NAT & jj : NAT & nn : NAT));
(accNr_SWP_NARR(?;ii , jj) == (ii : NAT & jj : NAT));
(accNr_SAV_NARR(?;?) == ?);
(accNr_RST_NARR(?;?) == ?);
(accNr_SAVN_NARR(?;?) == ?);
(accNr_RSTN_NARR(?;?) == ?)
|
(maxint : NAT);
(maxidx : NAT);
(accNr_Narr : POW(NAT*NAT))|
(maxint , maxidx)
