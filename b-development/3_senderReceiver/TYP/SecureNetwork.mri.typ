(receive(mm , ok;?) == (ok : BOOL & mm : MESSAGE));
(send(ok;mm) == (ok : BOOL & mm : MESSAGE))
|
(given(MESSAGE));
(msg : POW(NAT*MESSAGE));
(msg : seq(MESSAGE))|
(?)
