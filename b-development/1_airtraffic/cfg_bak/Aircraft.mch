MACHINE           Aircraft(maxaircraft)

SETS
	AIRCRAFT; STRINGS
	
PROPERTIES
	card(AIRCRAFT) = maxaircraft
	
VARIABLES         
	aircraft, flight_id

INVARIANT  
		maxaircraft : NAT1 &       
		aircraft <: AIRCRAFT &
		flight_id : aircraft --> STRINGS

INITIALISATION    
	aircraft, flight_id := {}, {}

OPERATIONS

  aa <-- create_aircraft(fid) =
		PRE 
			fid : STRINGS &
			aircraft /= AIRCRAFT
		THEN
			ANY oo
			WHERE oo: AIRCRAFT - aircraft
			THEN
				aa := oo ||
				aircraft := aircraft \/ {oo} ||
				flight_id(oo) := fid
			END
		END;
	
	fid <-- id_of(aa) =
		PRE
			aa : aircraft
		THEN
			fid := flight_id(aa)
		END
END
