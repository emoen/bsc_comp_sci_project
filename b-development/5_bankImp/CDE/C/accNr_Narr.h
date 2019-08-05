extern int accNr_NarrP1;
extern int accNr_NarrP2;
extern int accNr_Narray[];
#define INI_accNr_Narr()      { ; }
#define accNr_TST_IDX_NARR(bb,ii) {*(bb) = \
                         (((ii>=1) && (ii<=accNr_NarrP2))!=0);}
#define accNr_VAL_NARR(vv,ii) {*(vv) = accNr_Narray[ii];}
#define accNr_STO_NARR(ii,vv) {accNr_Narray[ii] = (vv);}
#define accNr_ADD_NARR(ii,vv) {accNr_Narray[ii] = accNr_Narray[ii]+(vv);}
#define accNr_SUB_NARR(ii,vv) {accNr_Narray[ii] = accNr_Narray[ii]-(vv);}
#define accNr_MUL_NARR(ii,vv) {accNr_Narray[ii] = accNr_Narray[ii]*(vv);}
#define accNr_DIV_NARR(ii,vv) {accNr_Narray[ii] = accNr_Narray[ii]/(vv);}
#define accNr_MOD_NARR(ii,vv) \
{accNr_Narray[ii] = accNr_Narray[ii]-(vv)*(accNr_Narray[ii]/(vv));}

#define accNr_EQL_NARR(bb,ii,vv) {*(bb) = ((accNr_Narray[ii]==(vv))!=0);}
#define accNr_NEQ_NARR(bb,ii,vv) {*(bb) = ((accNr_Narray[ii]!=(vv))!=0);}
#define accNr_GTR_NARR(bb,ii,vv) {*(bb) = ((accNr_Narray[ii]> (vv))!=0);}
#define accNr_GEQ_NARR(bb,ii,vv) {*(bb) = ((accNr_Narray[ii]>=(vv))!=0);}
#define accNr_SMR_NARR(bb,ii,vv) {*(bb) = ((accNr_Narray[ii]< (vv))!=0);}
#define accNr_LEQ_NARR(bb,ii,vv) {*(bb) = ((accNr_Narray[ii]<=(vv))!=0);}

void accNr_SAV_NARR();
void accNr_SAVN_NARR();
void accNr_RST_NARR();
void accNr_RSTN_NARR();
void accNr_SWP_NARR();
void accNr_MAX_IDX_NARR();
void accNr_MIN_IDX_NARR();
void accNr_SCH_LO_EQL_NARR();
void accNr_SCH_LO_NEQ_NARR();
void accNr_SCH_LO_GEQ_NARR();
void accNr_SCH_LO_GTR_NARR();
void accNr_SCH_LO_LEQ_NARR();
void accNr_SCH_LO_SMR_NARR();
void accNr_SCH_HI_EQL_NARR();
void accNr_SCH_HI_NEQ_NARR();
void accNr_SCH_HI_GEQ_NARR();
void accNr_SCH_HI_GTR_NARR();
void accNr_SCH_HI_LEQ_NARR();
void accNr_SCH_HI_SMR_NARR();
void accNr_SRT_ASC_NARR();
void accNr_SRT_DSC_NARR();
void accNr_REV_NARR();
void accNr_RHT_NARR();
void accNr_LFT_NARR();
