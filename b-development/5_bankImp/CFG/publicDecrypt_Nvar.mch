MACHINE         publicDecrypt_Nvar(maxint)

CONSTRAINTS     maxint <= 2147483646

SEES            Bool_TYPE

VARIABLES       publicDecrypt_Nvar

INVARIANT       publicDecrypt_Nvar:0..maxint

INITIALISATION  publicDecrypt_Nvar:=0

OPERATIONS

  vv <-- publicDecrypt_VAL_NVAR =
  BEGIN 
    vv:=publicDecrypt_Nvar
  END;

  publicDecrypt_STO_NVAR(vv) =
  PRE
    vv:0..maxint
  THEN 
    publicDecrypt_Nvar:=vv
  END;

  uu <-- publicDecrypt_MIN_NVAR(vv) =
  PRE
    vv:0..maxint
  THEN
    uu:=min({publicDecrypt_Nvar,vv})
  END;

  uu <-- publicDecrypt_MAX_NVAR(vv) =
  PRE
    vv:0..maxint
  THEN
    uu:=max({publicDecrypt_Nvar,vv})
  END;

  bb <-- publicDecrypt_PRE_INC_NVAR =
  BEGIN
    bb:=bool(publicDecrypt_Nvar<maxint)
  END;

  publicDecrypt_INC_NVAR =
  PRE
    publicDecrypt_Nvar+1:0..maxint
  THEN
    publicDecrypt_Nvar:=publicDecrypt_Nvar+1
  END;

  bb <-- publicDecrypt_PRE_DEC_NVAR =
  BEGIN
    bb:=bool(publicDecrypt_Nvar>0)
  END;

  publicDecrypt_DEC_NVAR =
  PRE
    publicDecrypt_Nvar:1..maxint
  THEN
    publicDecrypt_Nvar:=publicDecrypt_Nvar-1
  END;

  bb <-- publicDecrypt_PRE_ADD_NVAR(vv) =
  PRE
    vv:0..maxint
  THEN
    bb:=bool(publicDecrypt_Nvar+vv <= maxint)
  END;

  publicDecrypt_ADD_NVAR(vv) =
  PRE
    vv:0..maxint &
    publicDecrypt_Nvar+vv <= maxint
  THEN 
    publicDecrypt_Nvar:=publicDecrypt_Nvar+vv
  END;

  bb <-- publicDecrypt_PRE_MUL_NVAR(vv) =
  PRE
    vv:0..maxint
  THEN
    bb:=bool(publicDecrypt_Nvar*vv <= maxint)
  END;

  publicDecrypt_MUL_NVAR(vv) =
  PRE
    vv:0..maxint &
    publicDecrypt_Nvar*vv <= maxint
  THEN 
    publicDecrypt_Nvar:=publicDecrypt_Nvar*vv
  END;

  bb <-- publicDecrypt_PRE_SUB_NVAR(vv) =
  PRE
    vv:0..maxint
  THEN
    bb:=bool(publicDecrypt_Nvar-vv >= 0)
  END;

  publicDecrypt_SUB_NVAR(vv) =
  PRE
    vv:0..maxint &
    publicDecrypt_Nvar-vv >= 0
  THEN 
    publicDecrypt_Nvar:=publicDecrypt_Nvar-vv
  END;

  bb <-- publicDecrypt_PRE_DIV_NVAR(vv) =
  PRE
    vv:0..maxint
  THEN
    bb:=bool(vv > 0)
  END;

  publicDecrypt_DIV_NVAR(vv) =
  PRE
    vv:1..maxint
  THEN 
    publicDecrypt_Nvar:=publicDecrypt_Nvar/vv
  END;

  bb <-- publicDecrypt_PRE_MOD_NVAR(vv) =
  PRE
    vv:0..maxint
  THEN
    bb:=bool(vv > 0)
  END;

  publicDecrypt_MOD_NVAR(vv) =
  PRE
    vv:1..maxint
  THEN 
    publicDecrypt_Nvar:=publicDecrypt_Nvar-vv*(publicDecrypt_Nvar/vv)
  END;

  bb <-- publicDecrypt_EQL_NVAR(vv) =
  PRE
    vv:0..maxint
  THEN
    bb:=bool(publicDecrypt_Nvar=vv)
  END;

  bb <-- publicDecrypt_NEQ_NVAR(vv) =
  PRE
    vv:0..maxint
  THEN
    bb:=bool(publicDecrypt_Nvar/=vv)
  END;

  bb <-- publicDecrypt_GTR_NVAR(vv) =
  PRE
    vv:0..maxint
  THEN
    bb:=bool(publicDecrypt_Nvar>vv)
  END;

  bb <-- publicDecrypt_GEQ_NVAR(vv) =
  PRE
    vv:0..maxint
  THEN
    bb:=bool(publicDecrypt_Nvar>=vv)
  END;

  bb <-- publicDecrypt_SMR_NVAR(vv) =
  PRE
    vv:0..maxint
  THEN
    bb:=bool(publicDecrypt_Nvar<vv)
  END;

  bb <-- publicDecrypt_LEQ_NVAR(vv) =
  PRE
    vv:0..maxint
  THEN
    bb:=bool(publicDecrypt_Nvar<=vv)
  END;


/**************  save/restore host byte order **************/

  publicDecrypt_SAV_NVAR =
  BEGIN
     skip
  END;

  publicDecrypt_RST_NVAR =
  BEGIN
    publicDecrypt_Nvar :: 0..maxint
  END;

/**************  save/restore network byte order **************/

  publicDecrypt_SAVN_NVAR =
  BEGIN
     skip
  END;

  publicDecrypt_RSTN_NVAR =
  BEGIN
    publicDecrypt_Nvar :: 0..maxint
  END

END



