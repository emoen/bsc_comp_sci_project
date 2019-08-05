MACHINE         accNr_Narr(maxint,maxidx)

CONSTRAINTS

   maxint > 0 &
   maxint <= 2147483646 &
   maxidx <= 2147483646

SEES            Bool_TYPE

VARIABLES       accNr_Narr

INVARIANT       accNr_Narr: 1..maxidx --> 0..maxint

INITIALISATION  accNr_Narr:: 1..maxidx --> 0..maxint

OPERATIONS

  bb <-- accNr_TST_IDX_NARR(ii) =
  PRE ii: NAT
  THEN
    bb := bool(ii:1..maxidx)
  END;

  vv <-- accNr_MAX_IDX_NARR(ii,jj) =
  PRE
    ii: 1..maxidx &
    jj: 1..maxidx &
    ran((ii..jj) <| accNr_Narr) /= {}
  THEN
    vv::accNr_Narr~[{max(ran((ii..jj) <| accNr_Narr))}]
  END;

  vv <-- accNr_MIN_IDX_NARR(ii,jj) =
  PRE
    ii: 1..maxidx &
    jj: 1..maxidx &
    ran((ii..jj) <| accNr_Narr) /= {}
  THEN
    vv::accNr_Narr~[{min(ran((ii..jj) <| accNr_Narr))}]
  END;

  vv <-- accNr_VAL_NARR(ii) =
  PRE ii:1..maxidx
  THEN 
    vv:=accNr_Narr(ii)
  END;

  accNr_STO_NARR(ii,vv) =
  PRE
    vv:0..maxint &
    ii:1..maxidx
  THEN 
    accNr_Narr(ii):=vv
  END;

  accNr_ADD_NARR(ii,vv) =
  PRE
    vv:0..maxint &
    ii:1..maxidx &
    accNr_Narr(ii)+vv <= maxint
  THEN 
    accNr_Narr(ii):=accNr_Narr(ii)+vv
  END;

  accNr_MUL_NARR(ii,vv) =
  PRE
    vv:0..maxint &
    ii:1..maxidx &
    accNr_Narr(ii)*vv <= maxint
  THEN 
    accNr_Narr(ii):=accNr_Narr(ii)*vv
  END;

  accNr_SUB_NARR(ii,vv) =
  PRE
    vv:0..maxint &
    ii:1..maxidx &
    accNr_Narr(ii) >= vv 
  THEN 
    accNr_Narr(ii):=accNr_Narr(ii)-vv
  END;

  accNr_DIV_NARR(ii,vv) =
  PRE
    vv:1..maxint &
    ii:1..maxidx
  THEN 
    accNr_Narr(ii):=accNr_Narr(ii)/vv
  END;

  accNr_MOD_NARR(ii,vv) =
  PRE
    vv:1..maxint &
    ii:1..maxidx
  THEN 
    accNr_Narr(ii):=accNr_Narr(ii)-vv*(accNr_Narr(ii)/vv)
  END;

  bb <-- accNr_EQL_NARR(ii,vv) =
  PRE
    vv:0..maxint &
    ii:1..maxidx
  THEN
    bb:=bool(accNr_Narr(ii)=vv)
  END;

  bb <-- accNr_NEQ_NARR(ii,vv) =
  PRE
    vv:0..maxint &
    ii:1..maxidx
  THEN
    bb:=bool(accNr_Narr(ii)/=vv)
  END;

  bb <-- accNr_GTR_NARR(ii,vv) =
  PRE
    vv:0..maxint &
    ii:1..maxidx
  THEN
    bb:=bool(accNr_Narr(ii)>vv)
  END;

  bb <-- accNr_GEQ_NARR(ii,vv) =
  PRE
    vv:0..maxint &
    ii:1..maxidx
  THEN
    bb:=bool(accNr_Narr(ii)>=vv)
  END;

  bb <-- accNr_SMR_NARR(ii,vv) =
  PRE
    vv:0..maxint &
    ii:1..maxidx
  THEN
    bb:=bool(accNr_Narr(ii)<vv)
  END;

  bb <-- accNr_LEQ_NARR(ii,vv) =
  PRE
    vv:0..maxint &
    ii:1..maxidx
  THEN
    bb:=bool(accNr_Narr(ii)<=vv)
  END;

  bb,ii <-- accNr_SCH_LO_EQL_NARR(jj,kk,vv) =
  PRE
    vv:0..maxint &
    jj:1..maxidx &
    kk:1..maxidx
  THEN
    LET ss BE
      ss = (jj..kk) /\ accNr_Narr~[{vv}]
    IN
      bb:=bool(ss/={}) ||
      ii:= min(ss \/ {maxidx})
    END
  END;

  bb,ii <-- accNr_SCH_LO_NEQ_NARR(jj,kk,vv) =
  PRE
    vv:0..maxint &
    jj:1..maxidx &
    kk:1..maxidx
  THEN
    LET ss BE
      ss = (jj..kk) /\ accNr_Narr~[(0..maxint)-{vv}]
    IN
      bb:=bool(ss/={}) ||
      ii:= min(ss \/ {maxidx})
    END
  END;

  bb,ii <-- accNr_SCH_LO_GEQ_NARR(jj,kk,vv) =
  PRE
    vv:0..maxint &
    jj:1..maxidx &
    kk:1..maxidx
  THEN
    LET ss BE
      ss = (jj..kk) /\ accNr_Narr~[vv..maxint]
    IN
      bb:=bool(ss/={}) ||
      ii:= min(ss \/ {maxidx})
    END
  END;

  bb,ii <-- accNr_SCH_LO_GTR_NARR(jj,kk,vv) =
  PRE
    vv:0..maxint &
    jj:1..maxidx &
    kk:1..maxidx
  THEN
    LET ss BE
      ss = (jj..kk) /\ accNr_Narr~[vv+1..maxint]
    IN
      bb:=bool(ss/={}) ||
      ii:= min(ss \/ {maxidx})
    END
  END;

  bb,ii <-- accNr_SCH_LO_LEQ_NARR(jj,kk,vv) =
  PRE
    vv:0..maxint &
    jj:1..maxidx &
    kk:1..maxidx
  THEN
    LET ss BE
      ss = (jj..kk) /\ accNr_Narr~[0..vv]
    IN
      bb:=bool(ss/={}) ||
      ii:= min(ss \/ {maxidx})
    END
  END;

  bb,ii <-- accNr_SCH_LO_SMR_NARR(jj,kk,vv) =
  PRE
    vv:0..maxint &
    jj:1..maxidx &
    kk:1..maxidx
  THEN
    LET ss BE
      ss = (jj..kk) /\ accNr_Narr~[ 0..vv-1]
    IN
      bb:=bool(ss/={}) ||
      ii:= min(ss \/ {maxidx})
    END
  END;

  bb,ii <-- accNr_SCH_HI_EQL_NARR(jj,kk,vv) =
  PRE
    vv:0..maxint &
    jj:1..maxidx &
    kk:1..maxidx
  THEN
    LET ss BE
      ss = (jj..kk) /\ accNr_Narr~[{vv}]
    IN
      bb:=bool(ss/={}) ||
      ii:= max(ss \/ {1})
    END
  END;

  bb,ii <-- accNr_SCH_HI_NEQ_NARR(jj,kk,vv) =
  PRE
    vv:0..maxint &
    jj:1..maxidx &
    kk:1..maxidx
  THEN
    LET ss BE
      ss = (jj..kk) /\ accNr_Narr~[(0..maxint)-{vv}]
    IN
      bb:=bool(ss/={}) ||
      ii:= max(ss \/ {1})
    END
  END;

  bb,ii <-- accNr_SCH_HI_GEQ_NARR(jj,kk,vv) =
  PRE
    vv:0..maxint &
    jj:1..maxidx &
    kk:1..maxidx
  THEN
    LET ss BE
      ss = (jj..kk) /\ accNr_Narr~[vv..maxint]
    IN
      bb:=bool(ss/={}) ||
      ii:= max(ss \/ {1})
    END
  END;

  bb,ii <-- accNr_SCH_HI_GTR_NARR(jj,kk,vv) =
  PRE
    vv:0..maxint &
    jj:1..maxidx &
    kk:1..maxidx
  THEN
    LET ss BE
      ss = (jj..kk) /\ accNr_Narr~[vv+1..maxint]
    IN
      bb:=bool(ss/={}) ||
      ii:= max(ss \/ {1})
    END
  END;

  bb,ii <-- accNr_SCH_HI_LEQ_NARR(jj,kk,vv) =
  PRE
    vv:0..maxint &
    jj:1..maxidx &
    kk:1..maxidx
  THEN
    LET ss BE
      ss = (jj..kk) /\ accNr_Narr~[0..vv]
    IN
      bb:=bool(ss/={}) ||
      ii:= max(ss \/ {1})
    END
  END;

  bb,ii <-- accNr_SCH_HI_SMR_NARR(jj,kk,vv) =
  PRE
    vv:0..maxint &
    jj:1..maxidx &
    kk:1..maxidx
  THEN
    LET ss BE
      ss = (jj..kk) /\ accNr_Narr~[ 0..vv-1]
    IN
      bb:=bool(ss/={}) ||
      ii:= max(ss \/ {1})
    END
  END;

  accNr_SRT_ASC_NARR(ii,jj) =
  PRE
    ii:1..maxidx &
    jj:1..maxidx &
    ii <= jj
  THEN
    ANY ff,aa,bb,cc WHERE
      ff: (ii..jj) >->> (ii..jj) &
      bb: NAT +-> (0..maxint) &
      bb = (ff;accNr_Narr) &
      !kk.(kk:ii..jj-1 => bb(kk) <= bb(kk+1)) &
      aa = (1..ii-1) <| accNr_Narr &
      cc = (jj+1..maxidx) <| accNr_Narr
    THEN
      accNr_Narr := aa \/ bb \/ cc
    END
  END;

  accNr_SRT_DSC_NARR(ii,jj) =
  PRE
    ii:1..maxidx &
    jj:1..maxidx  &
    ii <= jj
  THEN
    ANY ff,aa,bb,cc WHERE
      ff: ii..jj >->> ii..jj &
      bb: NAT +-> (0..maxint) &
      bb = (ff;accNr_Narr) &
      !kk.(kk:ii..jj-1 => bb(kk) >= bb(kk+1)) &
      aa = (1..ii-1) <| accNr_Narr &
      cc = (jj+1..maxidx) <| accNr_Narr
    THEN
      accNr_Narr := aa \/ bb \/ cc
    END
  END;

  accNr_REV_NARR(ii,jj) =
  PRE
    ii:1..maxidx &
    jj:1..maxidx &
    ii <= jj
  THEN
    LET aa,bb,cc BE
      aa = (1..ii-1) <| accNr_Narr &
      bb = %kk.(kk:ii..jj | accNr_Narr(jj+ii-kk)) &
      cc = (jj+1..maxidx) <| accNr_Narr
    IN
      accNr_Narr := aa \/ bb \/ cc
    END
  END;

  accNr_RHT_NARR(ii,jj,nn) =
  PRE
    ii:1..maxidx &
    jj:1..maxidx &
    nn:1..maxidx &
    ii <= jj
  THEN
    LET aa,bb,cc BE
      aa = (1..ii+nn-1) <| accNr_Narr &
      bb = %kk.(
           kk:ii+nn..min({maxidx,jj+nn}) | accNr_Narr(kk-nn)
           ) &
      cc = (jj+nn+1..maxidx) <| accNr_Narr
    IN
      accNr_Narr := aa \/ bb \/ cc
    END
  END;

  accNr_LFT_NARR(ii,jj,nn) =
  PRE
    ii:1..maxidx &
    jj:1..maxidx &
    ii <= jj &
    nn:1..maxidx
  THEN
    LET aa,bb,cc BE
      aa = (1..ii-nn-1) <| accNr_Narr &
      bb = %kk.(
           kk:max({1,ii-nn})..jj-nn | accNr_Narr(kk+nn)
           ) &
      cc = (jj-nn+1..maxidx) <| accNr_Narr
    IN
      accNr_Narr := aa \/ bb \/ cc
    END
  END;


  accNr_SWP_NARR(ii,jj) =
  PRE
    ii: 1..maxidx &
    jj: 1..maxidx
  THEN
    accNr_Narr:= ( 
      accNr_Narr<+{ii |-> accNr_Narr(jj), jj |-> accNr_Narr(ii)}
      )
  END;


/**************  save/restore host byte order **************/

 accNr_SAV_NARR = BEGIN skip END;

 accNr_RST_NARR =
 BEGIN  accNr_Narr :: 1..maxidx --> 0..maxint END;


/**************  save/restore network byte order **************/

 accNr_SAVN_NARR = BEGIN skip END;
 
 accNr_RSTN_NARR =
 BEGIN  accNr_Narr :: 1..maxidx --> 0..maxint END


END

