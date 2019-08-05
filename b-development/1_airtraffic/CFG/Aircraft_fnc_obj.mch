MACHINE       Aircraft_fnc_obj(VALUE,maxfld,maxobj)

CONSTRAINTS   maxobj>0

SEES          file_dump,Bool_TYPE, Aircraft_fnc_ctx

VARIABLES     Aircraft_fnctok, Aircraft_fncstruct,Aircraft_locate

INVARIANT

  Aircraft_fnctok <: Aircraft_FNCOBJ &
  Aircraft_fncstruct: Aircraft_fnctok --> (1..maxfld +-> VALUE) &
  Aircraft_locate : 1..card(Aircraft_fnctok) >->> Aircraft_fnctok

INITIALISATION

  Aircraft_fnctok, Aircraft_fncstruct, Aircraft_locate:= {},{},{}

OPERATIONS

/***************** General query functions ********************/

  bb <-- Aircraft_FUL_FNC_OBJ =
  BEGIN
    bb:=bool(card(Aircraft_fnctok) = maxobj)
  END;

  bb <-- Aircraft_TST_FLD_FNC_OBJ(ii) =
  PRE
    ii: NAT
  THEN
    bb:=bool(ii: 1..maxfld)
  END;

  vv <-- Aircraft_ANY_FNC_OBJ =
  BEGIN
    vv::Aircraft_FNCOBJ
  END;

/*********** Creating, killing and testing for existence ********/

  bb,pp <-- Aircraft_CRE_FNC_OBJ =
  IF card(Aircraft_fnctok) < maxobj THEN 
    ANY qq,ll WHERE
      qq: Aircraft_FNCOBJ - Aircraft_fnctok &
      ll : 1..card(Aircraft_fnctok)+1 >->> (Aircraft_fnctok \/ {qq})
    THEN
      Aircraft_fncstruct(qq):={} ||
      Aircraft_fnctok := Aircraft_fnctok \/ {qq} ||
      Aircraft_locate := ll ||
      pp:=qq ||
      bb:= TRUE
    END
  ELSE
    bb:= FALSE || pp :: Aircraft_FNCOBJ
  END;

  Aircraft_KIL_FNC_OBJ(ff) =
  PRE
    ff: Aircraft_fnctok
  THEN
    Aircraft_fncstruct := {ff} <<| Aircraft_fncstruct ||
    Aircraft_fnctok := Aircraft_fnctok - {ff} ||
    Aircraft_locate :: (
     1..card(Aircraft_fnctok)-1 >->> (Aircraft_fnctok-{ff})
    )
  END;

  Aircraft_INI_FNC_OBJ =
  BEGIN
    Aircraft_fncstruct := {} ||
    Aircraft_fnctok := {} ||
    Aircraft_locate := {}
  END;

  bb <-- Aircraft_XST_FNC_OBJ(pp) =
  PRE
    pp: Aircraft_FNCOBJ
  THEN
    bb:=bool(pp:Aircraft_fnctok)
  END;

/********** Query functions for individual functions **************/

  
  bb <-- Aircraft_DEF_FNC_OBJ(ff,ii) =
  PRE
    ff: Aircraft_fnctok &
    ii: 1..maxfld
  THEN
    bb := bool(ii: dom(Aircraft_fncstruct(ff)))
  END;

  vv <-- Aircraft_VAL_FNC_OBJ(ff,ii) =
  PRE
    ff: Aircraft_fnctok &
    ii: dom(Aircraft_fncstruct(ff))
  THEN
    vv := Aircraft_fncstruct(ff)(ii)
  END;

/****** Operations for manipulating individual functions *********/

  Aircraft_STO_FNC_OBJ(ff,ii,vv) =
  PRE
    ff: Aircraft_fnctok &
    ii: 1..maxfld &
    vv: VALUE
  THEN
    Aircraft_fncstruct(ff)(ii) := vv
  END;

  Aircraft_RMV_FNC_OBJ(ff,ii) =
  PRE
    ff: Aircraft_fnctok &
    ii: 1..maxfld
  THEN
    Aircraft_fncstruct(ff) := {ii} <<| Aircraft_fncstruct(ff)
  END;

/************* Persistent data facilities ************************/  

/***********  save/restore host byte order ***********/

  Aircraft_SAV_FNC_OBJ =
  BEGIN
    skip
  END;

  Aircraft_RST_FNC_OBJ =
  ANY
    sfncn,sfnco,loc
  WHERE
    sfncn <: Aircraft_FNCOBJ &
    sfnco: sfncn --> (1..maxfld +-> VALUE) &
    loc : 1..card(sfncn) >->> sfncn
  THEN
    Aircraft_fncstruct := sfnco ||
    Aircraft_fnctok := sfncn ||
    Aircraft_locate := loc
  END;

/***********  save/restore network byte order ***********/

  Aircraft_SAVN_FNC_OBJ =
  BEGIN
    skip
  END;

  Aircraft_RSTN_FNC_OBJ =
  ANY
    sfncn,sfnco,loc
  WHERE
    sfncn <: Aircraft_FNCOBJ &
    sfnco: sfncn --> (1..maxfld +-> VALUE) &
    loc : 1..card(sfncn) >->> sfncn
  THEN
    Aircraft_fncstruct := sfnco ||
    Aircraft_fnctok := sfncn ||
    Aircraft_locate := loc
  END;

/********************* Browsing facilities ************************/


  nn,pp <-- Aircraft_FIRST_FNC_OBJ =   
  IF not(Aircraft_fnctok = {}) THEN
     pp := Aircraft_locate(card(Aircraft_fnctok)) || 
     nn := card(Aircraft_fnctok) 
  ELSE
     pp :: Aircraft_FNCOBJ ||
     nn := 0
  END;

  nn,qq <-- Aircraft_NEXT_FNC_OBJ(mm,pp) =  
  PRE
    pp : Aircraft_fnctok &
    mm : 1..card(Aircraft_fnctok)
  THEN
    nn:= mm-1 ||
    IF mm /=1 THEN
       qq := Aircraft_locate(mm-1) 
    ELSE
       qq :: Aircraft_fnctok
    END
  END
   
END


