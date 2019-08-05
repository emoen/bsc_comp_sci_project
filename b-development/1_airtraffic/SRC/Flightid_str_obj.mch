MACHINE		Flightid_str_obj(maxobj,maxmem)

CONSTRAINTS	maxobj>0

SEES		Bool_TYPE, String_TYPE, Flightid_str_ctx

VARIABLES

  Flightid_strtok, Flightid_strstruct, Flightid_strmem

INVARIANT

  Flightid_strtok <: Flightid_STROBJ &
  Flightid_strstruct: Flightid_strtok --> STRING &
  Flightid_strmem : NAT
   

INITIALISATION

  Flightid_strtok, Flightid_strstruct, Flightid_strmem := {},{}, 0 

OPERATIONS

/****************** General query functions *******************/

  mm,nn,pp,qq <-- Flightid_STS_STR_OBJ =
  BEGIN
    mm,nn,pp,qq:=Flightid_strmem,maxmem,card(Flightid_strtok),maxobj
  END;

  bb <-- Flightid_MEM_FUL_STR_OBJ =
  BEGIN
    bb:=bool(Flightid_strmem=maxmem)
  END;

  bb <-- Flightid_OBJ_FUL_STR_OBJ =
  BEGIN
    bb:=bool(card(Flightid_strtok) = maxobj)
  END;

  bb <-- Flightid_XST_STR_OBJ(pp) =
  PRE
    pp: Flightid_STROBJ
  THEN
    bb:=bool(pp:Flightid_strtok)
  END;

  pp <-- Flightid_ANY_STR_OBJ =
  BEGIN
    pp :: Flightid_STROBJ
  END;


/*************** Creating and deleting strings ******************/

  Flightid_INI_STR_OBJ =
  BEGIN
    Flightid_strtok, Flightid_strstruct, Flightid_strmem := {},{}, 0
  END;


  bb,pp <-- Flightid_CRE_STR_OBJ =
  IF card(Flightid_strtok) < maxobj THEN
      ANY qq WHERE
        qq: Flightid_STROBJ - Flightid_strtok
      THEN
        Flightid_strstruct(qq):=<> ||
        Flightid_strtok := Flightid_strtok \/ {qq} ||
        pp:=qq ||
        bb:= TRUE
      END
  ELSE
      bb:=FALSE || pp :: Flightid_STROBJ
  END;


  bb,pp <-- Flightid_NEW_STR_OBJ(nn) =
  PRE
     card(Flightid_strtok) < maxobj &
     nn : STRING 
     /* Flightid_strmem + size(nn) <= maxmem */
  THEN 
     IF Flightid_strmem + size(nn) <= maxmem THEN
       ANY qq WHERE
         qq: Flightid_STROBJ - Flightid_strtok
       THEN
         Flightid_strstruct(qq):=nn ||
         Flightid_strtok := Flightid_strtok \/ {qq} ||
         Flightid_strmem := Flightid_strmem + size(nn) ||
         pp:=qq ||
         bb:=TRUE
       END
     ELSE
       bb := FALSE ||
       pp :: Flightid_STROBJ
     END
 END;


  Flightid_KIL_STR_OBJ(pp) =
  PRE
    pp: Flightid_strtok &
    Flightid_strmem >= size(Flightid_strstruct(pp))
  THEN
    Flightid_strstruct :=  {pp} <<| Flightid_strstruct ||
    Flightid_strtok := Flightid_strtok - {pp} ||
    Flightid_strmem := Flightid_strmem - size(Flightid_strstruct(pp))
  END;


