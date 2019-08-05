extern int con_NvarP1;
extern int con_Nscv;

#define INI_con_Nvar()   {con_Nscv = 0;}
#define con_VAL_NVAR(uu) {*(uu) = con_Nscv;}
#define con_STO_NVAR(vv) {con_Nscv = vv;}
#define con_MIN_NVAR(uu,vv) {if( con_Nscv<=vv ){ *(uu) = con_Nscv ;}else{ *(uu) = vv ;};}
#define con_MAX_NVAR(uu,vv) {if( con_Nscv>=vv ){ *(uu) = con_Nscv ;}else{ *(uu) = vv ;};}
#define con_PRE_INC_NVAR(bb)   {*(bb) = \
                    ((con_Nscv < con_NvarP1)!=0);}
#define con_INC_NVAR()   {con_Nscv = con_Nscv+1;}

#define con_PRE_DEC_NVAR(bb)  {*(bb) = ((con_Nscv > 0)!=0);}
#define con_DEC_NVAR()  {con_Nscv = con_Nscv-1;}

#define con_PRE_ADD_NVAR(bb,vv) {*(bb) = \
                   ((vv<=con_NvarP1-con_Nscv)!=0);}
#define con_ADD_NVAR(vv) {con_Nscv = con_Nscv+(vv);}

#define con_PRE_SUB_NVAR(bb,vv) {*(bb) = ((vv<=con_Nscv)!=0);}
#define con_SUB_NVAR(vv) {con_Nscv = con_Nscv-(vv);}

#define con_PRE_MUL_NVAR(bb,vv) {*(bb) = \
                    ( (con_Nscv!=0) ? ((vv<=con_NvarP1/con_Nscv)!=0) : 1) ;} 
#define con_MUL_NVAR(vv) {con_Nscv = con_Nscv*(vv);}

#define con_PRE_DIV_NVAR(bb,vv) {*(bb) = ((vv>0)!=0);}
#define con_DIV_NVAR(vv) {con_Nscv = con_Nscv/(vv);}

#define con_PRE_MOD_NVAR(bb,vv) {*(bb) = ((vv>0)!=0);}
#define con_MOD_NVAR(vv) {con_Nscv = con_Nscv-(vv)*(con_Nscv/(vv));}

#define con_EQL_NVAR(bb,vv) {*(bb) = ((con_Nscv==vv)!=0);}
#define con_NEQ_NVAR(bb,vv) {*(bb) = ((con_Nscv!=vv)!=0);}
#define con_GTR_NVAR(bb,vv) {*(bb) = ((con_Nscv> vv)!=0);}
#define con_GEQ_NVAR(bb,vv) {*(bb) = ((con_Nscv>=vv)!=0);}
#define con_SMR_NVAR(bb,vv) {*(bb) = ((con_Nscv< vv)!=0);}
#define con_LEQ_NVAR(bb,vv) {*(bb) = ((con_Nscv<=vv)!=0);}

void con_SAV_NVAR();
void con_SAVN_NVAR();
void con_RST_NVAR();
void con_RSTN_NVAR();
