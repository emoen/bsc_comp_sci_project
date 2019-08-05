(cinit(?;?) == ?);
(client_con_request(ok;?) == (ok : BOOL));
(client_con_report(ok;response) == (ok : BOOL & response : BOOL));
(query_cstate(state;?) == (state : STATE))
|
(clientstate : STATE)|
(?)
