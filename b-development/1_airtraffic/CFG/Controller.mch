MACHINE           Controller(maxcontroller)

USES 
	Aircraft

SETS
	CONTROLLER

PROPERTIES
	card(CONTROLLER) = maxcontroller
	
VARIABLES   
	controllers, controls

INVARIANT         
  controllers <: CONTROLLER &
	controls : controllers --> FIN(aircraft) &    
	!(cc1, cc2).(cc1 : controllers &
		cc2 : controllers & cc1 /= cc2 =>
			controls(cc1) /\ controls(cc2) = {})

INITIALISATION    
	controllers := {} || controls := {}

OPERATIONS

	cc <-- create_controller =
		PRE
			controllers /= CONTROLLER
		THEN
			ANY oo
			WHERE
				oo : CONTROLLER - controllers
			THEN
				controllers := controllers \/ {oo} ||
				cc := oo ||
				controls(oo) := {}
			END
		END;
		
	hand_over(cc1, cc2, acft) =
		PRE
			cc1 : controllers & cc2 : controllers &
			cc1 /= cc2 &
			acft : aircraft &
			acft : controls(cc1)
		THEN
			controls := controls <+ {cc1 |-> (controls(cc1) - {acft}), 
																cc2 |-> (controls(cc2) \/ {acft}) }
		END;
		
	add_aircraft(cc, acft) =
		PRE
			cc : controllers &
			acft : aircraft &
			 not(acft : union(ran(controls)))
		THEN
			controls(cc) := controls(cc) /\ {acft}
		END
END
