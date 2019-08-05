(hand_over_aircraft(?;as1_ , as2_ , acft_) == (acft_ : AIRCRAFT & as1_ : AIRSPACE & as2_ : AIRSPACE));
(aircraft_arrives(?;as , acft) == (as : AIRSPACE & acft : AIRCRAFT));
(create_aircraft(aa;fid) == (fid : STRINGS & aa : AIRCRAFT));
(id_of(fid;aa) == (aa : AIRCRAFT & fid : STRINGS));
(create_controller(cc;?) == (cc : CONTROLLER));
(create_airspace(as;maxacft , cont) == (cont : CONTROLLER & maxacft : NAT & as : AIRSPACE))
|
(maxairspace : NAT);
(maxaircraft : NAT);
(given(AIRCRAFT));
(given(STRINGS));
(given(AIRSPACE));
(given(CONTROLLER));
(aircraft : POW(AIRCRAFT));
(flight_id : POW(AIRCRAFT*STRINGS));
(airspaces : POW(AIRSPACE));
(city_regions : POW(AIRSPACE));
(military_zones : POW(AIRSPACE));
(airport_zones : POW(AIRSPACE));
(assigned : POW(AIRSPACE*CONTROLLER));
(occupied_by : POW(AIRSPACE*POW(AIRCRAFT)));
(maxholding : POW(AIRSPACE*NAT));
(maxairspace*2 : NAT);
(controllers : POW(CONTROLLER));
(controls : POW(CONTROLLER*POW(AIRCRAFT)))|
(maxairspace , maxaircraft)
