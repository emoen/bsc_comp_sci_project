(create_aircraft(aa;fid) == (aa : AIRCRAFT & fid : STRINGS));
(id_of(fid;aa) == (fid : STRINGS & aa : AIRCRAFT))
|
(maxaircraft : NAT);
(given(AIRCRAFT));
(given(STRINGS));
(aircraft : POW(AIRCRAFT));
(flight_id : POW(AIRCRAFT*STRINGS))|
(maxaircraft)
