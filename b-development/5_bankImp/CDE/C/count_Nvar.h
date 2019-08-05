extern int count_NvarP1;
extern int count_Nscv;

#define INI_count_Nvar()   {count_Nscv = 0;}
#define count_VAL_NVAR(uu) {*(uu) = count_Nscv;}
#define count_STO_NVAR(vv) {count_Nscv = vv;}
#define count_MIN_NVAR(uu,vv) {if( count_Nscv<=vv ){ *(uu) = count_Nscv ;}else{ *(uu) = vv ;};}
#define count_MAX_NVAR(uu,vv) {if( count_Nscv>=vv ){ *(uu) = count_Nscv ;}else{ *(uu) = vv ;};}
#define count_PRE_INC_NVAR(bb)   {*(bb) = \
                    ((count_Nscv < count_NvarP1)!=0);}
#define count_INC_NVAR()   {count_Nscv = count_Nscv+1;}

#define count_PRE_DEC_NVAR(bb)  {*(bb) = ((count_Nscv > 0)!=0);}
#define count_DEC_NVAR()  {count_Nscv = count_Nscv-1;}

#define count_PRE_ADD_NVAR(bb,vv) {*(bb) = \
                   ((vv<=count_NvarP1-count_Nscv)!=0);}
#define count_ADD_NVAR(vv) {count_Nscv = count_Nscv+(vv);}

#define count_PRE_SUB_NVAR(bb,vv) {*(bb) = ((vv<=count_Nscv)!=0);}
#define count_SUB_NVAR(vv) {count_Nscv = count_Nscv-(vv);}

#define count_PRE_MUL_NVAR(bb,vv) {*(bb) = \
                    ( (count_Nscv!=0) ? ((vv<=count_NvarP1/count_Nscv)!=0) : 1) ;} 
#define count_MUL_NVAR(vv) {count_Nscv = count_Nscv*(vv);}

#define count_PRE_DIV_NVAR(bb,vv) {*(bb) = ((vv>0)!=0);}
#define count_DIV_NVAR(vv) {count_Nscv = count_Nscv/(vv);}

#define count_PRE_MOD_NVAR(bb,vv) {*(bb) = ((vv>0)!=0);}
#define count_MOD_NVAR(vv) {count_Nscv = count_Nscv-(vv)*(count_Nscv/(vv));}

#define count_EQL_NVAR(bb,vv) {*(bb) = ((count_Nscv==vv)!=0);}
#define count_NEQ_NVAR(bb,vv) {*(bb) = ((count_Nscv!=vv)!=0);}
#define count_GTR_NVAR(bb,vv) {*(bb) = ((count_Nscv> vv)!=0);}
#define count_GEQ_NVAR(bb,vv) {*(bb) = ((count_Nscv>=vv)!=0);}
#define count_SMR_NVAR(bb,vv) {*(bb) = ((count_Nscv< vv)!=0);}
#define count_LEQ_NVAR(bb,vv) {*(bb) = ((count_Nscv<=vv)!=0);}

void count_SAV_NVAR();
void count_SAVN_NVAR();
void count_RST_NVAR();
void count_RSTN_NVAR();
