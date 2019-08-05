MACHINE              ATM_SocketClient(TOK,insize,outsize)

SEES                 String_TYPE, Bool_TYPE

VARIABLES            in,inptr,outptr,outbufsize

INVARIANT
            outbufsize :  NAT1 &  outbufsize >= outsize &

            in : NAT1 &  in >= insize &
            inptr : 0..in &
            outptr : 0..outbufsize
   
INITIALISATION  
    
      in,inptr,outptr := 0,0,0 ||
      outbufsize  := outsize

OPERATIONS


  /*** operation to initialise ipaddress,port and reset pointers ***/

  rep <-- ATM_INIT(ipaddress : STRING & port : NAT) =
  BEGIN in,inptr,outptr,outbufsize := 0,0,0,outsize || rep :: BOOL END;



  /*** operations on the socket ***/

  rep <-- ATM_CONNECT = BEGIN rep :: BOOL END;

  rep <-- ATM_WRITE =
  CHOICE
    rep := TRUE || outptr := 0 ||
    outbufsize  := outsize
  OR
    rep := FALSE
  END;

  rep,pp <-- ATM_READ  = 
  ANY bufsize WHERE  bufsize : NAT1 &  bufsize >= insize  THEN
    CHOICE
      rep := TRUE || pp := bufsize || in := bufsize || inptr := 0
    OR
      rep := FALSE || pp := 0
    END
  END;

  rep <-- ATM_CLOSE = BEGIN rep :: BOOL END;



  /*** operations to read from the input buffer ***/

  tok <-- ATM_GET_TOK(toksize : 1..4 ) =
  IF inptr+toksize <= in THEN
    tok :: TOK || inptr := inptr + toksize
  ELSE
    tok :: TOK
  END;

  ss <-- ATM_GET_STR =
  IF inptr + 3 <= in THEN
    ANY str, newptr  WHERE
      str : STRING &  newptr = inptr + size(str) + 3
    THEN
      ss := str || inptr := newptr
    END
  ELSE
    ss :: STRING
  END;

  rep,filesize <-- ATM_GET_FIL(filename : STRING) =
  CHOICE
    ANY newptr  WHERE newptr : 0..in & newptr > inptr THEN
      inptr := newptr ||
      rep := TRUE ||
      filesize :: NAT
    END
  OR
    rep := FALSE ||
    filesize :: NAT
  END;



  /*** operations to to write the output buffer ***/

  ATM_PUT_TOK(tok : TOK & toksize : 1..4 ) =
  IF outptr+toksize <= outbufsize THEN
    outptr := outptr+toksize
  ELSE
     CHOICE
        outbufsize : ( outbufsize : NAT1 & outbufsize >= outptr+toksize ) ||
        outptr := outptr+toksize
     OR
        skip
     END
  END;

  ATM_PUT_STR(ss:STRING) =
  IF outptr+size(ss)+3 <= outbufsize THEN
    outptr := outptr+size(ss)+3 
  ELSE
     CHOICE
        outbufsize : ( outbufsize : NAT1 & outbufsize >= outptr+size(ss)+3 ) ||
        outptr := outptr+size(ss)+3
     OR
        skip
     END 
  END;



  /*** operations to get and set the input buffer pointer ***/

  ATM_SET_IN_PTR(ptr : NAT) = PRE ptr <= inptr THEN inptr := ptr END;

  ptr <-- ATM_GET_IN_PTR = BEGIN ptr := inptr END;



  /*** operations to get and set the output buffer pointer ***/

  ATM_SET_OUT_PTR(ptr : NAT) =  PRE ptr <= outptr THEN outptr := ptr END;

  ptr <-- ATM_GET_OUT_PTR = BEGIN ptr := outptr END;
  
  sz <-- ATM_GET_OUT_SIZE = BEGIN sz := outbufsize END




END
