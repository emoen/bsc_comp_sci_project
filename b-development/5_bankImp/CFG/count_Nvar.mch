MACHINE         count_Nvar(maxint)

CONSTRAINTS     maxint <= 2147483646

SEES            Bool_TYPE

VARIABLES       count_Nvar

INVARIANT       count_Nvar:0..maxint

INITIALISATION  count_Nvar:=0

OPERATIONS

  vv <-- count_VAL_NVAR =
  BEGIN 
    vv:=count_Nvar
  END;

  count_STO_NVAR(vv) =
  PRE
    vv:0..maxint
  THEN 
    count_Nvar:=vv
  END;

  uu <-- count_MIN_NVAR(vv) =
  PRE
    vv:0..maxint
  THEN
    uu:=min({count_Nvar,vv})
  END;

  uu <-- count_MAX_NVAR(vv) =
  PRE
    vv:0..maxint
  THEN
    uu:=max({count_Nvar,vv})
  END;

  bb <-- count_PRE_INC_NVAR =
  BEGIN
    bb:=bool(count_Nvar<maxint)
  END;

  count_INC_NVAR =
  PRE
    count_Nvar+1:0..maxint
  THEN
    count_Nvar:=count_Nvar+1
  END;

  bb <-- count_PRE_DEC_NVAR =
  BEGIN
    bb:=bool(count_Nvar>0)
  END;

  count_DEC_NVAR =
  PRE
    count_Nvar:1..maxint
  THEN
    count_Nvar:=count_Nvar-1
  END;

  bb <-- count_PRE_ADD_NVAR(vv) =
  PRE
    vv:0..maxint
  THEN
    bb:=bool(count_Nvar+vv <= maxint)
  END;

  count_ADD_NVAR(vv) =
  PRE
    vv:0..maxint &
    count_Nvar+vv <= maxint
  THEN 
    count_Nvar:=count_Nvar+vv
  END;

  bb <-- count_PRE_MUL_NVAR(vv) =
  PRE
    vv:0..maxint
  THEN
    bb:=bool(count_Nvar*vv <= maxint)
  END;

  count_MUL_NVAR(vv) =
  PRE
    vv:0..maxint &
    count_Nvar*vv <= maxint
  THEN 
    count_Nvar:=count_Nvar*vv
  END;

  bb <-- count_PRE_SUB_NVAR(vv) =
  PRE
    vv:0..maxint
  THEN
    bb:=bool(count_Nvar-vv >= 0)
  END;

  count_SUB_NVAR(vv) =
  PRE
    vv:0..maxint &
    count_Nvar-vv >= 0
  THEN 
    count_Nvar:=count_Nvar-vv
  END;

  bb <-- count_PRE_DIV_NVAR(vv) =
  PRE
    vv:0..maxint
  THEN
    bb:=bool(vv > 0)
  END;

  count_DIV_NVAR(vv) =
  PRE
    vv:1..maxint
  THEN 
    count_Nvar:=count_Nvar/vv
  END;

  bb <-- count_PRE_MOD_NVAR(vv) =
  PRE
    vv:0..maxint
  THEN
    bb:=bool(vv > 0)
  END;

  count_MOD_NVAR(vv) =
  PRE
    vv:1..maxint
  THEN 
    count_Nvar:=count_Nvar-vv*(count_Nvar/vv)
  END;

  bb <-- count_EQL_NVAR(vv) =
  PRE
    vv:0..maxint
  THEN
    bb:=bool(count_Nvar=vv)
  END;

  bb <-- count_NEQ_NVAR(vv) =
  PRE
    vv:0..maxint
  THEN
    bb:=bool(count_Nvar/=vv)
  END;

  bb <-- count_GTR_NVAR(vv) =
  PRE
    vv:0..maxint
  THEN
    bb:=bool(count_Nvar>vv)
  END;

  bb <-- count_GEQ_NVAR(vv) =
  PRE
    vv:0..maxint
  THEN
    bb:=bool(count_Nvar>=vv)
  END;

  bb <-- count_SMR_NVAR(vv) =
  PRE
    vv:0..maxint
  THEN
    bb:=bool(count_Nvar<vv)
  END;

  bb <-- count_LEQ_NVAR(vv) =
  PRE
    vv:0..maxint
  THEN
    bb:=bool(count_Nvar<=vv)
  END;


/**************  save/restore host byte order **************/

  count_SAV_NVAR =
  BEGIN
     skip
  END;

  count_RST_NVAR =
  BEGIN
    count_Nvar :: 0..maxint
  END;

/**************  save/restore network byte order **************/

  count_SAVN_NVAR =
  BEGIN
     skip
  END;

  count_RSTN_NVAR =
  BEGIN
    count_Nvar :: 0..maxint
  END

END



