MACHINE           
	wrapController(maxcontroller)

USES
	Aircraft

SETS
	CONTROLLER

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

END
