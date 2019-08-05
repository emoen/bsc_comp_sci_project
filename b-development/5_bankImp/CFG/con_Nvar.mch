MACHINE         con_Nvar(maxint)

CONSTRAINTS     maxint <= 2147483646

SEES            Bool_TYPE

VARIABLES       con_Nvar

INVARIANT       con_Nvar:0..maxint

INITIALISATION  con_Nvar:=0

OPERATIONS

  vv <-- con_VAL_NVAR =
  BEGIN 
    vv:=con_Nvar
  END;

  con_STO_NVAR(vv) =
  PRE
    vv:0..maxint
  THEN 
    con_Nvar:=vv
  END;

  uu <-- con_MIN_NVAR(vv) =
  PRE
    vv:0..maxint
  THEN
    uu:=min({con_Nvar,vv})
  END;

  uu <-- con_MAX_NVAR(vv) =
  PRE
    vv:0..maxint
  THEN
    uu:=max({con_Nvar,vv})
  END;

  bb <-- con_PRE_INC_NVAR =
  BEGIN
    bb:=bool(con_Nvar<maxint)
  END;

  con_INC_NVAR =
  PRE
    con_Nvar+1:0..maxint
  THEN
    con_Nvar:=con_Nvar+1
  END;

  bb <-- con_PRE_DEC_NVAR =
  BEGIN
    bb:=bool(con_Nvar>0)
  END;

  con_DEC_NVAR =
  PRE
    con_Nvar:1..maxint
  THEN
    con_Nvar:=con_Nvar-1
  END;

  bb <-- con_PRE_ADD_NVAR(vv) =
  PRE
    vv:0..maxint
  THEN
    bb:=bool(con_Nvar+vv <= maxint)
  END;

  con_ADD_NVAR(vv) =
  PRE
    vv:0..maxint &
    con_Nvar+vv <= maxint
  THEN 
    con_Nvar:=con_Nvar+vv
  END;

  bb <-- con_PRE_MUL_NVAR(vv) =
  PRE
    vv:0..maxint
  THEN
    bb:=bool(con_Nvar*vv <= maxint)
  END;

  con_MUL_NVAR(vv) =
  PRE
    vv:0..maxint &
    con_Nvar*vv <= maxint
  THEN 
    con_Nvar:=con_Nvar*vv
  END;

  bb <-- con_PRE_SUB_NVAR(vv) =
  PRE
    vv:0..maxint
  THEN
    bb:=bool(con_Nvar-vv >= 0)
  END;

  con_SUB_NVAR(vv) =
  PRE
    vv:0..maxint &
    con_Nvar-vv >= 0
  THEN 
    con_Nvar:=con_Nvar-vv
  END;

  bb <-- con_PRE_DIV_NVAR(vv) =
  PRE
    vv:0..maxint
  THEN
    bb:=bool(vv > 0)
  END;

  con_DIV_NVAR(vv) =
  PRE
    vv:1..maxint
  THEN 
    con_Nvar:=con_Nvar/vv
  END;

  bb <-- con_PRE_MOD_NVAR(vv) =
  PRE
    vv:0..maxint
  THEN
    bb:=bool(vv > 0)
  END;

  con_MOD_NVAR(vv) =
  PRE
    vv:1..maxint
  THEN 
    con_Nvar:=con_Nvar-vv*(con_Nvar/vv)
  END;

  bb <-- con_EQL_NVAR(vv) =
  PRE
    vv:0..maxint
  THEN
    bb:=bool(con_Nvar=vv)
  END;

  bb <-- con_NEQ_NVAR(vv) =
  PRE
    vv:0..maxint
  THEN
    bb:=bool(con_Nvar/=vv)
  END;

  bb <-- con_GTR_NVAR(vv) =
  PRE
    vv:0..maxint
  THEN
    bb:=bool(con_Nvar>vv)
  END;

  bb <-- con_GEQ_NVAR(vv) =
  PRE
    vv:0..maxint
  THEN
    bb:=bool(con_Nvar>=vv)
  END;

  bb <-- con_SMR_NVAR(vv) =
  PRE
    vv:0..maxint
  THEN
    bb:=bool(con_Nvar<vv)
  END;

  bb <-- con_LEQ_NVAR(vv) =
  PRE
    vv:0..maxint
  THEN
    bb:=bool(con_Nvar<=vv)
  END;


/**************  save/restore host byte order **************/

  con_SAV_NVAR =
  BEGIN
     skip
  END;

  con_RST_NVAR =
  BEGIN
    con_Nvar :: 0..maxint
  END;

/**************  save/restore network byte order **************/

  con_SAVN_NVAR =
  BEGIN
     skip
  END;

  con_RSTN_NVAR =
  BEGIN
    con_Nvar :: 0..maxint
  END

END