/*********************** Query operations ***********************/


  vv <-- Flightid_VAL_STR_OBJ(pp,ii) =
  PRE
    pp:Flightid_strtok &
    ii:dom(Flightid_strstruct(pp))
  THEN 
    vv:=Flightid_strstruct(pp)(ii)
  END;

  bb <-- Flightid_EMP_STR_OBJ(pp) =
  PRE
    pp: Flightid_strtok
  THEN
    bb:=bool(Flightid_strstruct(pp)=<>)
  END;

  bb <-- Flightid_XST_IDX_STR_OBJ(pp,ii) =
  PRE
    pp: Flightid_strtok &
    ii: 1..maxmem
  THEN
    bb:=bool(ii:1..size(Flightid_strstruct(pp)))
  END;

  nn <-- Flightid_LEN_STR_OBJ(pp)=
  PRE
    pp: Flightid_strtok
  THEN
    nn:=size(Flightid_strstruct(pp))
  END;

  bb <-- Flightid_SMR_STR_OBJ(ss,tt) =
  PRE
     tt : Flightid_strtok &
     ss : Flightid_strtok
  THEN
    bb :: BOOL 
  END;

  bb <-- Flightid_EQL_STR_OBJ(ss,tt) =
  PRE
     tt : Flightid_strtok &
     ss : Flightid_strtok
  THEN
     bb := bool(Flightid_strstruct(tt) = Flightid_strstruct(ss))
  END;

  bb <-- Flightid_SUB_STR_OBJ(ss,tt) =
  PRE
     tt : Flightid_strtok &
     ss : Flightid_strtok
  THEN
     bb := bool( Flightid_strstruct(ss) <: Flightid_strstruct(tt))
  END;

  bb <-- Flightid_EQL_LIT_STR_OBJ(tt,nn) =
  PRE
     tt : Flightid_strtok &
     nn : STRING
  THEN
     bb := bool(Flightid_strstruct(tt) = nn)
  END;


  ss <-- Flightid_XTR_STR_OBJ(pp) =
  PRE
    pp : Flightid_strtok 
  THEN
    ss := Flightid_strstruct(pp) 
  END;

/**************** String operations **************************/

  Flightid_CLR_STR_OBJ(pp) =
  PRE
    pp: Flightid_strtok &
    Flightid_strmem >= size(Flightid_strstruct(pp))
  THEN
    Flightid_strstruct(pp) := <> ||
    Flightid_strmem := (
     Flightid_strmem - size(Flightid_strstruct(pp))
    )
  END;


  bb <-- Flightid_PSH_STR_OBJ(pp,vv) =
  PRE
    pp:Flightid_strtok &
    vv: CHAR 
    /* Flightid_strmem<maxmem */
  THEN
    IF Flightid_strmem<maxmem THEN
      Flightid_strstruct(pp):=Flightid_strstruct(pp) <- vv ||
      Flightid_strmem:=Flightid_strmem+1 ||
      bb:=TRUE
    ELSE
      bb:=FALSE
    END
  END;

  Flightid_KEP_STR_OBJ(pp,ii) =
  PRE
    pp:Flightid_strtok &
    ii:0..size(Flightid_strstruct(pp)) &
    Flightid_strmem >= size(Flightid_strstruct(pp))+ii
  THEN
    Flightid_strstruct(pp):=Flightid_strstruct(pp) /|\ ii ||
    Flightid_strmem:= (
     Flightid_strmem-size(Flightid_strstruct(pp))+ii
    )
  END;

  Flightid_CUT_STR_OBJ(pp,ii) =
  PRE
    pp:Flightid_strtok &
    ii:0..size(Flightid_strstruct(pp)) &
    ii <= Flightid_strmem
  THEN
    Flightid_strstruct(pp):=Flightid_strstruct(pp) \|/ ii ||
    Flightid_strmem:=Flightid_strmem-ii
  END;

  Flightid_REV_STR_OBJ(pp) =
  PRE
    pp:Flightid_strtok
  THEN
    Flightid_strstruct(pp):=rev(Flightid_strstruct(pp))
  END;

  Flightid_SWP_STR_OBJ(pp,ii,jj) =
  PRE
    pp:Flightid_strtok &
    ii:dom(Flightid_strstruct(pp)) &
    jj:dom(Flightid_strstruct(pp))
  THEN
    Flightid_strstruct(pp):= (
     Flightid_strstruct(pp) <+ (
        {ii |-> Flightid_strstruct(pp)(jj), jj |-> Flightid_strstruct(pp)(ii)}
        )
     )

  END;

  Flightid_POP_STR_OBJ(pp) =
  PRE
    pp:Flightid_strtok &
    size(Flightid_strstruct(pp))/=0
  THEN
    Flightid_strstruct(pp):= front(Flightid_strstruct(pp)) ||
    Flightid_strmem:=Flightid_strmem-1
  END;

  Flightid_STO_STR_OBJ(pp,ii,vv) =
  PRE
    pp:Flightid_strtok &
    vv:CHAR &
    ii:dom(Flightid_strstruct(pp))
  THEN 
    Flightid_strstruct(pp)(ii):=vv
  END;

  bb <-- Flightid_APP_STR_OBJ(pp,qq) =
  PRE
    pp:Flightid_strtok &
    qq:Flightid_strtok 
    /* Flightid_strmem+size(Flightid_strstruct(qq))<=maxmem */
  THEN
    IF
      Flightid_strmem+size(Flightid_strstruct(qq))<=maxmem
   THEN
      Flightid_strstruct(pp):= ( 
       Flightid_strstruct(pp)^Flightid_strstruct(qq) 
      ) ||
      Flightid_strmem:= (
       Flightid_strmem+size(Flightid_strstruct(qq)) 
      )||
      bb:=TRUE
    ELSE
      bb:=FALSE
    END
  END;

  bb <-- Flightid_CPY_STR_OBJ(pp,qq) =
  PRE
    pp:Flightid_strtok &
    qq:Flightid_strtok 
    /* Flightid_strmem- (
     size(Flightid_strstruct(qq))+size(Flightid_strstruct(pp)) 
     ) <=  maxmem */
   
  THEN
    IF Flightid_strmem- ( 
        size(Flightid_strstruct(qq))+size(Flightid_strstruct(pp))
         ) <=  maxmem 
   THEN
      Flightid_strstruct(qq):=Flightid_strstruct(pp) ||
      Flightid_strmem:= ( 
        Flightid_strmem- (
           size(Flightid_strstruct(qq))+size(Flightid_strstruct(pp))
        )
      ) ||
      bb:=TRUE
    ELSE
      bb:=FALSE
    END
  END;


  bb <-- Flightid_OVR_STR_OBJ(pp,qq) =
  PRE
    pp:Flightid_strtok &
    qq:Flightid_strtok 
    /* Flightid_strmem + (
    size(Flightid_strstruct(qq))-size(Flightid_strstruct(pp))
    ) <= maxmem */
  THEN
    IF
      Flightid_strmem+ (
        size(Flightid_strstruct(qq))-size(Flightid_strstruct(pp))
      ) <=  maxmem 
    THEN
      Flightid_strstruct(pp):= (
        Flightid_strstruct(pp) <+ Flightid_strstruct(qq)
      ) ||
      Flightid_strmem:= (
         Flightid_strmem+ (
            max({0,(size(Flightid_strstruct(qq))-size(Flightid_strstruct(pp)))}) 
         )
      )||
      bb:=TRUE
    ELSE
      bb:=FALSE
    END
  END;

