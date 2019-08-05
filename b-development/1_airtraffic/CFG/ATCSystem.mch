MACHINE           ATCSystem(maxairspace, maxaircraft)

EXTENDS	
	Aircraft(maxaircraft)
	
INCLUDES	
	Airspace(maxairspace), Controller(maxairspace*2)
	
PROMOTES 
	create_controller, create_airspace

INVARIANT         
	!(acft, as).(acft: aircraft & as: airspaces &
		acft : occupied_by(as) =>
			acft : controls(assigned(as)) )							

OPERATIONS

  hand_over_aircraft(as1_, as2_, acft_) =
	PRE
		as1_ : airspaces & as2_ : airspaces &
		acft_ : aircraft &
		as1_ /= as2_ &
		acft_: occupied_by(as1_) &
		card(occupied_by(as2_)) < maxholding(as2_)
	THEN
		hand_over(assigned(as1_), assigned(as2_), acft_) || 
		transfer_aircraft(as1_, as2_, acft_)
	END;
		
  aircraft_arrives(as, acft) =
	PRE
		acft : aircraft &
		as : airspaces &
		acft /: union(ran(occupied_by)) &
		acft /: union(ran(controls)) &
		card(occupied_by(as)) < maxholding(as) 
	THEN
		do_aircraft_arrives(as, acft) ||
		add_aircraft(assigned(as), acft)
	END
END
