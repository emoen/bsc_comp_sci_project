MACHINE           Airspace(maxairspace)

USES
	Aircraft, Controller
/*	
INCLUDES
	Controller(maxairspace * 2)
*/
SETS
	AIRSPACE
	
PROPERTIES
	card(AIRSPACE) = maxairspace

VARIABLES         
	airspaces, maxholding, occupied_by, assigned,
	airport_zones, military_zones, city_regions

INVARIANT         
	airspaces <: AIRSPACE &
	airport_zones <: airspaces &
	military_zones <: airspaces &
	city_regions <: airspaces &
	
	airport_zones \/ military_zones \/ city_regions = airspaces &
	airport_zones /\ military_zones = {}&
	airport_zones /\ city_regions = {}&
	military_zones /\ city_regions = {}&
	
	maxholding: airspaces --> NAT &
	occupied_by : airspaces --> FIN(aircraft) &
	assigned : airspaces >-> controllers &
	
	!(as1, as2).(as1 : airspaces & as2 : airspaces &
						as1 /= as2 =>
							occupied_by(as1) /\ occupied_by(as2) = {})&
	!as.(as: airspaces => card(occupied_by(as)) <= maxholding(as))

INITIALISATION    
	airspaces := {} || maxholding := {} || occupied_by := {} ||
	assigned := {} || city_regions := {} || military_zones := {} || 
	airport_zones := {}

OPERATIONS

	as <-- create_airspace(maxacft, cont) =
		PRE
			maxacft : NAT &
			cont : controllers &
			airspaces /= AIRSPACE
		THEN
			ANY oo
			WHERE oo : AIRSPACE - airspaces
			THEN	
				as := oo ||
				maxholding(oo) := maxacft ||
				occupied_by(oo) := {} ||
				assigned(oo) := cont ||
				airspaces := airspaces \/ {oo} ||
				airport_zones := airport_zones \/ {oo}
			END
		END;
 
 	do_aircraft_arrives(as, acft) =
		PRE
			acft : aircraft &
			as : airspaces &
			acft /: union(ran(occupied_by)) &
			acft /: union(ran(controls)) &
			card(occupied_by(as)) < maxholding(as) 
		THEN
			occupied_by(as) := occupied_by(as) /\ {acft} 
		/*	add_aircraft(assigned(as), acft)*/
		END;
		
	transfer_aircraft(as1, as2, acft) =
		PRE
			as1 : airspaces & as2 : airspaces & acft : aircraft &
			as1 /= as2 &
			acft : occupied_by(as1)
		THEN
			occupied_by := occupied_by +> {as1 |-> (occupied_by(as1) - {acft}),
																			as2 |-> (occupied_by(as2) \/ {acft}) }
		END
END
