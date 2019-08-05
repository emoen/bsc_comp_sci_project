extern int publicDecrypt_NvarP1;
extern int publicDecrypt_Nscv;

#define INI_publicDecrypt_Nvar()   {publicDecrypt_Nscv = 0;}
#define publicDecrypt_VAL_NVAR(uu) {*(uu) = publicDecrypt_Nscv;}
#define publicDecrypt_STO_NVAR(vv) {publicDecrypt_Nscv = vv;}
#define publicDecrypt_MIN_NVAR(uu,vv) {if( publicDecrypt_Nscv<=vv ){ *(uu) = publicDecrypt_Nscv ;}else{ *(uu) = vv ;};}
#define publicDecrypt_MAX_NVAR(uu,vv) {if( publicDecrypt_Nscv>=vv ){ *(uu) = publicDecrypt_Nscv ;}else{ *(uu) = vv ;};}
#define publicDecrypt_PRE_INC_NVAR(bb)   {*(bb) = \
                    ((publicDecrypt_Nscv < publicDecrypt_NvarP1)!=0);}
#define publicDecrypt_INC_NVAR()   {publicDecrypt_Nscv = publicDecrypt_Nscv+1;}

#define publicDecrypt_PRE_DEC_NVAR(bb)  {*(bb) = ((publicDecrypt_Nscv > 0)!=0);}
#define publicDecrypt_DEC_NVAR()  {publicDecrypt_Nscv = publicDecrypt_Nscv-1;}

#define publicDecrypt_PRE_ADD_NVAR(bb,vv) {*(bb) = \
                   ((vv<=publicDecrypt_NvarP1-publicDecrypt_Nscv)!=0);}
#define publicDecrypt_ADD_NVAR(vv) {publicDecrypt_Nscv = publicDecrypt_Nscv+(vv);}

#define publicDecrypt_PRE_SUB_NVAR(bb,vv) {*(bb) = ((vv<=publicDecrypt_Nscv)!=0);}
#define publicDecrypt_SUB_NVAR(vv) {publicDecrypt_Nscv = publicDecrypt_Nscv-(vv);}

#define publicDecrypt_PRE_MUL_NVAR(bb,vv) {*(bb) = \
                    ( (publicDecrypt_Nscv!=0) ? ((vv<=publicDecrypt_NvarP1/publicDecrypt_Nscv)!=0) : 1) ;} 
#define publicDecrypt_MUL_NVAR(vv) {publicDecrypt_Nscv = publicDecrypt_Nscv*(vv);}

#define publicDecrypt_PRE_DIV_NVAR(bb,vv) {*(bb) = ((vv>0)!=0);}
#define publicDecrypt_DIV_NVAR(vv) {publicDecrypt_Nscv = publicDecrypt_Nscv/(vv);}

#define publicDecrypt_PRE_MOD_NVAR(bb,vv) {*(bb) = ((vv>0)!=0);}
#define publicDecrypt_MOD_NVAR(vv) {publicDecrypt_Nscv = publicDecrypt_Nscv-(vv)*(publicDecrypt_Nscv/(vv));}

#define publicDecrypt_EQL_NVAR(bb,vv) {*(bb) = ((publicDecrypt_Nscv==vv)!=0);}
#define publicDecrypt_NEQ_NVAR(bb,vv) {*(bb) = ((publicDecrypt_Nscv!=vv)!=0);}
#define publicDecrypt_GTR_NVAR(bb,vv) {*(bb) = ((publicDecrypt_Nscv> vv)!=0);}
#define publicDecrypt_GEQ_NVAR(bb,vv) {*(bb) = ((publicDecrypt_Nscv>=vv)!=0);}
#define publicDecrypt_SMR_NVAR(bb,vv) {*(bb) = ((publicDecrypt_Nscv< vv)!=0);}
#define publicDecrypt_LEQ_NVAR(bb,vv) {*(bb) = ((publicDecrypt_Nscv<=vv)!=0);}

void publicDecrypt_SAV_NVAR();
void publicDecrypt_SAVN_NVAR();
void publicDecrypt_RST_NVAR();
void publicDecrypt_RSTN_NVAR();
