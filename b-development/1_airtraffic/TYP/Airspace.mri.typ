(create_airspace(as;maxacft , cont) == (as : AIRSPACE & maxacft : NAT & cont : CONTROLLER));
(do_aircraft_arrives(?;as , acft) == (as : AIRSPACE & acft : AIRCRAFT));
(transfer_aircraft(?;as1 , as2 , acft) == (acft : AIRCRAFT & as1 : AIRSPACE & as2 : AIRSPACE))
|
(maxairspace : NAT);
(given(AIRSPACE));
(airspaces : POW(AIRSPACE));
(city_regions : POW(AIRSPACE));
(military_zones : POW(AIRSPACE));
(airport_zones : POW(AIRSPACE));
(assigned : POW(AIRSPACE*CONTROLLER));
(occupied_by : POW(AIRSPACE*POW(AIRCRAFT)));
(maxholding : POW(AIRSPACE*NAT))|
(maxairspace)
