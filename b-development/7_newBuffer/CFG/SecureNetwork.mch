
MACHINE  
	SecureNetwork

SETS	
	MESSAGE

USES
	Bool_TYPE

DEFINITIONS
	maxSize == 100

VARIABLES
	msg

INVARIANT
	msg : seq(MESSAGE) &
	card(msg) <= maxSize

INITIALISATION
	msg := {}

OPERATIONS

  mm, ok <-- receive =
	BEGIN
		IF card(msg) > 0 THEN
			mm := first(msg) ||
			ok := TRUE
		ELSE 	ok := FALSE
		END
	END;

  ok <-- send(mm : MESSAGE) =
	IF card(msg) < maxSize THEN
		msg := msg <- mm ||
		ok := TRUE
	ELSE	ok := FALSE
	END
END
/*
unproved
...
pre(send)
=>
( card(msg) < 100
	=>
	card(msg <- mm) <= 100 )
*/
