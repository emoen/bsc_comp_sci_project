(create_controller(cc;?) == (cc : CONTROLLER));
(hand_over(?;cc1 , cc2 , acft) == (acft : AIRCRAFT & cc1 : CONTROLLER & cc2 : CONTROLLER));
(add_aircraft(?;cc , acft) == (cc : CONTROLLER & acft : AIRCRAFT))
|
(maxcontroller : NAT);
(given(CONTROLLER));
(controllers : POW(CONTROLLER));
(controls : POW(CONTROLLER*POW(AIRCRAFT)))|
(maxcontroller)
