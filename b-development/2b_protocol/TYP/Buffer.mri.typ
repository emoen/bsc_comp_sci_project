(binit(?;?) == ?);
(add(ok;ee) == (ok : BOOL & ee : ITEM));
(initial(ok , oo;?) == (oo : ITEM & ok : BOOL));
(remove(ok;?) == (ok : BOOL))
|
(given(ITEM));
(maxsize : NAT);
(contents : POW(NAT*ITEM));
(contents : seq(ITEM))|
(ITEM , maxsize)
