(ATM_INIT(rep;ipaddress , port) == (rep : BOOL & ipaddress : seq(CHAR) & ipaddress : POW(NAT*CHAR) & port : NAT));
(ATM_CONNECT(rep;?) == (rep : BOOL));
(ATM_WRITE(rep;?) == (rep : BOOL));
(ATM_READ(rep , pp;?) == (pp : NAT & rep : BOOL));
(ATM_CLOSE(rep;?) == (rep : BOOL));
(ATM_GET_TOK(tok;toksize) == (tok : TOK & toksize : NAT));
(ATM_GET_STR(ss;?) == (ss : seq(CHAR)));
(ATM_GET_FIL(rep , filesize;filename) == (filesize : NAT & rep : BOOL & filename : seq(CHAR) & filename : POW(NAT*CHAR)));
(ATM_PUT_TOK(?;tok , toksize) == (tok : TOK & toksize : NAT));
(ATM_PUT_STR(?;ss) == (ss : seq(CHAR) & ss : POW(NAT*CHAR)));
(ATM_SET_IN_PTR(?;ptr) == (ptr : NAT));
(ATM_GET_IN_PTR(ptr;?) == (ptr : NAT));
(ATM_SET_OUT_PTR(?;ptr) == (ptr : NAT));
(ATM_GET_OUT_PTR(ptr;?) == (ptr : NAT));
(ATM_GET_OUT_SIZE(sz;?) == (sz : NAT))
|
(given(TOK));
(insize : NAT);
(outsize : NAT);
(outbufsize : NAT);
(outptr : NAT);
(in : NAT);
(inptr : NAT)|
(TOK , insize , outsize)
