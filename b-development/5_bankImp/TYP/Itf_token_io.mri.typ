(Itf_GET_TOK(tt;?) == (tt : TOKEN));
(Itf_GET_PROMPT_TOK(tt;ss) == (tt : TOKEN & ss : seq(CHAR) & ss : POW(NAT*CHAR)));
(Itf_PUT_TOK(?;tt) == (tt : TOKEN));
(Itf_GET_ACT_TOK(tt;SS) == (tt : TOKEN & SS : POW(TOKEN)));
(Itf_GET_PROMPT_ACT_TOK(tt;SS , ss) == (tt : TOKEN & SS : POW(TOKEN) & ss : seq(CHAR) & ss : POW(NAT*CHAR)));
(Itf_PUT_ACT_TOK(?;SS , tt) == (tt : TOKEN & SS : POW(TOKEN)))
|
(given(TOKEN))|
(TOKEN)
