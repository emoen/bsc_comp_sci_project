(given(STATE));
(given_enum(STATE(idle , conpending , conrequest , have_report , connected)));
(idle : STATE);
(conpending : STATE);
(conrequest : STATE);
(have_report : STATE);
(connected : STATE);
(given(MESSAGES));
(given_enum(MESSAGES(con , true , false)));
(con : MESSAGES);
(true : MESSAGES);
(false : MESSAGES);
(buffsize : NAT)|
(?)
