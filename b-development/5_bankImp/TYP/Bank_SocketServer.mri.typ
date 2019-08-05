(Bank_INIT(rep;lockfile , port , bufsavefile) == (rep : BOOL & lockfile : seq(CHAR) & lockfile : POW(NAT*CHAR) & port : NAT & bufsavefile : seq(CHAR) & bufsavefile : POW(NAT*CHAR)));
(Bank_ACCEPT(rep;?) == (rep : BOOL));
(Bank_READ(rep , pp;?) == (pp : NAT & rep : BOOL));
(Bank_WRITE(rep;?) == (rep : BOOL));
(Bank_CLOSE(rep;?) == (rep : BOOL));
(Bank_GET_TOK(tok;toksize) == (tok : TOK & toksize : NAT));
(Bank_GET_STR(ss;?) == (ss : seq(CHAR)));
(Bank_PUT_TOK(?;tok , toksize) == (tok : TOK & toksize : NAT));
(Bank_PUT_STR(?;ss) == (ss : seq(CHAR) & ss : POW(NAT*CHAR)));
(Bank_SET_IN_PTR(?;ptr) == (ptr : NAT));
(Bank_GET_IN_PTR(ptr;?) == (ptr : NAT));
(Bank_SET_OUT_PTR(?;ptr) == (ptr : NAT));
(Bank_GET_OUT_PTR(ptr;?) == (ptr : NAT));
(Bank_GET_OUT_SIZE(sz;?) == (sz : NAT));
(Bank_PUT_FILE(rep;filename) == (rep : BOOL & filename : seq(CHAR) & filename : POW(NAT*CHAR)));
(Bank_SAV_BUF(rep , num_saves;?) == (num_saves : NAT & rep : BOOL));
(Bank_SAV_RMV(?;?) == ?);
(Bank_RST_BUF(rep;?) == (rep : BOOL));
(Bank_NXT_BUF(rep;?) == (rep : BOOL))
|
(given(TOK));
(insize : NAT);
(outsize : NAT);
(outbufsize : NAT);
(no_of_saves : NAT);
(outptr : NAT);
(in : NAT);
(inptr : NAT)|
(TOK , insize , outsize)