/******************** Persistent Data facilities ***********************/

/***********  save/restore host byte order ***********/
 
  Flightid_SAV_STR_OBJ =
  BEGIN
    skip
  END;

  Flightid_RST_STR_OBJ =
  ANY
    sstrn,sstro,stotstr
  WHERE
    sstrn <: Flightid_STROBJ &
    sstro: sstrn --> STRING &
    stotstr:  NAT 
  THEN
    Flightid_strstruct := sstro ||
    Flightid_strtok := sstrn ||
    Flightid_strmem := stotstr
  END;

/***********  save/restore network byte order ***********/

  Flightid_SAVN_STR_OBJ =
  BEGIN
    skip
  END;

  Flightid_RSTN_STR_OBJ =
  ANY
    sstrn,sstro,stotstr
  WHERE
    sstrn <: Flightid_STROBJ &
    sstro: sstrn --> STRING &
    stotstr:  NAT 
  THEN
    Flightid_strstruct := sstro ||
    Flightid_strtok := sstrn ||
    Flightid_strmem := stotstr
  END;


/**************************** Browsing ********************************/

  nn,pp <-- Flightid_FIRST_STR_OBJ =  
  IF not(Flightid_strtok = {}) THEN
     pp :: Flightid_strtok || 
     nn := card(Flightid_strtok) 
  ELSE
     pp :: Flightid_STROBJ ||
     nn := 0
  END;

  nn,qq <-- Flightid_NEXT_STR_OBJ(mm,pp) = 
  PRE
    pp : Flightid_strtok &
    mm : NAT1
  THEN
    nn := mm-1 ||
    qq :: Flightid_strtok
  END



END

